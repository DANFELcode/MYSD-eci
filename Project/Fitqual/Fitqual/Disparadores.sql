------------------
-- DISPARADORES 
-- Definición de disparadores
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
-- Reemplazan las CHECK constraints que no pueden usar SYSDATE
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

commit;