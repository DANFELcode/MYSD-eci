-- POBLARNOOK.sql
-- Intentos de inserción de datos erróneos que deben ser rechazados por las restricciones

----------------------------
-- VIOLACIONES TABLA PERSONAS
----------------------------

-- 1. Violación rol no válido
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (1000, 'Juan Error', 'juan@error.com', 'pass123', 'Administrador'); 
-- Error: rol debe ser 'Usuario' o 'EspecialistaFitness'

-- 2. Violación correo duplicado
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (1001, 'Ana Duplicado', 'carlos.gomez@gmail.com', 'pass123', 'Usuario');
-- Error: correo ya existe (viola UK)

-- 3. Violación ID nulo
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (NULL, 'Sin ID', 'sinid@test.com', 'pass123', 'Usuario');
-- Error: id_persona no puede ser NULL

-- 4. Violación nombre nulo
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (1002, NULL, 'noname@test.com', 'pass123', 'Usuario');
-- Error: nombre no puede ser NULL

----------------------------
-- VIOLACIONES TABLA USUARIOS
----------------------------

-- 5. Violación sexo no válido
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (1000, 'Perder peso', 'Intermedio', 4, 25, 'X', 70.5, 1.75, DATE '2024-01-01', '1');
-- Error: sexo debe ser 'M' o 'F'

-- 6. Violación edad fuera de rango
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (1001, 'Ganar músculo', 'Avanzado', 5, 5, 'M', 80.0, 1.80, DATE '2024-01-01', '1');
-- Error: edad debe estar entre 10 y 100

-- 7. Violación peso fuera de rango
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (1002, 'Mantenerse', 'Básico', 3, 30, 'F', 10.0, 1.65, DATE '2024-01-01', '1');
-- Error: peso debe estar entre 30 y 400 kg

-- 8. Violación altura fuera de rango
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (1003, 'Flexibilidad', 'Intermedio', 2, 28, 'F', 55.0, 0.80, DATE '2024-01-01', '1');
-- Error: altura debe estar entre 1.10 y 2.40 m

-- 9. Violación frecuencia fuera de rango
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (1004, 'Cardio', 'Básico', 10, 35, 'M', 75.0, 1.78, DATE '2024-01-01', '1');
-- Error: frecuencia debe estar entre 1 y 7

-- 10. Violación membresia_activa no válida
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (1005, 'Fuerza', 'Intermedio', 4, 40, 'M', 85.0, 1.82, DATE '2024-01-01', '2');
-- Error: membresia_activa debe ser '0' o '1'

-- 11. Violación FK - usuario que no existe en Personas
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (9999, 'Meta Test', 'Básico', 3, 25, 'M', 70.0, 1.75, DATE '2024-01-01', '1');
-- Error: id_persona no existe en Personas

----------------------------
-- VIOLACIONES TABLA ESPECIALISTASFITNESS
----------------------------

-- 12. Violación consejos_publicados negativo
INSERT INTO EspecialistasFitness (id_persona, especialidad, descripcion_perfil, trayectoria_profesional, consejos_publicados) 
VALUES (1006, 'Nutrición', 'Especialista en nutrición', '5 años de experiencia', -5);
-- Error: consejos_publicados debe ser >= 0

-- 13. Violación FK - especialista que no es EspecialistaFitness en Personas
INSERT INTO EspecialistasFitness (id_persona, especialidad, descripcion_perfil, trayectoria_profesional, consejos_publicados) 
VALUES (1, 'Entrenamiento', 'Descripción', 'Trayectoria', 2);
-- Error: id_persona 1 es Usuario, no EspecialistaFitness

----------------------------
-- VIOLACIONES TABLA FEEDBACKS
----------------------------

-- 14. Violación calificación fuera de rango
INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (1000, 1, 'Contenido de feedback', DATE '2024-03-01', 6, 'Sistema', 'Público');
-- Error: calificacion debe estar entre 1 y 5

