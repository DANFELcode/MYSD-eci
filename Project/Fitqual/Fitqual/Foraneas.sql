------------------
-- CLAVES FORÁNEAS
-- Definición de claves foraneas
------------------

-- EspecialistasFitness -> Personas
ALTER TABLE EspecialistasFitness
ADD CONSTRAINT fk_especialistas_persona
FOREIGN KEY (id_persona) REFERENCES Personas(id_persona);

-- Usuarios -> Personas
ALTER TABLE Usuarios
ADD CONSTRAINT fk_usuarios_persona
FOREIGN KEY (id_persona) REFERENCES Personas(id_persona);

-- Feedbacks -> Usuarios
ALTER TABLE Feedbacks
ADD CONSTRAINT fk_feedbacks_usuario
FOREIGN KEY (usuario) REFERENCES Usuarios(id_persona);

-- Recomendaciones -> EspecialistasFitness
ALTER TABLE Recomendaciones
ADD CONSTRAINT fk_recomendaciones_especialista
FOREIGN KEY (especialista_fitness) REFERENCES EspecialistasFitness(id_persona);

-- Objetivos -> Usuarios
ALTER TABLE Objetivos
ADD CONSTRAINT fk_objetivos_usuario
FOREIGN KEY (usuario) REFERENCES Usuarios(id_persona);

-- Progresos -> Usuarios
ALTER TABLE Progresos
ADD CONSTRAINT fk_progresos_usuario
FOREIGN KEY (usuario) REFERENCES Usuarios(id_persona);

-- PlanesFitnessDeUsuarios -> Usuarios
ALTER TABLE PlanesFitnessDeUsuarios
ADD CONSTRAINT fk_planesusuarios_usuario
FOREIGN KEY (usuario) REFERENCES Usuarios(id_persona);

-- PlanesFitnessDeUsuarios -> PlanesFitness
ALTER TABLE PlanesFitnessDeUsuarios
ADD CONSTRAINT fk_planesusuarios_plan
FOREIGN KEY (planfitness) REFERENCES PlanesFitness(id_plan);

-- Rutinas -> PlanesFitness
ALTER TABLE Rutinas
ADD CONSTRAINT fk_rutinas_plan
FOREIGN KEY (planfitness) REFERENCES PlanesFitness(id_plan);

-- Comidas -> PlanesFitness
ALTER TABLE Comidas
ADD CONSTRAINT fk_comidas_plan
FOREIGN KEY (planfitness) REFERENCES PlanesFitness(id_plan);

-- Habitos -> PlanesFitness
ALTER TABLE Habitos
ADD CONSTRAINT fk_habitos_plan
FOREIGN KEY (planfitness) REFERENCES PlanesFitness(id_plan);

-- Ejercicios -> Rutinas
ALTER TABLE Ejercicios
ADD CONSTRAINT fk_ejercicios_rutina
FOREIGN KEY (id_rutina) REFERENCES Rutinas(id_rutina);

-- ObjetivosRecomendaciones -> Recomendaciones
ALTER TABLE ObjetivosRecomendaciones
ADD CONSTRAINT fk_objrec_recomendacion
FOREIGN KEY (id_recomendacion) REFERENCES Recomendaciones(id_recomendacion);

-- ObjetivosRecomendaciones -> Objetivos
ALTER TABLE ObjetivosRecomendaciones
ADD CONSTRAINT fk_objrec_objetivo
FOREIGN KEY (id_objetivo) REFERENCES Objetivos(id_objetivo);

-- RutinasDeEjemplo -> EspecialistasFitness
ALTER TABLE RutinasDeEjemplo
ADD CONSTRAINT fk_rutinasEjemplo_especialista
FOREIGN KEY (especialista_fitness) REFERENCES EspecialistasFitness(id_persona);

-- EjerciciosDeRutinasDeEjemplo -> RutinasDeEjemplo
ALTER TABLE EjerciciosDeRutinasDeEjemplo
ADD CONSTRAINT fk_ejerciciosEjemplo_rutina
FOREIGN KEY (id_rutina_ejemplo) REFERENCES RutinasDeEjemplo(id_rutina_ejemplo);

