-- POBLAR TABLA FEEDBACKS
-- 7 feedbacks sobre las rutinas creadas por especialistas
-- 4 feedbacks (sobre la atención de los especialistas)
-- 4 feedbacks (sobre el sistema de seguimiento de progreso)
-- 3 feedbacks (sobre la aplicación en general)

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (1, 1, 'La rutina de ejemplo de fuerza básica es excelente para principiantes. Los ejercicios son seguros y bien explicados.', DATE '2024-03-15', 5, 'RutinasDeEjemplo', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (2, 2, 'Me encantó la rutina de hipertrofia del especialista. Los tiempos de descanso son perfectos para maximizar el crecimiento muscular.', DATE '2024-03-18', 4, 'RutinasDeEjemplo', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (3, 3, 'La rutina de rehabilitación de hombros ha sido fundamental para mi recuperación. Muy bien estructurada.', DATE '2024-03-20', 5, 'RutinasDeEjemplo', 'Privado');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (4, 4, 'El sistema de seguimiento de progreso es muy detallado. Me ayuda a ver mi evolución semana a semana.', DATE '2024-03-22', 4, 'Progreso', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (5, 5, 'El especialista en entrenamiento running tiene rutinas muy efectivas. He mejorado mi resistencia notablemente.', DATE '2024-03-25', 5, 'EspecialistaFitness', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (6, 6, 'La aplicación es muy intuitiva para seguir las rutinas de ejemplo. Los videos demostrativos son de gran ayuda.', DATE '2024-03-28', 5, 'Sistema', 'Privado');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (7, 7, 'La rutina de fuerza máxima es desafiante pero segura. Me gustaría más variedad en ejercicios compuestos.', DATE '2024-04-01', 3, 'RutinasDeEjemplo', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (8, 8, 'El tracking de porcentaje graso es muy preciso. Los datos coinciden con mi evaluación profesional.', DATE '2024-04-05', 5, 'Progreso', 'Privado');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (9, 9, 'La especialista en yoga deportivo tiene un enfoque excelente. Las rutinas de movilidad han mejorado mi flexibilidad.', DATE '2024-04-08', 4, 'EspecialistaFitness', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (10, 2, 'La rutina de ejemplo para definir abdominales es muy completa. Combina perfectamente fuerza y cardio.', DATE '2024-04-10', 4, 'RutinasDeEjemplo', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (11, 5, 'La aplicación consume mucha batería durante los entrenamientos. Sería bueno optimizar este aspecto.', DATE '2024-04-12', 3, 'Sistema', 'Privado');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (12, 1, 'El seguimiento de medidas corporales en las rutinas de ejemplo me mantiene motivado para continuar.', DATE '2024-04-15', 5, 'Progreso', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (13, 3, 'Respuesta rápida del especialista sobre modificaciones en las rutinas de ejemplo. Muy profesional.', DATE '2024-04-18', 5, 'EspecialistaFitness', 'Privado');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (14, 7, 'La rutina de ejemplo para espalda está bien estructurada, pero echo en falta más variedad de ejercicios.', DATE '2024-04-20', 3, 'RutinasDeEjemplo', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (15, 9, 'La sincronización con mi smartwatch para las rutinas de ejemplo funciona perfectamente.', DATE '2024-04-22', 5, 'Sistema', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (16, 4, 'Me gusta cómo el sistema sugiere progresiones en las rutinas basado en mi desempeño semanal.', DATE '2024-04-25', 4, 'Progreso', 'Privado');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (17, 6, 'El especialista en flexibilidad tiene rutinas de ejemplo muy holísticas. Perfectas para mi nivel.', DATE '2024-04-28', 5, 'EspecialistaFitness', 'Público');

INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (18, 8, 'La calculadora de series y repeticiones integrada en las rutinas de ejemplo es muy útil.', DATE '2024-05-01', 4, 'Sistema', 'Privado');
commit;