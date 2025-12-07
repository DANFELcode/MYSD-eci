----------------
-- CLAVES ÚNICAS 
-- Definición de claves únicas
----------------

ALTER TABLE Personas ADD CONSTRAINT uk_personas_correo UNIQUE (correo);
ALTER TABLE PlanesFitness ADD CONSTRAINT uk_PlanFitness_nombre UNIQUE (nombre);

-- Dentro de un mismo plan el nombre de la rutina debe ser unico
ALTER TABLE Rutinas ADD CONSTRAINT uk_rutinas_plan_nombre UNIQUE (planfitness, nombre_rutina);

-- Dentro de un mismo plan el nombre de la comida debe ser unico
ALTER TABLE Comidas ADD CONSTRAINT uk_comidas_plan_nombre UNIQUE (planfitness, nombre_comida);

-- Dentro de un mismo plan el nombre del habito deberia ser unico
ALTER TABLE Habitos ADD CONSTRAINT uk_habitos_plan_nombre UNIQUE (planfitness, nombre_habito);

-- Un especialista no puede repetir el nombre de la rutina

ALTER TABLE RutinasDeEjemplo
ADD CONSTRAINT uk_rutinas_ejemplo_especialista_nombre UNIQUE (especialista_fitness, nombre_rutina);

commit;

