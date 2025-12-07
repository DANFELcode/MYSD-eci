--Saber todas las claves primarias que hay junto con su columna

SELECT 
    ut.table_name,
    uc.constraint_name AS primary_key_name,
    ucc.column_name AS primary_key_column,
    ut.num_rows,
    ut.last_analyzed
FROM user_tables ut
LEFT JOIN user_constraints uc ON ut.table_name = uc.table_name AND uc.constraint_type = 'P'
LEFT JOIN user_cons_columns ucc ON uc.constraint_name = ucc.constraint_name
ORDER BY ut.table_name;

-- Ver todas las tablas de tu usuario actual
SELECT table_name 
FROM user_tables 
ORDER BY table_name;

-- ============================================
-- SCRIPT COMPLETO DE LIMPIEZA PARA ORACLE
-- Elimina TODOS los objetos de tu esquema/usuario
-- ============================================

SET SERVEROUTPUT ON;
ALTER SESSION SET NLS_LANGUAGE='SPANISH';

BEGIN
  DBMS_OUTPUT.PUT_LINE('========================================');
  DBMS_OUTPUT.PUT_LINE('LIMPIANDO ESQUEMA ORACLE COMPLETAMENTE');
  DBMS_OUTPUT.PUT_LINE('Usuario: ' || USER);
  DBMS_OUTPUT.PUT_LINE('========================================');
END;
/

-- ============================================
-- 1. DESACTIVAR CONSTRAINTS DE REFERENCIA PRIMERO
-- ============================================
BEGIN
  FOR c IN (SELECT table_name, constraint_name 
            FROM user_constraints 
            WHERE constraint_type = 'R') LOOP
    BEGIN
      EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || 
                       ' DISABLE CONSTRAINT ' || c.constraint_name;
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;
  END LOOP;
END;
/

-- ============================================
-- 2. ELIMINAR EN ORDEN DE DEPENDENCIAS
-- ============================================
DECLARE
  TYPE obj_type IS RECORD (
    nombre VARCHAR2(128),
    tipo VARCHAR2(30)
  );
  
  TYPE obj_list IS TABLE OF obj_type;
  
  objetos obj_list := obj_list();
  
  v_counter NUMBER := 0;
BEGIN
  -- 2.1 Recopilar TODOS los objetos en orden correcto
  SELECT object_name, object_type
  BULK COLLECT INTO objetos
  FROM user_objects
  WHERE object_type NOT IN ('INDEX', 'LOB', 'TABLE PARTITION', 'INDEX PARTITION')
  AND object_name NOT LIKE 'BIN$%'  -- Excluir objetos en papelera
  AND object_name NOT LIKE 'SYS_%'  -- Excluir objetos del sistema
  ORDER BY CASE object_type
    -- Orden de eliminación: primero dependientes, luego independientes
    WHEN 'MATERIALIZED VIEW' THEN 1
    WHEN 'MATERIALIZED VIEW LOG' THEN 2
    WHEN 'JOB' THEN 3
    WHEN 'TRIGGER' THEN 4
    WHEN 'PROCEDURE' THEN 5
    WHEN 'FUNCTION' THEN 6
    WHEN 'PACKAGE BODY' THEN 7
    WHEN 'PACKAGE' THEN 8
    WHEN 'VIEW' THEN 9
    WHEN 'SEQUENCE' THEN 10
    WHEN 'SYNONYM' THEN 11
    WHEN 'TABLE' THEN 12  -- Las tablas al final
    ELSE 99
  END;
  
  -- 2.2 Eliminar objetos
  FOR i IN 1..objetos.COUNT LOOP
    BEGIN
      v_counter := v_counter + 1;
      
      -- Construir comando DROP según el tipo
      IF objetos(i).tipo = 'TABLE' THEN
        EXECUTE IMMEDIATE 'DROP TABLE "' || objetos(i).nombre || '" CASCADE CONSTRAINTS PURGE';
      ELSIF objetos(i).tipo IN ('VIEW', 'SEQUENCE', 'SYNONYM') THEN
        EXECUTE IMMEDIATE 'DROP ' || objetos(i).tipo || ' "' || objetos(i).nombre || '"';
      ELSE
        EXECUTE IMMEDIATE 'DROP ' || objetos(i).tipo || ' "' || objetos(i).nombre || '"';
      END IF;
      
      DBMS_OUTPUT.PUT_LINE('[' || v_counter || '] ✅ Eliminado ' || 
                          RPAD(objetos(i).tipo, 15) || ': ' || objetos(i).nombre);
      
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('[' || v_counter || '] ❌ Error con ' || 
                            objetos(i).tipo || ' ' || objetos(i).nombre || 
                            ': ' || SQLERRM);
    END;
  END LOOP;
  
  -- 2.3 Eliminar índices restantes
  FOR idx IN (SELECT index_name FROM user_indexes 
              WHERE index_type != 'LOB' 
              AND generated = 'N'
              AND index_name NOT LIKE 'SYS_%'
              AND index_name NOT LIKE 'BIN$%') LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DROP INDEX "' || idx.index_name || '"';
      DBMS_OUTPUT.PUT_LINE('[+] ✅ Índice: ' || idx.index_name);
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Total objetos procesados: ' || v_counter);
END;
/

