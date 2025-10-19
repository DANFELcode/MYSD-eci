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


----------------------------------
-- POBLAROK: INGRESO DE DATOS CORRECTOS
----------------------------------

--Tabla: Persona
INSERT INTO Persona VALUES (1, 'Carlos Pérez', 'carlosp@gmail.com', 'pass001', 'Nutricionista');
INSERT INTO Persona VALUES (2, 'Laura Gómez', 'laurag@gmail.com', 'pass002', 'Nutricionista');
INSERT INTO Persona VALUES (3, 'Juan Ruiz', 'juanr@gmail.com', 'pass003', 'Nutricionista');
INSERT INTO Persona VALUES (4, 'Marta Díaz', 'martad@gmail.com', 'pass004', 'Nutricionista');
INSERT INTO Persona VALUES (5, 'Pedro López', 'pedrol@gmail.com', 'pass005', 'Nutricionista');
INSERT INTO Persona VALUES (6, 'Daniel Torres', 'dtorres@gmail.com', 'pass006', 'Usuario');
INSERT INTO Persona VALUES (7, 'Ana Rojas', 'anar@gmail.com', 'pass007', 'Usuario');
INSERT INTO Persona VALUES (8, 'Luis Castro', 'lcastro@gmail.com', 'pass008', 'Usuario');
INSERT INTO Persona VALUES (9, 'Valentina Mora', 'vmora@gmail.com', 'pass009', 'Usuario');
INSERT INTO Persona VALUES (10, 'Camilo Suárez', 'csuarez@gmail.com', 'pass010', 'Usuario');
INSERT INTO Persona VALUES (11, 'Sofía Torres', 'storres@gmail.com', 'pass011', 'Usuario');
INSERT INTO Persona VALUES (12, 'Diego León', 'dleon@gmail.com', 'pass012', 'Usuario');


COMMIT;

--Tabla: Nutricionista
INSERT INTO Nutricionista VALUES (1, 'Nutrición deportiva', 'Apasionado por el rendimiento físico.', '10 años asesorando atletas.', 45, 12);
INSERT INTO Nutricionista VALUES (2, 'Nutrición clínica', 'Experta en control de peso.', 'Licenciada en nutrición UNAL.', 30, 8);
INSERT INTO Nutricionista VALUES (3, 'Nutrición holística', 'Promueve la alimentación natural.', 'Diplomado en salud integral.', 25, 6);
INSERT INTO Nutricionista VALUES (4, 'Dietas personalizadas', 'Crea planes según objetivos.', 'Ex entrenadora certificada.', 18, 10);
INSERT INTO Nutricionista VALUES (5, 'Rehabilitación nutricional', 'Foco en recuperación muscular.', 'MSc en nutrición deportiva.', 28, 9);

--Tabla: Usuario
INSERT INTO Usuario VALUES (6, 'Aumentar masa muscular', 'Intermedio', 5, 22, 'M', 70.5, 1.73, DATE '2024-05-01', 1, DATE '2025-05-01');
INSERT INTO Usuario VALUES (7, 'Perder grasa', 'Principiante', 4, 25, 'F', 62.0, 1.65, DATE '2024-06-15', 1, DATE '2025-06-15');
INSERT INTO Usuario VALUES (8, 'Tonificar', 'Intermedio', 3, 28, 'M', 75.2, 1.80, DATE '2024-07-10', 1, DATE '2025-07-10');
INSERT INTO Usuario VALUES (9, 'Mejorar resistencia', 'Avanzado', 6, 31, 'F', 58.4, 1.68, DATE '2024-08-01', 1, DATE '2025-08-01');
INSERT INTO Usuario VALUES (10, 'Mantener peso', 'Intermedio', 5, 26, 'M', 68.1, 1.72, DATE '2024-05-25', 1, DATE '2025-05-25');
INSERT INTO Usuario VALUES (11, 'Aumentar fuerza', 'Avanzado', 6, 24, 'F', 60.8, 1.69, DATE '2024-06-10', 1, DATE '2025-06-10');
INSERT INTO Usuario VALUES (12, 'Reducir grasa corporal', 'Principiante', 3, 27, 'M', 83.4, 1.78, DATE '2024-07-05', 1, DATE '2025-07-05');


