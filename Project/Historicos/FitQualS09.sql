-- FitQual
----------------------------
-- TABLAS:CREACIÓN DE TABLAS
----------------------------

CREATE TABLE Persona (
    id_persona NUMBER(7),
    nombre VARCHAR2(50),
    correo VARCHAR2(50),
    contrasena VARCHAR2(50),
    rol VARCHAR2(20)
);

CREATE TABLE Nutricionista (
    id_persona NUMBER(7),
    especialidad VARCHAR2(70),
    descripcion_perfil VARCHAR2(300),
    trayectoria_profesional VARCHAR2(500),
    consejos_publicados NUMBER,
    planes_publicados NUMBER
);

CREATE TABLE Usuario (
    id_persona NUMBER(7),
    meta_ VARCHAR2(50),
    nivel VARCHAR2(50),
    frecuencia_entreno NUMBER(1),
    edad NUMBER(3),
    sexo CHAR(1),
    peso NUMBER(5,3),
    altura NUMBER(5,3),
    fecha_inicio_membresia DATE,
    membresia_activa CHAR(1),
    fecha_fin_membresia DATE
);

CREATE TABLE Feedback_ (
    id_feedback NUMBER(7),
    contenido VARCHAR2(500),
    fecha DATE,
    calificacion NUMBER(1),
    tipo_feedback VARCHAR2(50),
    visibilidad VARCHAR2(50)
);

CREATE TABLE Recomendacion (
    id_recomendacion NUMBER(7),
    id_nutricionista NUMBER(7),
    contenido VARCHAR2(1000),
    fecha_creacion DATE,
    tipo_enfoque VARCHAR2(50)
);

CREATE TABLE Objetivo (
    id_objetivo NUMBER(10),
    nombre VARCHAR2(100),
    contenido VARCHAR2(500),
    id_persona NUMBER(10),
    fecha_creacion DATE
);

CREATE TABLE Progreso (
    id_progreso NUMBER(10),
    id_persona NUMBER(10),
    peso_actual NUMBER(5,3),
    medidas VARCHAR2(100),
    porcentaje_grasa NUMBER(4,2),
    fecha_registro DATE
);

CREATE TABLE PlanFitness (
    id_plan NUMBER(10),
    nombre VARCHAR2(100),
    duracion VARCHAR2(50),
    descripcion VARCHAR2(200)
);

CREATE TABLE Rutina (
    id_rutina NUMBER(10),
    nombre_rutina VARCHAR2(100),
    descripcion VARCHAR2(1000),
    dias_semana VARCHAR2(20),
    duracion_rutina NUMBER(3),
    nivel_dificultad VARCHAR2(50),
    tipo_entrenamiento VARCHAR2(50),
    id_plan NUMBER(10)
);

CREATE TABLE Alimentacion (
    id_alimentacion NUMBER(10),
    nombre_comida VARCHAR2(100),
    calorias NUMBER(5),
    carbohidratos NUMBER(5),
    grasas NUMBER(5),
    proteinas NUMBER(5),
    id_plan NUMBER(10)
);

CREATE TABLE Habito (
    id_habito NUMBER(10),
    nombre_habito VARCHAR2(100),
    descripcion VARCHAR2(500),
    frecuencia VARCHAR2(200),
    id_plan NUMBER(10)
);

CREATE TABLE PlanFitnessDeUsuario (
    id_usuario NUMBER(10),
    id_planfitness NUMBER(10),
    comentario_usuario VARCHAR2(700)
);

---------------------
-- ATRIBUTOS Y TIPOS
---------------------

-- Tabla: Persona
ALTER TABLE Persona
MODIFY (rol VARCHAR2(20) CHECK (rol IN ('Usuario', 'Nutricionista')));

-- Tabla: Usuario
ALTER TABLE Usuario MODIFY (id_usuario NUMBER(7) NOT NULL);

