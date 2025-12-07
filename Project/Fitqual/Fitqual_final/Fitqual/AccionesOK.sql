------------------------------------------------------------
-- AccionesOK
-- Casos que prueban las acciones de referencia
------------------------------------------------------------

-- 1. DATOS DE PRUEBA
INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol)
VALUES (300, 'Test User', 'test.user@email.com', 'pass123', 'Usuario');

INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol)
VALUES (301, 'Test Specialist', 'test.specialist@fitqual.com', 'pass123', 'EspecialistaFitness');

INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol)
VALUES (302, 'User to Delete', 'delete.user@email.com', 'pass123', 'Usuario');

INSERT INTO Personas (id_persona, nombre, correo, contrasena, rol)
VALUES (303, 'Specialist to Delete', 'delete.specialist@fitqual.com', 'pass123', 'EspecialistaFitness');

INSERT INTO EspecialistasFitness VALUES (301, 'Fitness', 'Test specialist', '5 años', 5);

INSERT INTO EspecialistasFitness VALUES (303, 'Nutrition', 'Specialist to delete', '3 años', 2);

INSERT INTO Usuarios(id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES (300, 'Fitness', 'Intermedio', 4, 30, 'M', 75, 1.75, NULL, DATE '2024-01-01', '1', DATE '2024-12-31');

INSERT INTO Usuarios(id_persona, meta, nivel, frecuencia_entreno_semanal, edad, sexo, peso, altura, imc, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES (302, 'Weight Loss', 'Básico', 3, 25, 'F', 60, 1.65, NULL, DATE '2024-01-01', '1', DATE '2024-12-31');

INSERT INTO PlanesFitness VALUES (300, 'Test Plan', '8 semanas', 'Plan de prueba');
INSERT INTO PlanesFitness VALUES (301, 'Plan to Delete', '12 semanas', 'Plan a eliminar');

INSERT INTO PlanesFitnessDeUsuarios VALUES (302, 301, 'Test comment');

INSERT INTO Rutinas VALUES (300, 300, 'Test Routine', 'Rutina prueba', 'Lunes, Miércoles', 45, 'Básico', 'Fuerza');
INSERT INTO Rutinas VALUES (301, 301, 'Routine to Delete', 'Rutina a eliminar', 'Martes, Jueves', 60, 'Intermedio', 'Cardio');

INSERT INTO Ejercicios VALUES (300, 300, 'Test Exercise', 3, 12, 'Ejercicio prueba', NULL);
INSERT INTO Ejercicios VALUES (301, 301, 'Exercise to Delete', 4, 10, 'Ejercicio a eliminar', NULL);

INSERT INTO Feedbacks VALUES (300, 302, 'Test feedback', SYSDATE, 5, 'Sistema', 'Público');
INSERT INTO Objetivos VALUES (300, 302, 'Test Goal', 'Objetivo prueba', SYSDATE);
INSERT INTO Progresos VALUES (300, 302, 59.0, 'Medidas test', 22.0, NULL, SYSDATE);

INSERT INTO Recomendaciones VALUES (300, 303, 'Test recommendation', SYSDATE, 'Nutrición');
INSERT INTO ObjetivosRecomendaciones VALUES (300, 300);


COMMIT;

------------------
-- 2. PRUEBAS ON DELETE CASCADE
------------------


-- Prueba 2: Eliminar Usuario → Elimina sus datos en cascada  
DELETE FROM Usuarios WHERE id_persona = 302;
-- Verificar: Feedback 302, Objetivo 302, Progreso 302 deben eliminarse
commit;
-- Prueba 3: Eliminar Especialista → Elimina Recomendaciones en cascada
DELETE FROM EspecialistasFitness WHERE id_persona = 303;
-- Verificar: Recomendación 303 debe eliminarse
commit;


------------------
-- 4. PRUEBA ELIMINACIÓN EN CADENA
------------------

-- Prueba 5: Eliminar Persona → Elimina Usuario y todos sus datos
DELETE FROM Personas WHERE id_persona = 302;
-- Verificar: Usuario 302 y todos sus datos deben eliminarse en cadena

COMMIT;
ROLLBACK;
