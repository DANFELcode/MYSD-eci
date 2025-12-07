------------------
-- TuplasOK
-- Inserciones que cumplen las restricciones de tuplas
------------------

-- Datos básicos necesarios
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol)
VALUES (100, 'Test User', 'test@email.com', 'pass123', 'Usuario');

INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol)
VALUES (101, 'Test Specialist', 'specialist@fitqual.com', 'pass123', 'EspecialistaFitness');

INSERT INTO EspecialistasFitness (id_persona, especialidad, descripcion_perfil, trayectoria_profesional, consejos_publicados) VALUES
(101, 'Fitness', 'Especialista pruebas', '5 años experiencia', 10);

INSERT INTO PlanesFitness (id_plan, nombre, duracion, descripcion) VALUES 
(100, 'Plan Test', '8 semanas', 'Plan para pruebas');



-- 1. USUARIOS: ck_usuario_membresia y ck_usuario_peso_altura


-- Membresía ACTIVA correcta (fecha_fin > fecha_inicio)
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, 
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (100, 'Perder peso', 'Intermedio', 4, 30, 'M', 75.5, 1.75, 
        DATE '2024-01-01', '1', DATE '2024-12-31');

-- Membresía INACTIVA correcta (fechas NULL)
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) VALUES (102, 'User Inactivo', 'inactivo@email.com', 'pass123', 'Usuario');
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, 
                     fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (102, 'Ganar masa', 'Básico', 3, 25, 'F', 60.0, 1.65, NULL, '0', NULL);


-- 2. RUTINAS: ck_rutina_nivel_dias


-- Rutina con nivel y días definidos
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, 
                    duracion_rutina_min, nivel_dificultad, tipo_entrenamiento)
VALUES (100, 100, 'Rutina Básica', 'Rutina para principiantes', 'Lunes, Miércoles, Viernes',
        45, 'Básico', 'Fuerza');

-- Rutina sin nivel ni días
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, 
                    duracion_rutina_min, nivel_dificultad, tipo_entrenamiento)
VALUES (101, 100, 'Rutina Flexible', 'Rutina sin días fijos', NULL, 30, NULL, 'Cardio');

------------------
-- 3. EJERCICIOS: ck_ejercicio_series_rep_duracion
------------------

-- Solo series y repeticiones
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
VALUES (100, 100, 'Sentadillas', 4, 12, 'Sentadillas con barra', NULL);

-- Solo duración
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
VALUES (101, 100, 'Cardio', NULL, NULL, 'Correr en cinta', 30);

-- Series y duración (sin repeticiones)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
VALUES (102, 100, 'Plancha', 3, NULL, 'Mantener plancha', 60);
COMMIT;



-- Comando para revertir
DELETE FROM personas
WHERE id_persona IN (100, 101, 102);

COMMIT;