ALTER TABLE Usuario MODIFY (id_persona NUMBER(7) NOT NULL);

ALTER TABLE Usuario
MODIFY (sexo CHAR(1) CHECK (sexo IN ('M','F')));

ALTER TABLE Usuario
MODIFY (edad NUMBER(3) CHECK (edad > 0));

ALTER TABLE Usuario
MODIFY (peso NUMBER(5,3) CHECK (peso > 0));

ALTER TABLE Usuario
MODIFY (altura NUMBER(5,3) CHECK (altura > 0));

ALTER TABLE Usuario
MODIFY (frecuencia_entreno NUMBER(1) CHECK (frecuencia_entreno BETWEEN 1 AND 7));

ALTER TABLE Usuario
MODIFY (membresia_activa NUMBER(1) CHECK (membresia_activa IN (0,1)) NOT NULL);

-- Tabla: Feedback
ALTER TABLE Feedback_
MODIFY (calificacion NUMBER(1) CHECK (calificacion BETWEEN 1 AND 5));

ALTER TABLE Feedback_
MODIFY (tipo_feedback VARCHAR2(100) CHECK (tipo_feedback IN ('Nutricionista','Plan','Progreso','Sistema')));

ALTER TABLE Feedback_
MODIFY (visibilidad VARCHAR2(50) CHECK (visibilidad IN ('Público','Privado')));

-- Tabla: Progreso
ALTER TABLE Progreso MODIFY (id_progreso NUMBER(7) NOT NULL);

ALTER TABLE Progreso MODIFY (id_usuario NUMBER(7) NOT NULL);

ALTER TABLE Progreso MODIFY (peso_actual NUMBER(5,3) CHECK (peso_actual > 0));

ALTER TABLE Progreso MODIFY (porcentaje_grasa NUMBER(4,2) CHECK (porcentaje_grasa BETWEEN 0 AND 100));

ALTER TABLE Progreso MODIFY (fecha_registro DATE NOT NULL);

-- Tabla: Rutina
ALTER TABLE Rutina MODIFY (id_rutina NUMBER(7) NOT NULL);

ALTER TABLE Rutina MODIFY (nombre_rutina VARCHAR2(50) NOT NULL);

ALTER TABLE Rutina MODIFY (duracion_rutina NUMBER(3) CHECK (duracion_rutina > 0));

ALTER TABLE Rutina MODIFY (nivel_dificultad VARCHAR2(50) CHECK (nivel_dificultad IN ('Básico','Intermedio','Avanzado')) NOT NULL);

-- Tabla: Alimentacion
ALTER TABLE Alimentacion
MODIFY (calorias NUMBER(5) CHECK (calorias >= 0));

ALTER TABLE Alimentacion
MODIFY (carbohidratos NUMBER(5) CHECK (carbohidratos >= 0));

ALTER TABLE Alimentacion
MODIFY (grasas NUMBER(5) CHECK (grasas >= 0));

ALTER TABLE Alimentacion
MODIFY (proteinas NUMBER(5) CHECK (proteinas >= 0));

--------------------
-- CLAVES PRIMARIAS
--------------------

ALTER TABLE Persona ADD CONSTRAINT pk_persona PRIMARY KEY (id_persona);
ALTER TABLE Nutricionista ADD CONSTRAINT pk_nutricionista PRIMARY KEY (id_persona);
ALTER TABLE Usuario ADD CONSTRAINT pk_usuario PRIMARY KEY (id_persona);
ALTER TABLE Feedback_ ADD CONSTRAINT pk_feedback PRIMARY KEY (id_feedback);
ALTER TABLE Recomendacion ADD CONSTRAINT pk_recomendacion PRIMARY KEY (id_recomendacion);
ALTER TABLE Objetivo ADD CONSTRAINT pk_objetivo PRIMARY KEY (id_objetivo);
ALTER TABLE Progreso ADD CONSTRAINT pk_progreso PRIMARY KEY (id_progreso);
ALTER TABLE PlanFitness ADD CONSTRAINT pk_planfitness PRIMARY KEY (id_plan);
ALTER TABLE Rutina ADD CONSTRAINT pk_rutina PRIMARY KEY (id_rutina);
ALTER TABLE Alimentacion ADD CONSTRAINT pk_alimentacion PRIMARY KEY (id_alimentacion);
ALTER TABLE Habito ADD CONSTRAINT pk_habito PRIMARY KEY (id_habito);
ALTER TABLE PlanFitnessDeUsuario ADD CONSTRAINT pk_planfitness_usuario PRIMARY KEY (id_usuario, id_planfitness);

