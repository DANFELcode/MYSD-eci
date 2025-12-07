------------------
-- SECUENCIAS PARA AUTO-INCREMENT
------------------
CREATE SEQUENCE seq_personas START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_feedbacks START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_recomendaciones START WITH 10401 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_objetivos START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_progresos START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_planes START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_rutinas START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_comidas START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_habitos START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_ejercicios START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_rutinas_ejemplo START WITH 20000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_ejercicios_ejemplo START WITH 20000 INCREMENT BY 1 NOCACHE;


------------------
-- TRIGGERS DE AUTO-INCREMENT
------------------

-- Auto-increment para Personas
CREATE OR REPLACE TRIGGER TR_AI_PERSONAS
BEFORE INSERT ON Personas
FOR EACH ROW
BEGIN
    IF :NEW.id_persona IS NULL THEN
        :NEW.id_persona := seq_personas.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Feedbacks
CREATE OR REPLACE TRIGGER TR_AI_FEEDBACKS
BEFORE INSERT ON Feedbacks
FOR EACH ROW
BEGIN
    IF :NEW.id_feedback IS NULL THEN
        :NEW.id_feedback := seq_feedbacks.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Recomendaciones
CREATE OR REPLACE TRIGGER TR_AI_RECOMENDACIONES
BEFORE INSERT ON Recomendaciones
FOR EACH ROW
BEGIN
    IF :NEW.id_recomendacion IS NULL THEN
        :NEW.id_recomendacion := seq_recomendaciones.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Objetivos
CREATE OR REPLACE TRIGGER TR_AI_OBJETIVOS
BEFORE INSERT ON Objetivos
FOR EACH ROW
BEGIN
    IF :NEW.id_objetivo IS NULL THEN
        :NEW.id_objetivo := seq_objetivos.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Progresos
CREATE OR REPLACE TRIGGER TR_AI_PROGRESOS
BEFORE INSERT ON Progresos
FOR EACH ROW
BEGIN
    IF :NEW.id_progreso IS NULL THEN
        :NEW.id_progreso := seq_progresos.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para PlanesFitness
CREATE OR REPLACE TRIGGER TR_AI_PLANESFITNESS
BEFORE INSERT ON PlanesFitness
FOR EACH ROW
BEGIN
    IF :NEW.id_plan IS NULL THEN
        :NEW.id_plan := seq_planes.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Rutinas
CREATE OR REPLACE TRIGGER TR_AI_RUTINAS
BEFORE INSERT ON Rutinas
FOR EACH ROW
BEGIN
    IF :NEW.id_rutina IS NULL THEN
        :NEW.id_rutina := seq_rutinas.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Comidas
CREATE OR REPLACE TRIGGER TR_AI_COMIDAS
BEFORE INSERT ON Comidas
FOR EACH ROW
BEGIN
    IF :NEW.id_comida IS NULL THEN
        :NEW.id_comida := seq_comidas.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Habitos
CREATE OR REPLACE TRIGGER TR_AI_HABITOS
BEFORE INSERT ON Habitos
FOR EACH ROW
BEGIN
    IF :NEW.id_habito IS NULL THEN
        :NEW.id_habito := seq_habitos.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para Ejercicios (CORREGIDO para clave compuesta)
-- IMPORTANTE: id_ejercicio debe ser único POR RUTINA, no globalmente
CREATE OR REPLACE TRIGGER TR_AI_EJERCICIOS
BEFORE INSERT ON Ejercicios
FOR EACH ROW
DECLARE
    v_max_id NUMBER;
BEGIN
    IF :NEW.id_ejercicio IS NULL THEN
        -- Buscar el máximo id_ejercicio para ESTA rutina específica
        SELECT NVL(MAX(id_ejercicio), 0) + 1 
        INTO v_max_id
        FROM Ejercicios 
        WHERE id_rutina = :NEW.id_rutina;
        
        :NEW.id_ejercicio := v_max_id;
    END IF;
END;
/