-- 15. Violación calificación cero
INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (1001, 1, 'Contenido de feedback', DATE '2024-03-01', 0, 'Sistema', 'Público');
-- Error: calificacion debe estar entre 1 y 5

-- 16. Violación tipo_feedback no válido
INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (1002, 1, 'Contenido de feedback', DATE '2024-03-01', 4, 'Nutrición', 'Público');
-- Error: tipo_feedback debe ser 'EspecialistaFitness', 'RutinasDeEjemplo', 'Progreso', 'Sistema'

-- 17. Violación visibilidad no válida
INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (1003, 1, 'Contenido de feedback', DATE '2024-03-01', 3, 'Sistema', 'Confidencial');
-- Error: visibilidad debe ser 'Público' o 'Privado'

-- 18. Violación FK - usuario que no existe
INSERT INTO Feedbacks (id_feedback, usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad) 
VALUES (1004, 9999, 'Contenido de feedback', DATE '2024-03-01', 5, 'Sistema', 'Público');
-- Error: usuario no existe en Usuarios

----------------------------
-- VIOLACIONES TABLA RECOMENDACIONES
----------------------------

-- 19. Violación tipo_enfoque no válido
INSERT INTO Recomendaciones (id_recomendacion, especialista_fitness, contenido, fecha_creacion, tipo_enfoque) 
VALUES (1000, 46, 'Contenido de recomendación', DATE '2024-03-01', 'Suplementación');
-- Error: tipo_enfoque debe ser 'Nutrición', 'Entrenamiento', 'Salud mental', 'Descanso', 'Motivación'

-- 20. Violación FK - especialista que no existe
INSERT INTO Recomendaciones (id_recomendacion, especialista_fitness, contenido, fecha_creacion, tipo_enfoque) 
VALUES (1001, 999, 'Contenido de recomendación', DATE '2024-03-01', 'Nutrición');
-- Error: especialista_fitness no existe en EspecialistasFitness

----------------------------
-- VIOLACIONES TABLA PROGRESOS
----------------------------

-- 21. Violación peso_actual fuera de rango
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (1000, 1, 10.5, 'Cintura: 80cm', 20.5, DATE '2024-03-01');
-- Error: peso_actual debe estar entre 30 y 300 kg

-- 22. Violación porcentaje_grasa fuera de rango
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (1001, 1, 75.5, 'Cintura: 82cm', 150.5, DATE '2024-03-01');
-- Error: porcentaje_grasa debe estar entre 0 y 100

-- 23. Violación porcentaje_grasa negativo
INSERT INTO Progresos (id_progreso, usuario, peso_actual, medidas, porcentaje_grasa, fecha_registro) 
VALUES (1002, 1, 76.0, 'Cintura: 81cm', -5.0, DATE '2024-03-01');
-- Error: porcentaje_grasa debe estar entre 0 y 100

----------------------------
-- VIOLACIONES TABLA RUTINAS
----------------------------

-- 24. Violación duracion_rutina_min fuera de rango
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (1000, 1, 'Rutina Extrema', 'Descripción de rutina', 'Lunes, Miércoles', 600, 'Intermedio', 'Fuerza');
-- Error: duracion_rutina_min debe estar entre 1 y 500

-- 25. Violación nivel_dificultad no válido
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (1001, 1, 'Rutina Experimental', 'Descripción de rutina', 'Martes, Jueves', 45, 'Extremo', 'Fuerza');
-- Error: nivel_dificultad debe ser 'Básico', 'Intermedio', 'Avanzado' o NULL

-- 26. Violación tipo_entrenamiento no válido
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (1002, 1, 'Rutina Mixta', 'Descripción de rutina', 'Lunes a Viernes', 60, 'Intermedio', 'Mixto');
-- Error: tipo_entrenamiento debe ser 'Cardio', 'Fuerza' o NULL

-- 27. Violación UK - nombre duplicado en mismo plan
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (1003, 1, 'Rutina Full Body Principiante', 'Otra descripción', 'Lunes, Viernes', 50, 'Básico', 'Fuerza');
-- Error: nombre_rutina ya existe para este planfitness

