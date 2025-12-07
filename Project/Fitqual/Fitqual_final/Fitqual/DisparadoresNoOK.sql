
------------------
-- DisparadoresNoOK
-- Intento de ingreso de datos erróneos protegidos por las restricciones de los disparadores.
------------------

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('PRUEBAS DE VIOLACIÓN DE TRIGGERS');
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('');
END;
/


-- 1. Preparar datos base necesarios
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (404, 'Usuario Feedback Viejo', 'feedback.viejo@email.com', 'pass123', 'Usuario');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc,
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (404, 'Test feedback', 'Básico', 3, 22, 'F', 55.0, 1.60, NULL, SYSDATE, '1', NULL);

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad)
VALUES (401, 404, 'Feedback muy antiguo', DATE '2024-01-01', 3, 'Sistema', 'Público');

COMMIT;

-- 2. VIOLACIÓN TRIGGER FEEDBACK: Intentar modificar feedback después de 24 horas
-- Esta actualización DEBE FALLAR por el trigger TR_BLOQUEAR_MODIFICACION_FEEDBACK
BEGIN
    DBMS_OUTPUT.PUT_LINE('Prueba 1: Modificar feedback antiguo (>24h)');
    
    UPDATE Feedbacks 
    SET contenido = 'Intento modificar feedback antiguo' 
    WHERE id_feedback = 401;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✗ ERROR: El trigger debió rechazar esta modificación');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('✓ CORRECTO: Trigger bloqueó la modificación');
        DBMS_OUTPUT.PUT_LINE('   Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('');
END;
/


-- 3. VIOLACIÓN TRIGGER FECHA FUTURA: Intentar crear objetivo con fecha futura
BEGIN
    DBMS_OUTPUT.PUT_LINE('Prueba 2: Crear objetivo con fecha futura');
    
    INSERT INTO Objetivos (id_objetivo, usuario, nombre, contenido, fecha_creacion)
    VALUES (500, 404, 'Objetivo futuro', 'Este objetivo es del futuro', DATE '2026-12-31');
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✗ ERROR: El trigger debió rechazar esta fecha futura');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('✓ CORRECTO: Trigger rechazó fecha futura');
        DBMS_OUTPUT.PUT_LINE('   Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('');
END;
/


-- 4. VIOLACIÓN TRIGGER FECHA FUTURA: Intentar crear progreso con fecha futura
BEGIN
    DBMS_OUTPUT.PUT_LINE('Prueba 3: Crear progreso con fecha futura');
    
    INSERT INTO Progresos (id_progreso, usuario, peso_actual, fecha_registro)
    VALUES (500, 404, 70.0, DATE '2026-06-01');
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✗ ERROR: El trigger debió rechazar esta fecha futura');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('✓ CORRECTO: Trigger rechazó fecha futura');
        DBMS_OUTPUT.PUT_LINE('   Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('');
END;
/


-- 5. VIOLACIÓN TRIGGER INMUTABILIDAD: Intentar cambiar usuario de un objetivo
INSERT INTO Objetivos (id_objetivo, usuario, nombre, contenido, fecha_creacion)
VALUES (501, 404, 'Objetivo inmutable', 'Objetivo para probar inmutabilidad', SYSDATE);
COMMIT;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Prueba 4: Modificar usuario de un objetivo existente');
    
    UPDATE Objetivos 
    SET usuario = 1  -- Intentar cambiar de propietario
    WHERE id_objetivo = 501;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✗ ERROR: El trigger debió rechazar el cambio de usuario');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('✓ CORRECTO: Trigger bloqueó cambio de usuario');
        DBMS_OUTPUT.PUT_LINE('   Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('');
END;
/


-- 6. VIOLACIÓN TRIGGER INMUTABILIDAD: Intentar cambiar id_persona
BEGIN
    DBMS_OUTPUT.PUT_LINE('Prueba 5: Modificar id_persona de una persona');
    
    UPDATE Personas 
    SET id_persona = 999
    WHERE id_persona = 404;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✗ ERROR: El trigger debió rechazar el cambio de ID');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('✓ CORRECTO: Trigger bloqueó cambio de ID');
        DBMS_OUTPUT.PUT_LINE('   Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('');
END;
/