-- Auto-increment para RutinasDeEjemplo
CREATE OR REPLACE TRIGGER TR_AI_RUTINAS_EJEMPLO
BEFORE INSERT ON RutinasDeEjemplo
FOR EACH ROW
BEGIN
    IF :NEW.id_rutina_ejemplo IS NULL THEN
        :NEW.id_rutina_ejemplo := seq_rutinas_ejemplo.NEXTVAL;
    END IF;
END;
/

-- Auto-increment para EjerciciosDeRutinasDeEjemplo (CORREGIDO para clave compuesta)
-- IMPORTANTE: id_ejercicio_ejemplo debe ser único POR RUTINA_EJEMPLO, no globalmente
CREATE OR REPLACE TRIGGER TR_AI_EJERCICIOS_EJEMPLO
BEFORE INSERT ON EjerciciosDeRutinasDeEjemplo
FOR EACH ROW
DECLARE
    v_max_id NUMBER;
BEGIN
    IF :NEW.id_ejercicio_ejemplo IS NULL THEN
        -- Buscar el máximo id_ejercicio_ejemplo para ESTA rutina de ejemplo específica
        SELECT NVL(MAX(id_ejercicio_ejemplo), 0) + 1 
        INTO v_max_id
        FROM EjerciciosDeRutinasDeEjemplo 
        WHERE id_rutina_ejemplo = :NEW.id_rutina_ejemplo;
        
        :NEW.id_ejercicio_ejemplo := v_max_id;
    END IF;
END;
/


------------------
-- DISPARADORES DE LÓGICA DE NEGOCIO
------------------

-- 1. DISPARADOR PARA ACTUALIZACIÓN AUTOMÁTICA DE MEMBRESÍA
CREATE OR REPLACE TRIGGER TR_ACTUALIZAR_ESTADO_MEMBRESIA
BEFORE INSERT OR UPDATE ON Usuarios
FOR EACH ROW
BEGIN
    -- Si la fecha de fin de membresía ya pasó, desactivar membresía
    IF :NEW.fecha_fin_membresia IS NOT NULL AND :NEW.fecha_fin_membresia < SYSDATE THEN
        :NEW.membresia_activa := '0';
    END IF;
    
    -- Si está activando membresía y no tiene fecha fin, establecer por defecto
    IF :NEW.membresia_activa = '1' AND :NEW.fecha_fin_membresia IS NULL AND :NEW.fecha_inicio_membresia IS NOT NULL THEN
        :NEW.fecha_fin_membresia := ADD_MONTHS(:NEW.fecha_inicio_membresia, 12); -- 1 año
    END IF;
END;
/

-- 2. DISPARADOR PARA CALCULAR FECHA FIN DE MEMBRESÍA (1 AÑO)
CREATE OR REPLACE TRIGGER TR_CALCULAR_FECHA_FIN_MEMBRESIA
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
    -- Si tiene fecha inicio pero no fecha fin, calcular 1 año después
    IF :NEW.fecha_inicio_membresia IS NOT NULL AND :NEW.fecha_fin_membresia IS NULL THEN
        :NEW.fecha_fin_membresia := ADD_MONTHS(:NEW.fecha_inicio_membresia, 12);
    END IF;
END;
/

-- 3. DISPARADOR PARA CALCULAR AUTOMÁTICAMENTE IMC
CREATE OR REPLACE TRIGGER TR_CALCULAR_IMC_USUARIOS
BEFORE INSERT OR UPDATE OF peso, altura ON Usuarios
FOR EACH ROW
BEGIN
    -- Solo calcular si ambos datos (peso y altura) están presentes
    IF :NEW.peso IS NOT NULL AND :NEW.altura IS NOT NULL THEN
        :NEW.imc := ROUND(:NEW.peso / (:NEW.altura * :NEW.altura), 2);
    END IF;
END;
/

-- 4. DISPARADOR PARA CONTADOR DE CONSEJOS DEL ESPECIALISTA
CREATE OR REPLACE TRIGGER TR_INCREMENTAR_CONSEJOS_ESPECIALISTA
AFTER INSERT ON Recomendaciones
FOR EACH ROW
BEGIN
    UPDATE EspecialistasFitness
    SET consejos_publicados = NVL(consejos_publicados, 0) + 1
    WHERE id_persona = :NEW.especialista_fitness;