----------------------------
-- VIOLACIONES TABLA COMIDAS
----------------------------

-- 28. Violación calorías fuera de rango
INSERT INTO Comidas (id_comida, planfitness, nombre_comida, calorias, carbohidratos, grasas, proteinas) 
VALUES (1000, 1, 'Comida Extrema', 5000, 100.0, 50.0, 80.0);
-- Error: calorias debe estar entre 0 y 3000

-- 29. Violación carbohidratos negativo
INSERT INTO Comidas (id_comida, planfitness, nombre_comida, calorias, carbohidratos, grasas, proteinas) 
VALUES (1001, 1, 'Comida Negativa', 500, -10.0, 20.0, 30.0);
-- Error: carbohidratos debe ser >= 0

-- 30. Violación UK - nombre duplicado en mismo plan
INSERT INTO Comidas (id_comida, planfitness, nombre_comida, calorias, carbohidratos, grasas, proteinas) 
VALUES (1002, 1, 'Desayuno Proteico', 350, 25.0, 12.0, 35.0);
-- Error: nombre_comida ya existe para este planfitness

----------------------------
-- VIOLACIONES TABLA EJERCICIOS
----------------------------

-- 31. Violación series cero
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1000, 1, 'Ejercicio Error', 0, 10, 'Descripción', NULL);
-- Error: series debe ser > 0 o NULL

-- 32. Violación repeticiones cero
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1001, 1, 'Ejercicio Error 2', 3, 0, 'Descripción', NULL);
-- Error: repeticiones debe ser > 0 o NULL

-- 33. Violación duracion_min fuera de rango
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1002, 1, 'Ejercicio Largo', 3, 10, 'Descripción', 600);
-- Error: duracion_min debe estar entre 1 y 500

-- 34. Violación FK - rutina que no existe
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1003, 9999, 'Ejercicio Fantasma', 3, 10, 'Descripción', 30);
-- Error: id_rutina no existe en Rutinas

----------------------------
-- VIOLACIONES TABLA RUTINASDEEJEMPLO
----------------------------

-- 35. Violación duracion_rutina fuera de rango
INSERT INTO RutinasDeEjemplo (id_rutina, especialista_fitness, nombre_rutina, descripcion, dias_semana, duracion_rutina, nivel_dificultad, tipo_entrenamiento) 
VALUES (1000, 46, 'Rutina Larga', 'Descripción', 'Lunes a Viernes', 600, 'Intermedio', 'Fuerza');
-- Error: duracion_rutina debe estar entre 1 y 500

-- 36. Violación nivel_dificultad no válido
INSERT INTO RutinasDeEjemplo (id_rutina, especialista_fitness, nombre_rutina, descripcion, dias_semana, duracion_rutina, nivel_dificultad, tipo_entrenamiento) 
VALUES (1001, 46, 'Rutina Experimental', 'Descripción', 'Lunes, Miércoles', 45, 'Principiante', 'Fuerza');
-- Error: nivel_dificultad debe ser 'Básico', 'Intermedio', 'Avanzado'

-- 37. Violación tipo_entrenamiento no válido
INSERT INTO RutinasDeEjemplo (id_rutina, especialista_fitness, nombre_rutina, descripcion, dias_semana, duracion_rutina, nivel_dificultad, tipo_entrenamiento) 
VALUES (1002, 46, 'Rutina Mixta', 'Descripción', 'Martes, Jueves', 60, 'Intermedio', 'Flexibilidad');
-- Error: tipo_entrenamiento debe ser 'Cardio' o 'Fuerza'

-- 38. Violación UK - nombre duplicado para mismo especialista
INSERT INTO RutinasDeEjemplo (id_rutina, especialista_fitness, nombre_rutina, descripcion, dias_semana, duracion_rutina, nivel_dificultad, tipo_entrenamiento) 
VALUES (1003, 46, 'Rutina Pre-Entreno Energética', 'Otra descripción', 'Lunes, Viernes', 50, 'Intermedio', 'Fuerza');
-- Error: nombre_rutina ya existe para este especialista_fitness

