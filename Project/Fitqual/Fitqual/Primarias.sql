---------------------
-- Primarias
-- Definición de claves primarias
---------------------
ALTER TABLE Personas ADD CONSTRAINT pk_personas PRIMARY KEY (id_persona);
ALTER TABLE EspecialistasFitness ADD CONSTRAINT pk_especialistas PRIMARY KEY (id_persona);
ALTER TABLE Usuarios ADD CONSTRAINT pk_usuarios PRIMARY KEY (id_persona);
ALTER TABLE Feedbacks ADD CONSTRAINT pk_feedbacks PRIMARY KEY (id_feedback);
ALTER TABLE Recomendaciones ADD CONSTRAINT pk_recomendaciones PRIMARY KEY (id_recomendacion);
ALTER TABLE Objetivos ADD CONSTRAINT pk_objetivos PRIMARY KEY (id_objetivo);
ALTER TABLE Progresos ADD CONSTRAINT pk_progresos PRIMARY KEY (id_progreso);
ALTER TABLE PlanesFitness ADD CONSTRAINT pk_planes PRIMARY KEY (id_plan);
ALTER TABLE Rutinas ADD CONSTRAINT pk_rutinas PRIMARY KEY (id_rutina);
ALTER TABLE Comidas ADD CONSTRAINT pk_comidas PRIMARY KEY (id_comida);
ALTER TABLE Habitos ADD CONSTRAINT pk_habitos PRIMARY KEY (id_habito);

--Las siguiente es una clave compuesta debido a que un ejercicio se puede repetir en varias rutinas
ALTER TABLE Ejercicios ADD CONSTRAINT pk_ejercicios PRIMARY KEY (id_ejercicio, id_rutina);

ALTER TABLE ObjetivosRecomendaciones ADD CONSTRAINT pk_objrec PRIMARY KEY (id_recomendacion, id_objetivo);
ALTER TABLE RutinasDeEjemplo ADD CONSTRAINT pk_rutinas_ejemplo PRIMARY KEY (id_rutina_ejemplo);

--Las siguiente es una clave compuesta debido a que un ejercicio se puede repetir en varias rutinas
ALTER TABLE EjerciciosDeRutinasDeEjemplo ADD CONSTRAINT pk_ejercicios_ejemplo PRIMARY KEY (id_ejercicio_ejemplo, id_rutina_ejemplo);

ALTER TABLE PlanesFitnessDeUsuarios ADD CONSTRAINT pk_planes_usuarios PRIMARY KEY (Usuario, planfitness);




