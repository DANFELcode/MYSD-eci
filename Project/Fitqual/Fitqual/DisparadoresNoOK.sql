
------------------
--DisparadoresNoOK
--Intento de ingreso de datos erroneos protegidos por las restricciones de los disparadores.
------------------

-- 1. Preparar datos base necesarios
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (403, 'Usuario Feedback Viejo', 'feedback.viejo@email.com', 'pass123', 'Usuario');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc,
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (403, 'Test feedback', 'Básico', 3, 22, 'F', 55.0, 1.60, NULL, SYSDATE, '1', NULL);

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad)
VALUES (401, 403, 'Feedback muy antiguo', DATE '2024-01-01', 3, 'Sistema', 'Público');

-- 2. VIOLACIÓN TRIGGER FEEDBACK: Intentar modificar feedback después de 24 horas
-- Esta actualización debe fallar por el trigger TR_BLOQUEAR_MODIFICACION_FEEDBACK
UPDATE Feedbacks 
SET contenido = 'Intento modificar feedback antiguo' 
WHERE id_feedback = 401;

-- 3. VIOLACIÓN TRIGGER MEMBRESÍA: Usuario con fecha fin expirada pero activo
-- El trigger debe auto-desactivarlo, pero probamos el comportamiento
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (404, 'Usuario Expirado Activo', 'expirado.activo@email.com', 'pass123', 'Usuario');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc,
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (404, 'Test expirado', 'Básico', 3, 26, 'M', 70.0, 1.75, NULL, 
        DATE '2023-01-01', '1', DATE '2023-12-31');