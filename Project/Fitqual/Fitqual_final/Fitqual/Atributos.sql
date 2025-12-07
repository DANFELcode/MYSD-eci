---------------------
-- ATRIBUTOS 
--Definición de restricciones para un único atributos(TIpos)
---------------------

-- Tabla: Personas
ALTER TABLE Personas
ADD CONSTRAINT ck_personas_correo CHECK (
    correo LIKE '%@%.%' AND LENGTH(correo) BETWEEN 5 AND 100
);

ALTER TABLE Personas
ADD CONSTRAINT chk_personas_rol CHECK (rol IN ('Usuario', 'EspecialistaFitness'));

-- Tabla: EspecialistasFitness
ALTER TABLE EspecialistasFitness
ADD CONSTRAINT chk_especialistas_consejos
CHECK (consejos_publicados >= 0 );

--Tabla: Usuarios
ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_nivel CHECK (nivel IN ('Básico', 'Intermedio', 'Avanzado'));

ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_sexo CHECK (sexo IN ('M', 'F'));

ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_edad
CHECK (edad BETWEEN 10 AND 100);

ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_peso
CHECK (peso BETWEEN 30 AND 400);

ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_altura
CHECK (altura BETWEEN 1.10 AND 2.40);

ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_frecuencia
CHECK (frecuencia_entreno_semanal BETWEEN 1 AND 7);

ALTER TABLE Usuarios
ADD CONSTRAINT chk_usuarios_membresia
CHECK (membresia_activa IN ('0', '1'));

-- Tabla: Feedbacks
ALTER TABLE Feedbacks
ADD CONSTRAINT chk_feedbacks_calificacion
CHECK (calificacion BETWEEN 1 AND 5);

ALTER TABLE Feedbacks
ADD CONSTRAINT chk_feedbacks_tipo
CHECK (tipo_feedback IN ('EspecialistaFitness', 'RutinasDeEjemplo', 'Progreso', 'Sistema'));

ALTER TABLE Feedbacks
ADD CONSTRAINT chk_feedbacks_visibilidad
CHECK (visibilidad IN ('Público', 'Privado'));



--Tabla: Recomendaciones
ALTER TABLE Recomendaciones
ADD CONSTRAINT chk_recomendaciones_tipo_enfoque
CHECK (tipo_enfoque IN (
    'Nutrición',
    'Entrenamiento',
    'Salud mental',
    'Descanso',
    'Motivación'
));


-- Tabla: Progresos
ALTER TABLE Progresos
ADD CONSTRAINT chk_progresos_peso
CHECK (peso_actual BETWEEN 30 AND 300);

ALTER TABLE Progresos
ADD CONSTRAINT chk_progresos_grasa
CHECK ((porcentaje_grasa BETWEEN 0 AND 100) OR porcentaje_grasa IS NULL);

-- Tabla: PlanesFitness
ALTER TABLE PlanesFitness
ADD CONSTRAINT ck_plan_duracion CHECK (
    (duracion IS NULL) OR
    (duracion LIKE '% semanas' OR duracion LIKE '% meses' OR duracion LIKE '% días' OR duracion LIKE '% dias')
);

-- Tabla: Rutinas
ALTER TABLE Rutinas
ADD CONSTRAINT chk_rutinas_duracion
CHECK ((duracion_rutina_min BETWEEN 1 AND 500) OR duracion_rutina_min IS NULL);

ALTER TABLE Rutinas
ADD CONSTRAINT chk_rutinas_nivel
CHECK ((nivel_dificultad IN ('Básico', 'Intermedio', 'Avanzado')) OR nivel_dificultad IS NULL);

ALTER TABLE Rutinas
ADD CONSTRAINT chk_rutinas_tipo
CHECK ((tipo_entrenamiento IN ('Cardio', 'Fuerza')) OR tipo_entrenamiento IS NULL);



-- Tabla: Comidas
ALTER TABLE Comidas
ADD CONSTRAINT chk_comidas_calorias
CHECK ((calorias BETWEEN 0 AND 3000) OR calorias IS NULL);

ALTER TABLE Comidas
ADD CONSTRAINT chk_comidas_carbohidratos
CHECK ((carbohidratos >= 0) or carbohidratos IS NULL);

ALTER TABLE Comidas
ADD CONSTRAINT chk_comidas_grasas
CHECK ((grasas >= 0) or grasas IS NULL);

ALTER TABLE Comidas
ADD CONSTRAINT chk_comidas_proteinas
CHECK ((proteinas >= 0) OR proteinas IS NULL);

--Tabla: Habitos
ALTER TABLE Habitos
ADD CONSTRAINT chk_habitos_frecuencia
CHECK (
    LOWER(frecuencia) LIKE '%diario%'
    OR LOWER(frecuencia) LIKE '%semana%'
    OR LOWER(frecuencia) LIKE '%mes%'
    OR LOWER(frecuencia) LIKE '%sesión%'
    OR LOWER(frecuencia) LIKE '%dia%'    
);

--Tabla: Ejercicios
ALTER TABLE Ejercicios
ADD CONSTRAINT chk_ejercicio_series
CHECK ((series > 0) OR series IS NULL);

ALTER TABLE Ejercicios
ADD CONSTRAINT chk_ejercicio_repeticiones
CHECK ((repeticiones > 0) OR repeticiones IS NULL);

ALTER TABLE Ejercicios
ADD CONSTRAINT chk_ejercicio_duracion
CHECK ((duracion_min BETWEEN 1 AND 500) OR duracion_min IS NULL);

-- Tabla: RutinasDeEjemplo: 
ALTER TABLE RutinasDeEjemplo
ADD CONSTRAINT chk_rutinasejemplo_duracion CHECK (duracion_rutina BETWEEN 1 AND 500);

ALTER TABLE RutinasDeEjemplo
ADD CONSTRAINT chk_rutinasejemplo_nivel CHECK (nivel_dificultad IN ('Básico', 'Intermedio', 'Avanzado'));

ALTER TABLE RutinasDeEjemplo
ADD CONSTRAINT chk_rutinasejemplo_tipo CHECK ( tipo_entrenamiento IN ('Cardio', 'Fuerza'));

--Tabla Ejercicioderutinasdeejemplo

ALTER TABLE EjerciciosDeRutinasDeEjemplo
ADD CONSTRAINT chk_ejercicios_ejemplo_series CHECK (series > 0);

ALTER TABLE EjerciciosDeRutinasDeEjemplo
ADD CONSTRAINT chk_ejercicios_ejemplo_repeticiones CHECK (repeticiones > 0);

ALTER TABLE EjerciciosDeRutinasDeEjemplo
ADD CONSTRAINT chk_ejercicios_ejemplo_duracion CHECK (duracion_min > 0);

-----------------------
-- VALORES POR DEFECTO (DEFAULT)
-----------------------

-- Tabla: Usuarios
ALTER TABLE Usuarios MODIFY membresia_activa DEFAULT '0';
ALTER TABLE Usuarios MODIFY imc DEFAULT NULL;

-- Tabla: EspecialistasFitness
ALTER TABLE EspecialistasFitness MODIFY consejos_publicados DEFAULT 0;

COMMIT;

