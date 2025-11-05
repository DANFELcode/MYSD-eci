-- POBLAR TABLA PROGRESOS
-- Promedio de 2 progresos por usuario (algunos 0, algunos 4)

-- Usuario 1 (4 progresos - muy comprometido)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (1, 1, 78.5, 'Cintura: 85cm, Cadera: 102cm, Brazo: 32cm', 22.5, DATE '2024-01-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (2, 1, 76.8, 'Cintura: 83 cm, Cadera: 101cm, Brazo: 31.5cm', 21.8, DATE '2024-02-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (3, 1, 74.2, 'Cintura: 80cm, Cadera: 99cm, Brazo: 31cm', 20.3, DATE '2024-03-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (4, 1, 72.1, 'Cintura: 78cm, Cadera: 98cm, Brazo: 30.5cm', 19.1, DATE '2024-04-20');

-- Usuario 2 (3 progresos - consistente)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (5, 2, 65.2, 'Cintura: 68cm, Cadera: 92cm, Brazo: 29cm', 24.0, DATE '2024-02-05');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (6, 2, 66.8, 'Cintura: 69cm, Cadera: 93cm, Brazo: 30cm', 23.5, DATE '2024-03-05');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (7, 2, 68.3, 'Cintura: 70cm, Cadera: 94cm, Brazo: 31cm', 23.0, DATE '2024-04-05');

-- Usuario 3 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (8, 3, 85.0, 'Cintura: 94cm, Cadera: 105cm, Brazo: 35cm', 22.0, DATE '2024-01-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (9, 3, 84.5, 'Cintura: 93cm, Cadera: 104cm, Brazo: 35cm', 21.5, DATE '2024-03-25');

-- Usuario 4 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (10, 4, 58.7, 'Cintura: 72cm, Cadera: 95cm, Brazo: 27cm', 25.5, DATE '2024-03-15');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (11, 4, 58.2, 'Cintura: 71cm, Cadera: 96cm, Brazo: 27.5cm', 24.8, DATE '2024-04-15');

-- Usuario 5 (4 progresos - atleta)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (12, 5, 72.3, 'Cintura: 78cm, Cadera: 96cm, Brazo: 32cm', 15.2, DATE '2024-02-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (13, 5, 71.8, 'Cintura: 77cm, Cadera: 95cm, Brazo: 32cm', 14.8, DATE '2024-03-10');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (14, 5, 71.2, 'Cintura: 76cm, Cadera: 95cm, Brazo: 32cm', 14.3, DATE '2024-03-30');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (15, 5, 70.8, 'Cintura: 75cm, Cadera: 94cm, Brazo: 31.5cm', 13.9, DATE '2024-04-20');

-- Usuario 6 (1 progreso - irregular)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (16, 6, 55.1, 'Cintura: 70cm, Cadera: 92cm, Brazo: 26cm', 26.0, DATE '2024-02-05');

-- Usuario 7 (3 progresos - consistente)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (17, 7, 88.9, 'Cintura: 92cm, Cadera: 108cm, Brazo: 38cm', 20.5, DATE '2024-03-05');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (18, 7, 89.8, 'Cintura: 91cm, Cadera: 108cm, Brazo: 38.5cm', 20.0, DATE '2024-03-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (19, 7, 90.5, 'Cintura: 91cm, Cadera: 109cm, Brazo: 39cm', 19.8, DATE '2024-04-15');

-- Usuario 8 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (20, 8, 62.4, 'Cintura: 75cm, Cadera: 98cm, Brazo: 28cm', 25.0, DATE '2024-02-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (21, 8, 61.2, 'Cintura: 73cm, Cadera: 97cm, Brazo: 28cm', 23.8, DATE '2024-04-05');

-- Usuario 9 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (22, 9, 79.8, 'Cintura: 88cm, Cadera: 104cm, Brazo: 33cm', 23.5, DATE '2024-01-30');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (23, 9, 79.0, 'Cintura: 87cm, Cadera: 103cm, Brazo: 33cm', 22.8, DATE '2024-03-30');

-- Usuario 10 (0 progresos - inactivo)

-- Usuario 11 (1 progreso - irregular)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (24, 11, 76.5, 'Cintura: 82cm, Cadera: 100cm, Brazo: 33cm', 21.0, DATE '2024-02-15');

-- Usuario 12 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (25, 12, 68.9, 'Cintura: 85cm, Cadera: 105cm, Brazo: 30cm', 28.5, DATE '2024-01-22');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (26, 12, 67.5, 'Cintura: 83cm, Cadera: 104cm, Brazo: 29.5cm', 27.2, DATE '2024-03-22');

-- Usuario 13 (3 progresos - consistente)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (27, 13, 82.1, 'Cintura: 86cm, Cadera: 102cm, Brazo: 35cm', 19.5, DATE '2024-02-15');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (28, 13, 83.2, 'Cintura: 87cm, Cadera: 103cm, Brazo: 35.5cm', 19.0, DATE '2024-03-15');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (29, 13, 84.0, 'Cintura: 87cm, Cadera: 103cm, Brazo: 36cm', 18.8, DATE '2024-04-15');

-- Usuario 14 (1 progreso - irregular)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (30, 14, 61.7, 'Cintura: 70cm, Cadera: 94cm, Brazo: 28cm', 20.0, DATE '2024-02-25');

-- Usuario 15 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (31, 15, 91.2, 'Cintura: 98cm, Cadera: 112cm, Brazo: 37cm', 26.5, DATE '2024-02-01');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (32, 15, 90.5, 'Cintura: 97cm, Cadera: 111cm, Brazo: 37cm', 25.8, DATE '2024-04-01');

-- Usuario 16 (4 progresos - competidora)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (33, 16, 57.8, 'Cintura: 68cm, Cadera: 90cm, Brazo: 27cm', 18.5, DATE '2024-02-10');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (34, 16, 57.2, 'Cintura: 67cm, Cadera: 89cm, Brazo: 27cm', 17.8, DATE '2024-03-01');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (35, 16, 56.8, 'Cintura: 66cm, Cadera: 89cm, Brazo: 26.5cm', 17.2, DATE '2024-03-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (36, 16, 56.3, 'Cintura: 65cm, Cadera: 88cm, Brazo: 26.5cm', 16.8, DATE '2024-04-10');

-- Usuario 17 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (37, 17, 84.3, 'Cintura: 92cm, Cadera: 106cm, Brazo: 34cm', 24.0, DATE '2024-01-30');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (38, 17, 83.8, 'Cintura: 91cm, Cadera: 105cm, Brazo: 34cm', 23.2, DATE '2024-03-30');

-- Usuario 18 (1 progreso - irregular)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (39, 18, 54.6, 'Cintura: 69cm, Cadera: 91cm, Brazo: 25cm', 27.5, DATE '2024-02-08');

-- Usuario 19 (3 progresos - consistente)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (40, 19, 95.7, 'Cintura: 96cm, Cadera: 110cm, Brazo: 40cm', 18.0, DATE '2024-02-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (41, 19, 96.5, 'Cintura: 96cm, Cadera: 110cm, Brazo: 40.5cm', 17.5, DATE '2024-03-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (42, 19, 97.2, 'Cintura: 97cm, Cadera: 111cm, Brazo: 41cm', 17.2, DATE '2024-04-20');

-- Usuario 20 (2 progresos - promedio)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (43, 20, 66.4, 'Cintura: 78cm, Cadera: 100cm, Brazo: 29cm', 28.0, DATE '2024-02-15');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (44, 20, 65.2, 'Cintura: 76cm, Cadera: 99cm, Brazo: 29cm', 26.5, DATE '2024-04-15');

-- Usuario 21 (2 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (45, 21, 77.8, 'Cintura: 84cm, Cadera: 103cm, Brazo: 32cm', 23.8, DATE '2024-01-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (46, 21, 76.5, 'Cintura: 82cm, Cadera: 102cm, Brazo: 32cm', 22.5, DATE '2024-03-25');

-- Usuario 22 (1 progreso)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (47, 22, 60.2, 'Cintura: 72cm, Cadera: 95cm, Brazo: 27.5cm', 24.2, DATE '2024-02-20');

-- Usuario 23 (2 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (48, 23, 83.5, 'Cintura: 90cm, Cadera: 106cm, Brazo: 34cm', 25.0, DATE '2024-02-12');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (49, 23, 82.8, 'Cintura: 89cm, Cadera: 105cm, Brazo: 34cm', 24.2, DATE '2024-04-12');

-- Usuario 24 (3 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (50, 24, 63.9, 'Cintura: 74cm, Cadera: 96cm, Brazo: 28.5cm', 22.5, DATE '2024-02-01');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (51, 24, 63.5, 'Cintura: 73cm, Cadera: 96cm, Brazo: 28.5cm', 21.8, DATE '2024-03-01');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (52, 24, 63.0, 'Cintura: 72cm, Cadera: 95cm, Brazo: 28cm', 21.0, DATE '2024-04-01');

-- Usuario 25 (1 progreso)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (53, 25, 76.1, 'Cintura: 86cm, Cadera: 104cm, Brazo: 32cm', 26.8, DATE '2024-02-10');

-- Usuario 26 (4 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (54, 26, 56.3, 'Cintura: 66cm, Cadera: 89cm, Brazo: 26cm', 17.5, DATE '2024-02-18');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (55, 26, 55.8, 'Cintura: 65cm, Cadera: 88cm, Brazo: 26cm', 16.8, DATE '2024-03-08');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (56, 26, 55.5, 'Cintura: 64cm, Cadera: 88cm, Brazo: 25.5cm', 16.2, DATE '2024-03-28');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (57, 26, 55.2, 'Cintura: 63cm, Cadera: 87cm, Brazo: 25.5cm', 15.8, DATE '2024-04-18');

-- Usuario 27 (2 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (58, 27, 102.5, 'Cintura: 104cm, Cadera: 115cm, Brazo: 42cm', 20.5, DATE '2024-02-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (59, 27, 103.2, 'Cintura: 104cm, Cadera: 115cm, Brazo: 42.5cm', 20.0, DATE '2024-04-25');

-- Usuario 28 (1 progreso)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (60, 28, 58.1, 'Cintura: 71cm, Cadera: 93cm, Brazo: 26.5cm', 25.8, DATE '2024-02-28');

-- Usuario 29 (3 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (61, 29, 80.7, 'Cintura: 84cm, Cadera: 102cm, Brazo: 35cm', 19.2, DATE '2024-02-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (62, 29, 81.2, 'Cintura: 84cm, Cadera: 102cm, Brazo: 35.5cm', 18.8, DATE '2024-03-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (63, 29, 81.8, 'Cintura: 85cm, Cadera: 103cm, Brazo: 36cm', 18.5, DATE '2024-04-25');

-- Usuario 30 (2 progresos)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (64, 30, 71.2, 'Cintura: 82cm, Cadera: 104cm, Brazo: 30cm', 29.5, DATE '2024-02-10');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (65, 30, 69.8, 'Cintura: 80cm, Cadera: 103cm, Brazo: 29.5cm', 28.0, DATE '2024-04-10');

-- Usuarios 31-45 (1-2 progresos cada uno para completar)
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (66, 31, 64.8, 'Cintura: 76cm, Cadera: 98cm, Brazo: 28cm', 26.5, DATE '2024-02-15');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (67, 32, 74.9, 'Cintura: 80cm, Cadera: 100cm, Brazo: 32cm', 21.8, DATE '2024-02-22');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (68, 33, 53.7, 'Cintura: 68cm, Cadera: 90cm, Brazo: 25cm', 28.2, DATE '2024-02-18');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (69, 34, 73.6, 'Cintura: 79cm, Cadera: 99cm, Brazo: 32cm', 16.5, DATE '2024-02-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (70, 35, 59.8, 'Cintura: 72cm, Cadera: 95cm, Brazo: 27cm', 24.0, DATE '2024-02-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (71, 36, 79.4, 'Cintura: 85cm, Cadera: 104cm, Brazo: 34cm', 20.8, DATE '2024-02-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (72, 37, 57.5, 'Cintura: 70cm, Cadera: 92cm, Brazo: 26cm', 25.5, DATE '2024-03-05');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (73, 38, 86.3, 'Cintura: 92cm, Cadera: 108cm, Brazo: 36cm', 24.2, DATE '2024-02-22');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (74, 39, 61.0, 'Cintura: 71cm, Cadera: 94cm, Brazo: 28cm', 22.8, DATE '2024-02-18');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (75, 40, 81.9, 'Cintura: 86cm, Cadera: 105cm, Brazo: 35cm', 21.5, DATE '2024-02-25');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (76, 41, 75.2, 'Cintura: 82cm, Cadera: 101cm, Brazo: 32cm', 22.0, DATE '2024-02-28');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (77, 42, 60.5, 'Cintura: 73cm, Cadera: 96cm, Brazo: 27.5cm', 25.2, DATE '2024-03-01');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (78, 43, 89.7, 'Cintura: 94cm, Cadera: 109cm, Brazo: 38cm', 18.5, DATE '2024-02-20');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (79, 44, 82.4, 'Cintura: 90cm, Cadera: 107cm, Brazo: 35cm', 26.8, DATE '2024-02-18');

INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (80, 45, 58.9, 'Cintura: 71cm, Cadera: 94cm, Brazo: 27cm', 24.5, DATE '2024-02-28');

MERGE INTO Progresos p
USING Usuarios u
ON (p.usuario = u.id_persona)
WHEN MATCHED THEN
  UPDATE SET p.imc = ROUND(p.peso_actual / (u.altura * u.altura), 2);

commit;