----------------------------
-- VIOLACIONES TABLA EJERCICIOSDERUTINASDEEJEMPLO
----------------------------

-- 39. Violación series cero
INSERT INTO EjerciciosDeRutinasDeEjemplo (id_ejercicio_ejemplo, id_rutina_ejemplo, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1000, 1, 'Ejercicio Error', 0, 10, 'Descripción', 5);
-- Error: series debe ser > 0

-- 40. Violación repeticiones cero
INSERT INTO EjerciciosDeRutinasDeEjemplo (id_ejercicio_ejemplo, id_rutina_ejemplo, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1001, 1, 'Ejercicio Error 2', 3, 0, 'Descripción', 5);
-- Error: repeticiones debe ser > 0

-- 41. Violación duracion_min cero
INSERT INTO EjerciciosDeRutinasDeEjemplo (id_ejercicio_ejemplo, id_rutina_ejemplo, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1002, 1, 'Ejercicio Sin Duración', 3, 10, 'Descripción', 0);
-- Error: duracion_min debe ser > 0

-- 42. Violación FK - rutina_ejemplo que no existe
INSERT INTO EjerciciosDeRutinasDeEjemplo (id_ejercicio_ejemplo, id_rutina_ejemplo, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) 
VALUES (1003, 9999, 'Ejercicio Fantasma', 3, 10, 'Descripción', 5);
-- Error: id_rutina_ejemplo no existe en RutinasDeEjemplo

----------------------------
-- VIOLACIONES TABLAS INTERMEDIAS
----------------------------

-- 43. Violación PK duplicada en PlanesFitnessDeUsuarios
INSERT INTO PlanesFitnessDeUsuarios (usuario, planfitness, comentario_usuario) 
VALUES (1, 1, 'Comentario duplicado');
-- Error: ya existe la combinación usuario=1, planfitness=1

-- 44. Violación PK duplicada en ObjetivosRecomendaciones
INSERT INTO ObjetivosRecomendaciones (id_recomendacion, id_objetivo) 
VALUES (1, 1);
-- Error: ya existe la combinación id_recomendacion=1, id_objetivo=1

----------------------------
-- VIOLACIONES DE INTEGRIDAD REFERENCIAL
----------------------------

-- 45. Eliminación con restricción referencial - Intentar eliminar persona referenciada
DELETE FROM Personas WHERE id_persona = 1;
-- Error: existe dependencia referencial en Usuarios

-- 46. Eliminación con restricción referencial - Intentar eliminar plan referenciado
DELETE FROM PlanesFitness WHERE id_plan = 1;
-- Error: existe dependencia referencial en Rutinas, Comidas, Habitos, PlanesFitnessDeUsuarios

-- 47. Eliminación con restricción referencial - Intentar eliminar rutina referenciada
DELETE FROM Rutinas WHERE id_rutina = 1;
-- Error: existe dependencia referencial en Ejercicios

----------------------------
-- VIOLACIONES DE NULIDAD
----------------------------

-- 48. Violación NOT NULL en Personas.nombre
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol) 
VALUES (2000, NULL, 'noname@test.com', 'pass123', 'Usuario');

-- 49. Violación NOT NULL en Usuarios.nivel
INSERT INTO Usuarios (id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa) 
VALUES (2001, 'Meta test', NULL, 3, 25, 'M', 70.0, 1.75, DATE '2024-01-01', '1');

-- 50. Violación NOT NULL en RutinasDeEjemplo.dias_semana
INSERT INTO RutinasDeEjemplo (id_rutina, especialista_fitness, nombre_rutina, descripcion, dias_semana, duracion_rutina, nivel_dificultad, tipo_entrenamiento) 
VALUES (2000, 46, 'Rutina Test', 'Descripción', NULL, 45, 'Intermedio', 'Fuerza');
