-- POBLAR TABLA USUARIOS
-- Solo 9 usuarios con membresía activa (1) y 36 con membresía inactiva (0)

-- Usuarios con membresía ACTIVA (9 usuarios) - Tienen fechas de inicio y fin
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (1, 'Perder peso', 'Intermedio', 4, 28, 'M', 78.5, 1.75, DATE '2024-01-15', '1', DATE '2024-07-15');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (2, 'Ganar masa muscular', 'Avanzado', 5, 32, 'F', 65.2, 1.68, DATE '2024-02-01', '1', DATE '2024-08-01');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (3, 'Mantenerse en forma', 'Básico', 3, 45, 'M', 85.0, 1.80, DATE '2024-01-20', '1', DATE '2024-07-20');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (4, 'Tonificar cuerpo', 'Intermedio', 4, 29, 'F', 58.7, 1.65, DATE '2024-03-10', '1', DATE '2024-09-10');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (5, 'Preparar maratón', 'Avanzado', 6, 35, 'M', 72.3, 1.78, DATE '2024-02-15', '1', DATE '2024-08-15');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (6, 'Mejorar flexibilidad', 'Básico', 2, 25, 'F', 55.1, 1.62, DATE '2024-01-30', '1', DATE '2024-07-30');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (7, 'Ganar fuerza', 'Intermedio', 4, 31, 'M', 88.9, 1.82, DATE '2024-03-01', '1', DATE '2024-09-01');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (8, 'Reducir porcentaje graso', 'Avanzado', 5, 27, 'F', 62.4, 1.70, DATE '2024-02-20', '1', DATE '2024-08-20');

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (9, 'Recuperación lesión', 'Básico', 2, 52, 'M', 79.8, 1.76, DATE '2024-01-25', '1', DATE '2024-07-25');

-- Usuarios con membresía INACTIVA (36 usuarios) - Sin fechas de membresía
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (10, 'Definición muscular', 'Intermedio', 4, 26, 'F', 59.3, 1.67, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (11, 'Mejorar resistencia', 'Avanzado', 5, 33, 'M', 76.5, 1.79, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (12, 'Pérdida de peso', 'Básico', 3, 41, 'F', 68.9, 1.63, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (13, 'Aumentar masa muscular', 'Intermedio', 4, 29, 'M', 82.1, 1.81, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (14, 'Mantenimiento', 'Avanzado', 4, 36, 'F', 61.7, 1.69, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (15, 'Entrenamiento funcional', 'Básico', 3, 48, 'M', 91.2, 1.83, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (16, 'Preparar competición', 'Avanzado', 6, 24, 'F', 57.8, 1.66, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (17, 'Salud cardiovascular', 'Intermedio', 3, 55, 'M', 84.3, 1.77, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (18, 'Tonificar glúteos', 'Básico', 3, 23, 'F', 54.6, 1.61, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (19, 'Fuerza máxima', 'Avanzado', 5, 37, 'M', 95.7, 1.85, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (20, 'Pérdida de grasa', 'Intermedio', 4, 30, 'F', 66.4, 1.71, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (21, 'Recuperación postparto', 'Básico', 2, 28, 'M', 77.8, 1.74, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (22, 'Definición abdominal', 'Intermedio', 4, 26, 'F', 60.2, 1.68, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (23, 'Mejorar postura', 'Básico', 2, 59, 'M', 83.5, 1.75, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (24, 'Aumentar resistencia', 'Avanzado', 5, 31, 'F', 63.9, 1.72, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (25, 'Entrenamiento senior', 'Básico', 2, 67, 'M', 76.1, 1.73, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (26, 'Modelaje fitness', 'Avanzado', 6, 22, 'F', 56.3, 1.70, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (27, 'Powerlifting', 'Intermedio', 4, 34, 'M', 102.5, 1.84, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (28, 'Yoga y flexibilidad', 'Básico', 3, 27, 'F', 58.1, 1.64, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (29, 'Cross-training', 'Avanzado', 5, 32, 'M', 80.7, 1.78, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (30, 'Pérdida peso postparto', 'Intermedio', 3, 29, 'F', 71.2, 1.65, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (31, 'Rehabilitación', 'Básico', 2, 44, 'F', 64.8, 1.67, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (32, 'Calistenia', 'Intermedio', 4, 26, 'M', 74.9, 1.76, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (33, 'Danza fitness', 'Básico', 3, 21, 'F', 53.7, 1.60, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (34, 'Triatlón', 'Avanzado', 7, 38, 'M', 73.6, 1.79, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (35, 'Pilates', 'Intermedio', 3, 33, 'F', 59.8, 1.66, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (36, 'Boxeo fitness', 'Avanzado', 4, 30, 'M', 79.4, 1.77, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (37, 'HIIT', 'Intermedio', 4, 25, 'F', 57.5, 1.63, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (38, 'Entrenamiento funcional', 'Básico', 3, 51, 'M', 86.3, 1.80, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (39, 'Yoga avanzado', 'Avanzado', 5, 35, 'F', 61.0, 1.69, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (40, 'Ciclismo indoor', 'Intermedio', 4, 42, 'M', 81.9, 1.78, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (41, 'Natación fitness', 'Básico', 3, 29, 'M', 75.2, 1.75, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (42, 'Body balance', 'Intermedio', 3, 31, 'F', 60.5, 1.68, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (43, 'Entrenamiento militar', 'Avanzado', 6, 36, 'M', 89.7, 1.82, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (44, 'Zumba', 'Básico', 2, 47, 'M', 82.4, 1.76, NULL, '0', NULL);

INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia) 
VALUES (45, 'Aeróbic', 'Intermedio', 4, 28, 'F', 58.9, 1.67, NULL, '0', NULL);

--Actualizaciones posteriores a la poblacion
UPDATE Usuarios
SET imc = ROUND(peso / (altura * altura), 2);

-- Actualizar las fechas de membresía vencidas para los usuarios activos
UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-10-01', 
    fecha_fin_membresia = DATE '2026-04-01'
WHERE id_persona = 1;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-09-15', 
    fecha_fin_membresia = DATE '2026-09-15'
WHERE id_persona = 2;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-11-01', 
    fecha_fin_membresia = DATE '2026-05-01'
WHERE id_persona = 3;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-08-20', 
    fecha_fin_membresia = DATE '2026-02-20'
WHERE id_persona = 4;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-07-01', 
    fecha_fin_membresia = DATE '2026-07-01'
WHERE id_persona = 5;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-09-05', 
    fecha_fin_membresia = DATE '2026-03-05'
WHERE id_persona = 6;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-10-10', 
    fecha_fin_membresia = DATE '2026-04-10'
WHERE id_persona = 7;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-08-01', 
    fecha_fin_membresia = DATE '2026-02-01'
WHERE id_persona = 8;

UPDATE Usuarios
SET fecha_inicio_membresia = DATE '2025-07-25', 
    fecha_fin_membresia = DATE '2026-07-25'
WHERE id_persona = 9;

COMMIT;