--Tabla: PlanFitness
INSERT INTO PlanFitness VALUES (1, 'Plan Fuerza Total', '8 semanas', 'Entrenamiento de cuerpo completo.');
INSERT INTO PlanFitness VALUES (2, 'Plan Quema Grasa', '6 semanas', 'Alta intensidad y control calórico.');
INSERT INTO PlanFitness VALUES (3, 'Plan Tonificación', '10 semanas', 'Mejora muscular y resistencia.');
INSERT INTO PlanFitness VALUES (4, 'Plan Principiante', '4 semanas', 'Base técnica y acondicionamiento.');
INSERT INTO PlanFitness VALUES (5, 'Plan Avanzado', '12 semanas', 'Máximo rendimiento y fuerza.');
INSERT INTO PlanFitness VALUES (6, 'Plan Rehabilitación', '6 semanas', 'Enfoque en movilidad y control.');
INSERT INTO PlanFitness VALUES (7, 'Plan Vegano', '8 semanas', 'Basado en proteínas vegetales.');
INSERT INTO PlanFitness VALUES (8, 'Plan Crossfit', '10 semanas', 'Alta intensidad funcional.');
INSERT INTO PlanFitness VALUES (9, 'Plan Balanceado', '6 semanas', 'Combinación de fuerza y cardio.');
INSERT INTO PlanFitness VALUES (10, 'Plan Definición', '8 semanas', 'Baja grasa y mantenimiento muscular.');

--Tabla: Recomendación
INSERT INTO Recomendacion VALUES (1, 1, 'Mantén una ingesta alta de proteínas.', DATE '2024-05-10', 'Nutrición');
INSERT INTO Recomendacion VALUES (2, 2, 'Evita alimentos procesados.', DATE '2024-05-12', 'Salud');
INSERT INTO Recomendacion VALUES (3, 3, 'Bebe 2L de agua al día.', DATE '2024-05-15', 'Hidratación');
INSERT INTO Recomendacion VALUES (4, 4, 'Incluye grasas saludables.', DATE '2024-05-18', 'Nutrición');
INSERT INTO Recomendacion VALUES (5, 5, 'Duerme al menos 7 horas.', DATE '2024-05-20', 'Descanso');
INSERT INTO Recomendacion VALUES (6, 1, 'Evita el exceso de azúcar.', DATE '2024-05-22', 'Salud');
INSERT INTO Recomendacion VALUES (7, 2, 'Consume frutas con moderación.', DATE '2024-05-25', 'Nutrición');
INSERT INTO Recomendacion VALUES (8, 3, 'Varía tus fuentes de proteína.', DATE '2024-05-28', 'Rendimiento');
INSERT INTO Recomendacion VALUES (9, 4, 'Reduce el estrés con ejercicios suaves.', DATE '2024-06-01', 'Bienestar');
INSERT INTO Recomendacion VALUES (10, 5, 'No te saltes comidas.', DATE '2024-06-03', 'Metabolismo');

--Tabla: Objetivo
INSERT INTO Objetivo VALUES (11, 'Definición muscular', 'Reducir grasa al 12%.', 6, DATE '2024-09-01');
INSERT INTO Objetivo VALUES (12, 'Mantener peso', 'Estabilizar peso 68kg.', 7, DATE '2024-09-10');
INSERT INTO Objetivo VALUES (18, 'Aumentar flexibilidad', 'Mejorar rango de movimiento.', 8, DATE '2024-09-20');
INSERT INTO Objetivo VALUES (19, 'Recuperar movilidad', 'Volver al entrenamiento completo.', 9, DATE '2024-10-01');
INSERT INTO Objetivo VALUES (20, 'Incrementar cardio', 'Aumentar VO2 max.', 10, DATE '2024-10-10');



-- Tabla: Feedback_

INSERT INTO Feedback_ VALUES (1, 'Excelente seguimiento del nutricionista.', DATE '2024-09-10', 5, 'Nutricionista', 'Público');
INSERT INTO Feedback_ VALUES (2, 'El plan fue exigente pero efectivo.', DATE '2024-09-15', 4, 'Plan', 'Público');
INSERT INTO Feedback_ VALUES (3, 'Buen progreso, aunque falta más control.', DATE '2024-09-20', 3, 'Progreso', 'Privado');
INSERT INTO Feedback_ VALUES (4, 'Excelente atención y acompañamiento.', DATE '2024-09-25', 5, 'Nutricionista', 'Público');
INSERT INTO Feedback_ VALUES (5, 'Sistema intuitivo y fácil de usar.', DATE '2024-09-28', 4, 'Sistema', 'Público');
INSERT INTO Feedback_ VALUES (6, 'Los resultados fueron notables.', DATE '2024-10-02', 5, 'Progreso', 'Público');
INSERT INTO Feedback_ VALUES (7, 'El plan fue claro y bien estructurado.', DATE '2024-10-05', 4, 'Plan', 'Privado');
INSERT INTO Feedback_ VALUES (8, 'Excelente comunicación con el nutricionista.', DATE '2024-10-08', 5, 'Nutricionista', 'Público');
INSERT INTO Feedback_ VALUES (9, 'El sistema presentó algunos errores.', DATE '2024-10-10', 3, 'Sistema', 'Privado');
INSERT INTO Feedback_ VALUES (10, 'Progreso constante y motivador.', DATE '2024-10-12', 5, 'Progreso', 'Público');


