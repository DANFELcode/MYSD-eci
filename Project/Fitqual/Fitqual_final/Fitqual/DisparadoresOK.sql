------------------
--DisparadoresOK
--Ingreso de datos usando la automatización definida en los disparadores.
------------------



-- 1. PRUEBA TRIGGER MEMBRESÍA: Usuario con fecha fin expirada (debe auto-desactivarse)
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (400, 'Usuario Membresía Expirada', 'membresia.expirada@email.com', 'pass123', 'Usuario');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc, 
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (400, 'Test trigger', 'Intermedio', 4, 30, 'M', 75.0, 1.75, NULL,
        DATE '2023-01-01', '1', DATE '2023-12-31'); -- Fecha expirada

DELETE FROM Usuarios 
WHERE id_persona = 400;

commit;

-- Verificación: El trigger debe cambiar membresia_activa a '0' automáticamente


-- 2. PRUEBA TRIGGER FECHA FIN: Usuario solo con fecha inicio (debe calcular fecha fin +1 año)
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (401, 'Usuario Fecha Auto', 'fecha.auto@email.com', 'pass123', 'Usuario');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc,  
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (401, 'Test fecha auto', 'Básico', 3, 25, 'F', 60.0, 1.65, 25, 
        SYSDATE, '1', NULL); -- Sin fecha fin
commit;

-- Verificación: El trigger debe calcular fecha_fin_membresia = fecha_inicio + 1 año


-- 3. PRUEBA TRIGGER IMC: Usuario con peso y altura (debe calcular IMC automáticamente)
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (402, 'Usuario IMC Auto', 'imc.auto@email.com', 'pass123', 'Usuario');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc,
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (402, 'Test IMC', 'Intermedio', 4, 28, 'M', 80.0, 1.80, NULL,
        SYSDATE, '1', NULL);

-- Verificación: El trigger debe calcular IMC = 24.69 automáticamente


-- 4. PRUEBA TRIGGER CONTADOR CONSEJOS: Especialista crea recomendación (debe incrementar contador)
INSERT INTO EspecialistasFitness (id_persona, especialidad, descripcion_perfil, trayectoria_profesional, consejos_publicados)
VALUES (5, 'Nutrición Deportiva', 'Especialista en planes nutricionales personalizados.', '5 años ayudando a atletas a mejorar su rendimiento.', 0);

INSERT INTO Recomendaciones (id_recomendacion, especialista_fitness, contenido, fecha_creacion, tipo_enfoque)
VALUES (400, 5, 'Recomendación de prueba para trigger', SYSDATE, 'Nutrición');

commit;
-- Verificación: El trigger debe incrementar consejos_publicados del especialista 5 en +1


-- 5. PRUEBA TRIGGER FEEDBACK: Feedback nuevo (puede ser modificado dentro de 24 horas)
INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad)
VALUES (400, 1, 'Feedback prueba trigger', SYSDATE, 5, 'Sistema', 'Público');

-- Actualización dentro de 24 horas (debe permitirse)
UPDATE Feedbacks 
SET contenido = 'Feedback modificado exitosamente' 
WHERE id_feedback = 400;

commit;