-- ============================================
-- 3. VACIAR PAPELERA DE RECICLAJE DE ORACLE
-- ============================================
BEGIN
  -- Esto elimina permanentemente objetos en "RECYCLEBIN"
  EXECUTE IMMEDIATE 'PURGE RECYCLEBIN';
  DBMS_OUTPUT.PUT_LINE('✅ Papelera de reciclaje vaciada');
  
  -- Si tienes permisos DBA, también purgar la DBA_RECYCLEBIN
  BEGIN
    EXECUTE IMMEDIATE 'PURGE DBA_RECYCLEBIN';
    DBMS_OUTPUT.PUT_LINE('✅ Papelera DBA vaciada');
  EXCEPTION
    WHEN OTHERS THEN NULL;
  END;
END;
/

-- ============================================
-- 4. VERIFICACIÓN FINAL
-- ============================================
DECLARE
  v_tablas NUMBER;
  v_indices NUMBER;
  v_objetos_total NUMBER;
  v_espacio_mb NUMBER;
BEGIN
  -- Contar objetos restantes
  SELECT COUNT(*) INTO v_tablas FROM user_tables;
  SELECT COUNT(*) INTO v_indices FROM user_indexes WHERE index_name NOT LIKE 'SYS_%';
  SELECT COUNT(*) INTO v_objetos_total FROM user_objects;
  
  -- Espacio utilizado (opcional, necesita permisos)
  BEGIN
    SELECT SUM(bytes)/1024/1024 INTO v_espacio_mb
    FROM user_segments;
  EXCEPTION
    WHEN OTHERS THEN v_espacio_mb := 0;
  END;
  
  DBMS_OUTPUT.PUT_LINE(CHR(10) || '========================================');
  DBMS_OUTPUT.PUT_LINE('VERIFICACIÓN FINAL - ESQUEMA: ' || USER);
  DBMS_OUTPUT.PUT_LINE('========================================');
  DBMS_OUTPUT.PUT_LINE('Tablas restantes:           ' || v_tablas);
  DBMS_OUTPUT.PUT_LINE('Índices restantes:          ' || v_indices);
  DBMS_OUTPUT.PUT_LINE('Objetos totales restantes:  ' || v_objetos_total);
  DBMS_OUTPUT.PUT_LINE('Espacio utilizado (MB):     ' || ROUND(v_espacio_mb, 2));
  DBMS_OUTPUT.PUT_LINE('========================================');
  
  IF v_tablas = 0 AND v_objetos_total = 0 THEN
    DBMS_OUTPUT.PUT_LINE('✅ ESQUEMA COMPLETAMENTE VACÍO');
  ELSE
    DBMS_OUTPUT.PUT_LINE('⚠️  Objetos restantes encontrados');
    
    -- Mostrar objetos restantes
    FOR r IN (SELECT object_type, COUNT(*) as cnt, 
                     LISTAGG(object_name, ', ') WITHIN GROUP (ORDER BY object_name) as nombres
              FROM user_objects 
              GROUP BY object_type
              ORDER BY object_type) LOOP
      DBMS_OUTPUT.PUT_LINE('   ' || RPAD(r.object_type, 20) || ': ' || r.cnt || 
                          ' - ' || SUBSTR(r.nombres, 1, 100));
    END LOOP;
  END IF;
END;
/

-- ============================================
-- 5. RESET DE SECUENCIAS DEL SISTEMA (OPCIONAL)
-- ============================================
/*
-- Si quieres resetear contadores internos (solo desarrollo)
BEGIN
  -- Cerrar y abrir la base de datos (necesita DBA)
  -- EXECUTE IMMEDIATE 'ALTER SYSTEM CHECKPOINT';
  -- EXECUTE IMMEDIATE 'ALTER SYSTEM FLUSH BUFFER_CACHE';
  -- EXECUTE IMMEDIATE 'ALTER SYSTEM FLUSH SHARED_POOL';
  
  DBMS_OUTPUT.PUT_LINE('Sistema refrescado');
END;
/
*/

-- ============================================
-- SCRIPT DE VERIFICACIÓN RÁPIDA POST-LIMPIEZA
-- ============================================
PROMPT 
PROMPT ========================================
PROMPT VERIFICACIÓN MANUAL RÁPIDA:
PROMPT ========================================

COLUMN "TIPO DE OBJETO" FORMAT A25
COLUMN "CANTIDAD" FORMAT 999
COLUMN "EJEMPLOS" FORMAT A50

SELECT 
  object_type AS "TIPO DE OBJETO",
  COUNT(*) AS "CANTIDAD",
  LISTAGG(object_name, ', ') WITHIN GROUP (ORDER BY object_name) AS "EJEMPLOS"
FROM user_objects
GROUP BY object_type
ORDER BY object_type;

PROMPT 
PROMPT Tablas existentes:
SELECT table_name FROM user_tables ORDER BY table_name;

commit;