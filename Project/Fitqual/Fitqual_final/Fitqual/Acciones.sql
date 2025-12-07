------------------
-- ACCIONES DE REFERENCIA
------------------

-- Si se elimina una Persona, se eliminan sus registros como EspecialistaFitness
ALTER TABLE EspecialistasFitness 
DROP CONSTRAINT fk_especialistas_persona;
ALTER TABLE EspecialistasFitness 
ADD CONSTRAINT fk_especialistas_persona 
FOREIGN KEY(id_persona) REFERENCES Personas(id_persona) ON DELETE CASCADE;

-- Si se elimina una Persona, se eliminan sus registros como Usuario
ALTER TABLE Usuarios 
DROP CONSTRAINT fk_usuarios_persona;
ALTER TABLE Usuarios 
ADD CONSTRAINT fk_usuarios_persona 
FOREIGN KEY(id_persona) REFERENCES Personas(id_persona) ON DELETE CASCADE;

-- Si se elimina un Usuario, se eliminan sus Feedbacks
ALTER TABLE Feedbacks 
DROP CONSTRAINT fk_feedbacks_usuario;
ALTER TABLE Feedbacks 
ADD CONSTRAINT fk_feedbacks_usuario 
FOREIGN KEY(usuario) REFERENCES Usuarios(id_persona) ON DELETE CASCADE;

-- Si se elimina un EspecialistaFitness, se eliminan sus recomendaciones
ALTER TABLE Recomendaciones 
DROP CONSTRAINT fk_recomendaciones_especialista;
ALTER TABLE Recomendaciones 
ADD CONSTRAINT fk_recomendaciones_especialista 
FOREIGN KEY(especialista_fitness) REFERENCES EspecialistasFitness(id_persona) ON DELETE CASCADE;

-- Si se elimina un Usuario, se eliminan sus Objetivos
ALTER TABLE Objetivos 
DROP CONSTRAINT fk_objetivos_usuario;
ALTER TABLE Objetivos 
ADD CONSTRAINT fk_objetivos_usuario 
FOREIGN KEY(usuario) REFERENCES Usuarios(id_persona) ON DELETE CASCADE;

-- Si se elimina un Usuario, se eliminan sus Progresos
ALTER TABLE Progresos 
DROP CONSTRAINT fk_progresos_usuario;
ALTER TABLE Progresos 
ADD CONSTRAINT fk_progresos_usuario 
FOREIGN KEY(usuario) REFERENCES Usuarios(id_persona) ON DELETE CASCADE;

-- Si se elimina un Usuario, se eliminan sus PlanesFitness asignados
ALTER TABLE PlanesFitnessDeUsuarios 
DROP CONSTRAINT fk_planesusuarios_usuario;
ALTER TABLE PlanesFitnessDeUsuarios 
ADD CONSTRAINT fk_planesusuarios_usuario 
FOREIGN KEY(usuario) REFERENCES Usuarios(id_persona) ON DELETE CASCADE;

-- Si se elimina un PlanFitness, se eliminan sus asignaciones a usuarios
ALTER TABLE PlanesFitnessDeUsuarios 
DROP CONSTRAINT fk_planesusuarios_plan;
ALTER TABLE PlanesFitnessDeUsuarios 
ADD CONSTRAINT fk_planesusuarios_plan 
FOREIGN KEY(planfitness) REFERENCES PlanesFitness(id_plan) ON DELETE CASCADE;

-- Si se elimina un PlanFitness, se eliminan sus Rutinas
ALTER TABLE Rutinas 
DROP CONSTRAINT fk_rutinas_plan;
ALTER TABLE Rutinas 
ADD CONSTRAINT fk_rutinas_plan 
FOREIGN KEY(planfitness) REFERENCES PlanesFitness(id_plan) ON DELETE CASCADE;

-- Si se elimina un PlanFitness, se eliminan sus Comidas
ALTER TABLE Comidas 
DROP CONSTRAINT fk_comidas_plan;
ALTER TABLE Comidas 
ADD CONSTRAINT fk_comidas_plan 
FOREIGN KEY(planfitness) REFERENCES PlanesFitness(id_plan) ON DELETE CASCADE;

-- Si se elimina un PlanFitness, se eliminan sus Habitos
ALTER TABLE Habitos 
DROP CONSTRAINT fk_habitos_plan;
ALTER TABLE Habitos 
ADD CONSTRAINT fk_habitos_plan 
FOREIGN KEY(planfitness) REFERENCES PlanesFitness(id_plan) ON DELETE CASCADE;

-- Si se elimina una Rutina, se eliminan sus Ejercicios
ALTER TABLE Ejercicios 
DROP CONSTRAINT fk_ejercicios_rutina;
ALTER TABLE Ejercicios 
ADD CONSTRAINT fk_ejercicios_rutina 
FOREIGN KEY(id_rutina) REFERENCES Rutinas(id_rutina) ON DELETE CASCADE;

-- Si se elimina una Recomendacion, se eliminan sus relaciones con Objetivos
ALTER TABLE ObjetivosRecomendaciones 
DROP CONSTRAINT fk_objrec_recomendacion;
ALTER TABLE ObjetivosRecomendaciones 
ADD CONSTRAINT fk_objrec_recomendacion 
FOREIGN KEY(id_recomendacion) REFERENCES Recomendaciones(id_recomendacion) ON DELETE CASCADE;

-- Si se elimina un Objetivo, se eliminan sus relaciones con Recomendaciones
ALTER TABLE ObjetivosRecomendaciones 
DROP CONSTRAINT fk_objrec_objetivo;
ALTER TABLE ObjetivosRecomendaciones 
ADD CONSTRAINT fk_objrec_objetivo 
FOREIGN KEY(id_objetivo) REFERENCES Objetivos(id_objetivo) ON DELETE CASCADE;

-- Si se elimina un EspecialistaFitness, sus RutinasDeEjemplo permanecen sin especialista
ALTER TABLE RutinasDeEjemplo 
DROP CONSTRAINT fk_rutinasEjemplo_especialista;
ALTER TABLE RutinasDeEjemplo 
ADD CONSTRAINT fk_rutinasEjemplo_especialista 
FOREIGN KEY(especialista_fitness) REFERENCES EspecialistasFitness(id_persona) ON DELETE SET NULL;

-- Si se elimina una RutinaDeEjemplo, se eliminan sus Ejercicios
ALTER TABLE EjerciciosDeRutinasDeEjemplo 
DROP CONSTRAINT fk_ejerciciosEjemplo_rutina;
ALTER TABLE EjerciciosDeRutinasDeEjemplo 
ADD CONSTRAINT fk_ejerciciosEjemplo_rutina 
FOREIGN KEY(id_rutina_ejemplo) REFERENCES RutinasDeEjemplo(id_rutina_ejemplo) ON DELETE CASCADE;
commit;