-- Tabla: Progreso

INSERT INTO Progreso VALUES (1, 6, 71.2, 'Pecho 95cm, Cintura 78cm', 14.5, DATE '2024-09-10');
INSERT INTO Progreso VALUES (2, 7, 60.8, 'Cintura 70cm, Cadera 95cm', 20.2, DATE '2024-09-15');
INSERT INTO Progreso VALUES (3, 8, 76.5, 'Brazos 33cm, Piernas 58cm', 18.0, DATE '2024-09-20');
INSERT INTO Progreso VALUES (4, 9, 57.9, 'Cintura 68cm, Espalda 90cm', 19.8, DATE '2024-09-25');
INSERT INTO Progreso VALUES (5, 10, 67.5, 'Pecho 90cm, Cintura 77cm', 16.3, DATE '2024-09-28');
INSERT INTO Progreso VALUES (6, 11, 61.5, 'Piernas 56cm, Cintura 72cm', 21.0, DATE '2024-10-02');
INSERT INTO Progreso VALUES (7, 12, 81.9, 'Cintura 84cm, Pecho 100cm', 22.5, DATE '2024-10-05');


-- Tabla: PlanFitnessDeUsuario

INSERT INTO PlanFitnessDeUsuario VALUES (6, 1, 'Excelente plan, aumenté mi fuerza rápidamente.');
INSERT INTO PlanFitnessDeUsuario VALUES (7, 2, 'Muy bueno, noté cambios en pocas semanas.');
INSERT INTO PlanFitnessDeUsuario VALUES (8, 3, 'Buen equilibrio entre cardio y tonificación.');
INSERT INTO PlanFitnessDeUsuario VALUES (9, 6, 'Ideal para recuperación después de lesión.');
INSERT INTO PlanFitnessDeUsuario VALUES (10, 4, 'Perfecto para retomar entrenamiento.');
INSERT INTO PlanFitnessDeUsuario VALUES (11, 5, 'Desafiante pero efectivo.');
INSERT INTO PlanFitnessDeUsuario VALUES (12, 9, 'Excelente balance general.');

-- Tabla: Rutina

INSERT INTO Rutina VALUES (1, 'Fuerza Base', 'Entrenamiento de cuerpo completo con foco en técnica.', 'Lunes,Miércoles,Viernes', 60, 'Intermedio', 'Fuerza', 1);
INSERT INTO Rutina VALUES (2, 'Cardio HIIT', 'Alta intensidad con descansos cortos.', 'Martes,Jueves', 40, 'Intermedio', 'Cardio', 2);
INSERT INTO Rutina VALUES (3, 'Tonificación General', 'Rutina con pesas ligeras y repeticiones altas.', 'Lunes,Viernes', 50, 'Básico', 'Resistencia', 3);
INSERT INTO Rutina VALUES (4, 'Movilidad Articular', 'Ejercicios para mejorar rango de movimiento.', 'Miércoles,Viernes', 45, 'Básico', 'Rehabilitación', 6);
INSERT INTO Rutina VALUES (5, 'Crossfit Intenso', 'Entrenamiento funcional de alta exigencia.', 'Lunes,Miércoles,Viernes', 55, 'Avanzado', 'Funcional', 8);
INSERT INTO Rutina VALUES (6, 'Definición Muscular', 'Rutina dividida por grupos musculares.', 'Lunes a Sábado', 70, 'Avanzado', 'Hipertrofia', 10);


-- Tabla: Alimentacion