----------------
-- CLAVES ÚNICAS 
----------------

ALTER TABLE Persona ADD CONSTRAINT uk_persona_correo UNIQUE (correo);
ALTER TABLE Persona ADD CONSTRAINT uk_persona_contrasena UNIQUE (contrasena);

------------------
-- CLAVES FORÁNEAS
------------------

-- Usuario y Nutricionista heredan de Persona
ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_persona FOREIGN KEY (id_persona)
REFERENCES Persona(id_persona);

ALTER TABLE Nutricionista ADD CONSTRAINT fk_nutricionista_persona FOREIGN KEY (id_persona)
REFERENCES Persona(id_persona);

-- Recomendaciones creadas por nutricionistas
ALTER TABLE Recomendacion ADD CONSTRAINT fk_recomendacion_nutricionista FOREIGN KEY (id_nutricionista)
REFERENCES Nutricionista(id_persona);

-- Objetivos y progreso pertenecen a usuarios
ALTER TABLE Objetivo ADD CONSTRAINT fk_objetivo_usuario FOREIGN KEY (id_persona)
REFERENCES Usuario(id_persona);

ALTER TABLE Progreso ADD CONSTRAINT fk_progreso_usuario FOREIGN KEY (id_persona)
REFERENCES Usuario(id_persona);

-- PlanFitnessDeUsuario vincula Usuario y PlanFitness
ALTER TABLE PlanFitnessDeUsuario ADD CONSTRAINT fk_planf_usuario FOREIGN KEY (id_usuario)
REFERENCES Usuario(id_persona);

ALTER TABLE PlanFitnessDeUsuario ADD CONSTRAINT fk_planf_planfitness FOREIGN KEY (id_planfitness)
REFERENCES PlanFitness(id_plan);

-- Rutina, Alimentacion y Habito pertenecen a PlanFitness
ALTER TABLE Rutina ADD CONSTRAINT fk_rutina_planfitness FOREIGN KEY (id_plan)
REFERENCES PlanFitness(id_plan);

ALTER TABLE Alimentacion ADD CONSTRAINT fk_alimentacion_planfitness FOREIGN KEY (id_plan)
REFERENCES PlanFitness(id_plan);

ALTER TABLE Habito ADD CONSTRAINT fk_habito_planfitness FOREIGN KEY (id_plan)
REFERENCES PlanFitness(id_plan);

----------------------------------
-- XTablas: ELIMINACIÓN DE TABLAS
----------------------------------

DROP TABLE PlanFitnessDeUsuario CASCADE CONSTRAINTS;
DROP TABLE Habito CASCADE CONSTRAINTS;
DROP TABLE Alimentacion CASCADE CONSTRAINTS;
DROP TABLE Rutina CASCADE CONSTRAINTS;
DROP TABLE PlanFitness CASCADE CONSTRAINTS;
DROP TABLE Progreso CASCADE CONSTRAINTS;
DROP TABLE Objetivo CASCADE CONSTRAINTS;
DROP TABLE Recomendacion CASCADE CONSTRAINTS;
DROP TABLE Feedback_ CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;
DROP TABLE Nutricionista CASCADE CONSTRAINTS;
DROP TABLE Persona CASCADE CONSTRAINTS;
