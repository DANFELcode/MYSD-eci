----------------------------------
-- XTablas
-- Eliminación de tablas
----------------------------------

-- PRIMERO: Tablas sin dependencias o con menos dependencias
DROP TABLE EjerciciosDeRutinasDeEjemplo CASCADE CONSTRAINTS;
DROP TABLE ObjetivosRecomendaciones CASCADE CONSTRAINTS;

-- SEGUNDO: Tablas que dependen de otras tablas hijas
DROP TABLE Ejercicios CASCADE CONSTRAINTS;
DROP TABLE RutinasDeEjemplo CASCADE CONSTRAINTS;

-- TERCERO: Tablas hijas intermedias
DROP TABLE Feedbacks CASCADE CONSTRAINTS;
DROP TABLE Recomendaciones CASCADE CONSTRAINTS;
DROP TABLE Objetivos CASCADE CONSTRAINTS;
DROP TABLE Progresos CASCADE CONSTRAINTS;
DROP TABLE Rutinas CASCADE CONSTRAINTS;
DROP TABLE Comidas CASCADE CONSTRAINTS;
DROP TABLE Habitos CASCADE CONSTRAINTS;
DROP TABLE PlanesFitnessDeUsuarios CASCADE CONSTRAINTS;

-- CUARTO: Tablas padre importantes
DROP TABLE PlanesFitness CASCADE CONSTRAINTS;

-- QUINTO: Tablas de usuarios/especialistas
DROP TABLE Usuarios CASCADE CONSTRAINTS;
DROP TABLE EspecialistasFitness CASCADE CONSTRAINTS;

-- SEXTO: Tabla raíz
DROP TABLE Personas CASCADE CONSTRAINTS;

commit;