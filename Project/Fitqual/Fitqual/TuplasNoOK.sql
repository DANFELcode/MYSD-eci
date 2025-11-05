------------------------------------------------------------
-- TUPLAS NO OK
-- Intento de ingreso de datos incorrectos con respecto a las restricciones de tupla
------------------------------------------------------------

-- Violación de la restricción de coherencia entre fechas de membresía
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES (6, 'Bajar de peso', 'Avanzado', 5, 25, 'M', 70, 1.75, TO_DATE('2025-01-01', 'YYYY-MM-DD'), '1', TO_DATE('2024-12-01', 'YYYY-MM-DD'));

-- Violación de la restricción entre peso y altura
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES (7, 'Ganar músculo', 'Intermedio', 4, 30, 'F', 400, 1.80, TO_DATE('2025-01-01', 'YYYY-MM-DD'), '1', TO_DATE('2026-01-01', 'YYYY-MM-DD'));

-- Violación de la restricción entre nivel de dificultad y días por semana
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento)
VALUES (1, 1, 'Rutina Básica', 'Rutina para principiantes', NULL, 30, 'Básico', 'Cardio');

-- Violación de la restricción entre series, repeticiones y duración
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
VALUES (1, 1, 'Press de banca', 3, 10, 'Ejercicio de pecho', 30);