END;
/

-- 5. DISPARADOR PARA INMUTABILIDAD DE FEEDBACK
CREATE OR REPLACE TRIGGER TR_BLOQUEAR_MODIFICACION_FEEDBACK
BEFORE UPDATE ON Feedbacks
FOR EACH ROW
BEGIN
    -- Bloquear modificación si el feedback tiene más de 24 horas
    IF (SYSDATE - :OLD.fecha) > 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se puede modificar un feedback después de 24 horas de publicado');
    END IF;
END;
/

------------------
-- TRIGGERS PARA VALIDACIÓN DE FECHAS NO FUTURAS
------------------

-- 1. Trigger para Feedbacks
CREATE OR REPLACE TRIGGER TR_VALIDAR_FECHA_FEEDBACK
BEFORE INSERT OR UPDATE ON Feedbacks
FOR EACH ROW
BEGIN
    IF :NEW.fecha > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'La fecha del feedback no puede ser futura');
    END IF;
END;
/

-- 2. Trigger para Objetivos
CREATE OR REPLACE TRIGGER TR_VALIDAR_FECHA_OBJETIVO
BEFORE INSERT OR UPDATE ON Objetivos
FOR EACH ROW
BEGIN
    IF :NEW.fecha_creacion > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20003, 'La fecha de creación del objetivo no puede ser futura');
    END IF;
END;
/

-- 3. Trigger para Progresos
CREATE OR REPLACE TRIGGER TR_VALIDAR_FECHA_PROGRESO
BEFORE INSERT OR UPDATE ON Progresos
FOR EACH ROW
BEGIN
    IF :NEW.fecha_registro > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20004, 'La fecha de registro del progreso no puede ser futura');
    END IF;
END;
/

------------------
-- TRIGGERS PARA INMUTABILIDAD DE CAMPOS
------------------

-- No se puede modificar id_recomendacion ni especialista_fitness
CREATE OR REPLACE TRIGGER trg_recomendaciones_no_modificar
BEFORE UPDATE ON Recomendaciones
FOR EACH ROW
BEGIN
    IF :OLD.id_recomendacion != :NEW.id_recomendacion THEN
        RAISE_APPLICATION_ERROR(-20202, 'No se puede modificar el id_recomendacion');
    END IF;
    
    IF :OLD.especialista_fitness != :NEW.especialista_fitness THEN
        RAISE_APPLICATION_ERROR(-20203, 'No se puede modificar el especialista_fitness');
    END IF;
END;
/

-- No se puede modificar id_rutina_ejemplo ni especialista_fitness
CREATE OR REPLACE TRIGGER trg_rutinasejemplo_no_modificar
BEFORE UPDATE ON RutinasDeEjemplo
FOR EACH ROW
BEGIN
    IF :OLD.id_rutina_ejemplo != :NEW.id_rutina_ejemplo THEN
        RAISE_APPLICATION_ERROR(-20204, 'No se puede modificar el id_rutina_ejemplo');
    END IF;
    
    IF :OLD.especialista_fitness != :NEW.especialista_fitness THEN
        RAISE_APPLICATION_ERROR(-20205, 'No se puede modificar el especialista_fitness');
    END IF;
END;
/

-- No se puede modificar id_objetivo, usuario, ni fecha_creacion
CREATE OR REPLACE TRIGGER trg_objetivos_no_modificar
BEFORE UPDATE ON Objetivos
FOR EACH ROW
BEGIN
    IF :OLD.id_objetivo != :NEW.id_objetivo THEN
        RAISE_APPLICATION_ERROR(-20206, 'No se puede modificar el id_objetivo');
    END IF;
    
    IF :OLD.usuario != :NEW.usuario THEN
        RAISE_APPLICATION_ERROR(-20207, 'No se puede modificar el usuario');
    END IF;
    
    IF :OLD.fecha_creacion != :NEW.fecha_creacion THEN
        RAISE_APPLICATION_ERROR(-20208, 'No se puede modificar la fecha_creacion');
    END IF;
