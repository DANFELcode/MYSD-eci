-- FitQual
----------------------------
-- TABLAS:CREACIÓN DE TABLAS
----------------------------

CREATE TABLE Personas (
    id_persona NUMBER(10) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    correo VARCHAR2(100) NOT NULL,
    contrasena VARCHAR2(50) NOT NULL,
    rol VARCHAR2(50) NOT NULL
);

CREATE TABLE EspecialistasFitness (
    id_persona NUMBER(10) NOT NULL,
    especialidad VARCHAR2(100) NOT NULL,
    descripcion_perfil VARCHAR2(500) NOT NULL,
    trayectoria_profesional VARCHAR2(500) NOT NULL,
    consejos_publicados NUMBER(5) NOT NULL
);


CREATE TABLE Usuarios (
    id_persona NUMBER(10) NOT NULL,
    meta VARCHAR2(100),
    nivel VARCHAR2(50) NOT NULL,
    frecuencia_entreno_semanal NUMBER(1),
    edad NUMBER(3) NOT NULL,
    sexo VARCHAR2(10) NOT NULL,
    peso NUMBER(5,2) NOT NULL,
    altura NUMBER(5,2) NOT NULL,
    imc NUMBER(5,2),
    fecha_inicio_membresia DATE,
    membresia_activa CHAR(1) NOT NULL,
    fecha_fin_membresia DATE
);


CREATE TABLE Feedbacks (
    id_feedback NUMBER(10) NOT NULL,
    usuario NUMBER(10) NOT NULL,
    contenido VARCHAR2(500) NOT NULL,
    fecha DATE NOT NULL,
    calificacion NUMBER(1) NOT NULL,
    tipo_feedback VARCHAR2(50) NOT NULL,
    visibilidad VARCHAR2(50) NOT NULL
);

CREATE TABLE Recomendaciones (
    id_recomendacion NUMBER(10) NOT NULL,
    especialista_fitness NUMBER(10) NOT NULL,
    contenido VARCHAR2(1000) NOT NULL,
    fecha_creacion DATE NOT NULL,
    tipo_enfoque VARCHAR2(50) NOT NULL
);


CREATE TABLE Objetivos (
    id_objetivo NUMBER(10) NOT NULL,
    usuario NUMBER(10) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    contenido VARCHAR2(500) NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE Progresos (
    id_progreso NUMBER(10) NOT NULL,
    usuario NUMBER(10) NOT NULL,
    peso_actual NUMBER(5,2) NOT NULL,
    medidas VARCHAR2(500),
    porcentaje_grasa NUMBER(5,2),
    imc NUMBER(5,2),
    fecha_registro DATE NOT NULL
);

CREATE TABLE PlanesFitness (
    id_plan NUMBER(10) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    duracion VARCHAR2(50),
    descripcion VARCHAR2(500) NOT NULL
);

CREATE TABLE PlanesFitnessDeUsuarios (
    usuario NUMBER(10) NOT NULL,
    planfitness NUMBER(10) NOT NULL,
    comentario_usuario VARCHAR2(700)
);



CREATE TABLE Rutinas (
    id_rutina NUMBER(10) NOT NULL,
    planfitness NUMBER(10) NOT NULL,
    nombre_rutina VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    dias_semana VARCHAR2(50),
    duracion_rutina_min NUMBER(3),
    nivel_dificultad VARCHAR2(50),
    tipo_entrenamiento VARCHAR2(50) 
);

CREATE TABLE Comidas (
    id_comida NUMBER(10) NOT NULL,
    planfitness NUMBER(10) NOT NULL,
    nombre_comida VARCHAR2(100) NOT NULL,
    calorias NUMBER(5),
    carbohidratos NUMBER(5,2),
    grasas NUMBER(5,2),
    proteinas NUMBER(5,2)
);

CREATE TABLE Habitos (
    id_habito NUMBER(10) NOT NULL,
    planfitness NUMBER(10) NOT NULL,
    nombre_habito VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(500) NOT NULL,
    frecuencia VARCHAR2(200)
);


CREATE TABLE Ejercicios (
    id_ejercicio NUMBER(10) NOT NULL,
    id_rutina NUMBER(10) NOT NULL,
    nombre_ejercicio VARCHAR2(100) NOT NULL,
    series NUMBER(3),
    repeticiones NUMBER(3),
    descripcion VARCHAR2(500),
    duracion_min NUMBER(3)
);

CREATE TABLE ObjetivosRecomendaciones (
    id_recomendacion NUMBER(10) NOT NULL,
    id_objetivo NUMBER(10) NOT NULL
);

CREATE TABLE RutinasDeEjemplo (
    id_rutina_ejemplo NUMBER(10) NOT NULL,
    especialista_fitness NUMBER(10) NOT NULL,
    nombre_rutina VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000),
    dias_semana VARCHAR2(50) NOT NULL,
    duracion_rutina NUMBER(3) NOT NULL,
    nivel_dificultad VARCHAR2(50) NOT NULL,
    tipo_entrenamiento VARCHAR2(50) NOT NULL
);



CREATE TABLE EjerciciosDeRutinasDeEjemplo (
    id_ejercicio_ejemplo NUMBER(10) NOT NULL,
    id_rutina_ejemplo NUMBER(10) NOT NULL,
    nombre_ejercicio VARCHAR2(100) NOT NULL,
    series NUMBER(3) NOT NULL,
    repeticiones NUMBER(3) NOT NULL,
    descripcion VARCHAR2(500) NULL,
    duracion_min NUMBER(3) NOT NULL
);

commit;