INSERT INTO Alimentacion VALUES (1, 'Desayuno Proteico', 450, 40, 15, 35, 1);
INSERT INTO Alimentacion VALUES (2, 'Almuerzo Balanceado', 600, 50, 20, 40, 1);
INSERT INTO Alimentacion VALUES (3, 'Cena Ligera', 400, 35, 10, 30, 2);
INSERT INTO Alimentacion VALUES (4, 'Snack Saludable', 200, 20, 5, 10, 3);
INSERT INTO Alimentacion VALUES (5, 'Batido Vegano', 250, 30, 5, 20, 7);
INSERT INTO Alimentacion VALUES (6, 'Refección Rehabilitante', 500, 45, 15, 35, 6);
INSERT INTO Alimentacion VALUES (7, 'Comida Crossfit', 700, 60, 25, 45, 8);
INSERT INTO Alimentacion VALUES (8, 'Dieta Definición', 550, 40, 15, 45, 10);


-- Tabla: Habito

INSERT INTO Habito VALUES (1, 'Dormir bien', 'Dormir mínimo 7 horas diarias.', 'Diario', 1);
INSERT INTO Habito VALUES (2, 'Hidratación', 'Beber al menos 2L de agua.', 'Diario', 2);
INSERT INTO Habito VALUES (3, 'Estiramientos', 'Realizar 10 minutos de estiramiento después del entrenamiento.', 'Diario', 3);
INSERT INTO Habito VALUES (4, 'Control del Estrés', 'Practicar respiración consciente 5 minutos.', 'Diario', 6);
INSERT INTO Habito VALUES (5, 'Evitar alcohol', 'Limitar el consumo a eventos sociales.', 'Semanal', 9);
INSERT INTO Habito VALUES (6, 'Consumo de frutas', 'Incluir 3 porciones de frutas al día.', 'Diario', 7);
INSERT INTO Habito VALUES (7, 'Planificación de comidas', 'Organizar los menús semanales.', 'Semanal', 10);

-- ==========================================
--  POBLARNOOK - INGRESO DE DATOS INCORRECTOS
-- ==========================================

-- Tabla: Persona
INSERT INTO Persona VALUES (1, 'Ana López', 'ana@example.com', 'pass123', 'Usuario');
INSERT INTO Persona VALUES (1, 'Carlos Ruiz', 'carlos@example.com', 'pass456', 'Usuario');
INSERT INTO Persona VALUES (2, 'Luis Gómez', 'ana@example.com', 'pass789', 'Usuario');
INSERT INTO Persona VALUES (3, NULL, 'maria@example.com', 'clave123', 'Usuario');
INSERT INTO Persona VALUES (4, 'Pedro', 'pedro@example.com', 'clave999', 'Entrenador');

-- Tabla: Nutricionista
INSERT INTO Nutricionista VALUES (999, 'Deportiva', 'Perfil', 'Trayectoria', 5, 3);
INSERT INTO Nutricionista VALUES (1, 'Funcional', 'Texto', 'Experiencia', 'cinco', 2);

-- Tabla: Usuario
INSERT INTO Usuario VALUES (888, 'Perder peso', 'Básico', 8, 25, 'M', 70.5, 1.75, SYSDATE, 1, SYSDATE);
INSERT INTO Usuario VALUES (2, 'Tonificar', 'Avanzado', 5, -3, 'M', 65.2, 1.80, SYSDATE, 1, SYSDATE);
INSERT INTO Usuario VALUES (3, 'Fuerza', 'Intermedio', 4, 22, 'X', 70.0, 1.80, SYSDATE, 1, SYSDATE);
INSERT INTO Usuario VALUES (999, 'Resistencia', 'Básico', 3, 30, 'F', 0, 1.70, SYSDATE, 1, SYSDATE);
INSERT INTO Usuario VALUES (50, 'Ganar masa', 'Avanzado', 5, 28, 'M', 80, 1.80, NULL, 1, SYSDATE);

-- Tabla: Feedback_
INSERT INTO Feedback_ VALUES (1, 'Buen servicio', SYSDATE, 6, 'Plan', 'Público');
INSERT INTO Feedback_ VALUES (2, 'Regular', SYSDATE, 3, 'Cliente', 'Público');
INSERT INTO Feedback_ VALUES (3, NULL, SYSDATE, 4, 'Plan', 'Privado');
INSERT INTO Feedback_ VALUES (4, 'Excelente', 'fecha', 5, 'Plan', 'Privado');

-- Tabla: Recomendacion
INSERT INTO Recomendacion VALUES (1, 999, 'Comer más proteína', SYSDATE, 'Nutricional');
INSERT INTO Recomendacion VALUES (2, 1, 'Dormir mejor', SYSDATE, '');
INSERT INTO Recomendacion VALUES (3, 1, 'Hidratación', 'fecha', 'Salud');