END;
/

COMMIT;

-- =====================================================
-- Triggers faltantes para completar reglas de negocio
-- =====================================================

-- 1. TRIGGER: No se puede modificar id_persona en Personas
CREATE OR REPLACE TRIGGER trg_personas_no_modificar
BEFORE UPDATE ON Personas
FOR EACH ROW
BEGIN
    IF :OLD.id_persona != :NEW.id_persona THEN
        RAISE_APPLICATION_ERROR(-20209, 'No se puede modificar el id_persona');
    END IF;
END;
/

-- 2. TRIGGER: Asignar fecha_creacion = SYSDATE automáticamente en Objetivos
CREATE OR REPLACE TRIGGER trg_asignar_fecha_objetivo
BEFORE INSERT ON Objetivos
FOR EACH ROW
BEGIN
    -- Si no se proporciona fecha_creacion, asignar la fecha actual del sistema
    IF :NEW.fecha_creacion IS NULL THEN
        :NEW.fecha_creacion := SYSDATE;
    END IF;
END;
/



-- =====================================================
-- VALIDACIONES DE PROPIETARIO (Opcional)
-- =====================================================
-- Las reglas de "solo el propietario puede modificar" se pueden
-- implementar con triggers, pero es MÁS RECOMENDABLE manejarlas
-- en los paquetes PA_USUARIO y PA_ESPECIALISTA_FITNESS

-- Si aún quieres implementarlas con triggers, aquí están:

-- TRIGGER: Solo el propietario puede modificar Objetivos
CREATE OR REPLACE TRIGGER trg_validar_propietario_objetivo
BEFORE UPDATE ON Objetivos
FOR EACH ROW
DECLARE
    v_usuario_actual NUMBER;
BEGIN
    -- Obtener el usuario actual del contexto
    v_usuario_actual := SYS_CONTEXT('USERENV', 'CLIENT_IDENTIFIER');
    
    -- Validar que el usuario actual sea el propietario
    IF v_usuario_actual IS NOT NULL AND v_usuario_actual != :OLD.usuario THEN
        RAISE_APPLICATION_ERROR(-20210, 'Solo el usuario propietario puede modificar este objetivo');
    END IF;
END;
/

-- TRIGGER: Solo el propietario puede modificar Planes Fitness
CREATE OR REPLACE TRIGGER trg_validar_propietario_plan
BEFORE UPDATE ON PlanesFitness
FOR EACH ROW
DECLARE
    v_usuario_actual NUMBER;
    v_es_propietario NUMBER;
BEGIN
    -- Obtener el usuario actual del contexto
    v_usuario_actual := SYS_CONTEXT('USERENV', 'CLIENT_IDENTIFIER');
    
    -- Verificar si el usuario actual es propietario del plan
    IF v_usuario_actual IS NOT NULL THEN
        SELECT COUNT(*) INTO v_es_propietario
        FROM PlanesFitnessDeUsuarios
        WHERE planfitness = :OLD.id_plan AND usuario = v_usuario_actual;
        
        IF v_es_propietario = 0 THEN
            RAISE_APPLICATION_ERROR(-20211, 'Solo el usuario propietario puede modificar este plan fitness');
        END IF;
    END IF;
END;
/

COMMIT;

-- =====================================================
-- NOTAS IMPORTANTES:
-- =====================================================
/*
1. Los triggers de validación de propietario usan SYS_CONTEXT('USERENV', 'CLIENT_IDENTIFIER')
   que debe ser establecido por la aplicación usando:
   DBMS_SESSION.SET_IDENTIFIER('id_usuario');

2. La asociación automática de plan a usuario es MEJOR manejarla en el
   procedimiento AD_PLANFITNESS del PA_USUARIO en lugar de usar trigger.

3. Si no quieres usar contexto de aplicación, elimina los triggers de
   validación de propietario y maneja esa lógica en los paquetes PA_.
*/