-- Tabla: Objetivo
INSERT INTO Objetivo VALUES (1, 'Definición muscular', 'Bajar grasa corporal', 999, SYSDATE);
INSERT INTO Objetivo VALUES (1, 'Fuerza', 'Aumentar fuerza', 2, SYSDATE);
INSERT INTO Objetivo VALUES (3, NULL, 'Contenido', 2, SYSDATE);

-- Tabla: Progreso
INSERT INTO Progreso VALUES (1, 999, 70.0, '90-80-95', 20.0, SYSDATE);
INSERT INTO Progreso VALUES (2, 2, -5.0, '90-80-95', 20.0, SYSDATE);
INSERT INTO Progreso VALUES (3, 2, 70.0, '90-80-95', 150.0, SYSDATE);
INSERT INTO Progreso VALUES (4, 2, 70.0, '90-80-95', 20.0, NULL);

-- Tabla: PlanFitness
INSERT INTO PlanFitness VALUES (1, 'Plan Básico', '3 meses', 'Entrenamiento');
INSERT INTO PlanFitness VALUES (1, 'Plan Avanzado', '2 meses', 'Fuerza');
INSERT INTO PlanFitness VALUES (2, NULL, '1 mes', 'Fuerza');
INSERT INTO PlanFitness VALUES (3, 'Plan', 3, 'Texto');

-- Tabla: Rutina
INSERT INTO Rutina VALUES (1, 'Rutina A', 'Descripción', 'L-M', 60, 'Experto', 'Fuerza', 999);
INSERT INTO Rutina VALUES (2, 'Rutina B', 'Desc', 'L-M', -30, 'Básico', 'Cardio', 1);
INSERT INTO Rutina VALUES (3, NULL, 'Desc', 'L-M', 60, 'Básico', 'Fuerza', 1);

-- Tabla: Alimentacion
INSERT INTO Alimentacion VALUES (1, 'Desayuno', -100, 40, 10, 20, 1);
INSERT INTO Alimentacion VALUES (2, 'Cena', 500, 60, 15, 30, 999);
INSERT INTO Alimentacion VALUES (3, NULL, 300, 40, 10, 20, 1);

-- Tabla: Habito
INSERT INTO Habito VALUES (1, NULL, 'Dormir 8 horas', 'Diario', 1);
INSERT INTO Habito VALUES (2, 'Leer', NULL, 'Semanal', 999);
INSERT INTO Habito VALUES (3, 'Hidratarse', 'Beber agua', NULL, 1);

-- Tabla: PlanFitnessDeUsuario
INSERT INTO PlanFitnessDeUsuario VALUES (999, 1, 'Excelente plan');
INSERT INTO PlanFitnessDeUsuario VALUES (1, 999, 'No me gustó');
INSERT INTO PlanFitnessDeUsuario VALUES (1, 1, 'Repetido');

-- ==========================================
--  XPOBLAR - ELIMINACION DE DATOS
-- ==========================================

DELETE FROM PlanFitnessDeUsuario;
DELETE FROM Recomendacion;
DELETE FROM Feedback_;
DELETE FROM Progreso;
DELETE FROM Objetivo;
DELETE FROM Rutina;
DELETE FROM Alimentacion;
DELETE FROM Habito;
DELETE FROM Usuario;
DELETE FROM Nutricionista;
DELETE FROM PlanFitness;
DELETE FROM Persona;

-- ==========================================
--  CONSULTAS - Consulta SQL Incluir identificador
-- ==========================================


-- Q1: Listar todos los usuarios activos con su nivel y meta
SELECT 
    p.id_persona,
    p.nombre,
    u.nivel,
    u.meta_
FROM Persona p
JOIN Usuario u 
    ON TO_CHAR(p.id_persona) = TO_CHAR(u.id_persona)
WHERE TRIM(TO_CHAR(u.membresia_activa)) IN ('1', 'S'); 


-- Q2: Consultar el progreso más reciente de cada usuario
SELECT p.id_persona, p.peso_actual, p.medidas, p.porcentaje_grasa, p.fecha_registro
FROM Progreso p
JOIN (
  SELECT id_persona, MAX(fecha_registro) AS max_fecha
  FROM Progreso
  GROUP BY id_persona
) m ON p.id_persona = m.id_persona AND p.fecha_registro = m.max_fecha;

-- Q3: Mostrar los nutricionistas con mayor cantidad de planes publicados
SELECT n.id_persona, p.nombre, n.planes_publicados
FROM Nutricionista n
JOIN Persona p ON n.id_persona = p.id_persona
ORDER BY n.planes_publicados DESC;

