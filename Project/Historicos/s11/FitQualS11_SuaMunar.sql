-- FitQual
-----------------------------
-- TABLAS: CREACIÓN DE TABLAS
-----------------------------

CREATE TABLE Personas (
    id_persona NUMBER(7) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    correo VARCHAR2(50) NOT NULL,
    contrasena VARCHAR2(50),
    rol VARCHAR2(20) NOT NULL
);

CREATE TABLE Nutricionistas (
    id_persona NUMBER(7) NOT NULL,
    especialidad VARCHAR2(70)NOT NULL,
    descripcion_perfil VARCHAR2(300) NOT NULL,
    trayectoria_profesional VARCHAR2(500) NOT NULL,
    consejos_publicados NUMBER NOT NULL,
    planes_publicados NUMBER NOT NULL
);

CREATE TABLE Usuarios (
    id_persona NUMBER(7) NOT NULL,
    meta_ VARCHAR2(50),
    nivel VARCHAR2(50) NOT NULL,
    frecuencia_entreno NUMBER(1),
    edad NUMBER(3) NOT NULL,
    sexo CHAR(1) NOT NULL,
    peso NUMBER(5,2) NOT NULL,
    altura NUMBER(5,3) NOT NULL,
    fecha_inicio_membresia DATE NOT NULL,
    membresia_activa CHAR(1) NOT NULL,
    fecha_fin_membresia DATE 
);

CREATE TABLE Feedbacks (
    id_feedback NUMBER(7) NOT NULL,
    usuario NUMBER(7) NOT NULL,
    contenido VARCHAR2(500),
    fecha DATE NOT NULL,
    calificacion NUMBER(1) NOT NULL,
    tipo_feedback VARCHAR2(50) NOT NULL,
    visibilidad VARCHAR2(50) NOT NULL
);

CREATE TABLE Recomendaciones (
    id_recomendacion NUMBER(7) NOT NULL,
    nutricionista NUMBER(7) NOT NULL,
    contenido VARCHAR2(1000)NOT NULL,
    fecha_creacion DATE NOT NULL,
    tipo_enfoque VARCHAR2(50) NOT NULL
);

CREATE TABLE Objetivos (
    id_objetivo NUMBER(10) NOT NULL,
    usuario NUMBER(7) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    contenido VARCHAR2(500) NOT NULL,    
    fecha_creacion DATE NOT NULL
);

CREATE TABLE Progresos (
    id_progreso NUMBER(10) NOT NULL,
    usuario NUMBER(7) NOT NULL,
    peso_actual NUMBER(5,2) NOT NULL,
    medidas VARCHAR2(100),
    porcentaje_grasa NUMBER(4,2),
    fecha_registro DATE NOT NULL
);

CREATE TABLE PlanesFitness (
    id_plan NUMBER(10) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    duracion VARCHAR2(50),
    descripcion VARCHAR2(200) NOT NULL
);

CREATE TABLE Rutinas (
    id_rutina NUMBER(10) NOT NULL,
    id_plan NUMBER(10) NOT NULL,
    nombre_rutina VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000) NOT NULL,
    dias_semana VARCHAR2(20),
    duracion_rutina NUMBER(3),
    nivel_dificultad VARCHAR2(50),
    tipo_entrenamiento VARCHAR2(50) 
);

CREATE TABLE Alimentaciones (
    id_alimentacion NUMBER(10) NOT NULL,
    id_plan NUMBER(10) NOT NULL,
    nombre_comida VARCHAR2(100) NOT NULL,
    calorias NUMBER(5),
    carbohidratos NUMBER(5),
    grasas NUMBER(5),
    proteinas NUMBER(5)
);

CREATE TABLE Habitos (
    id_habito NUMBER(10) NOT NULL,
    id_plan NUMBER(10) NOT NULL,
    nombre_habito VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(500) NOT NULL,
    frecuencia VARCHAR2(200)
);

CREATE TABLE PlanesFitnessDeUsuarios (
    id_usuario NUMBER(10) NOT NULL,
    id_planfitness NUMBER(10) NOT NULL,
    comentario_usuario VARCHAR2(700)
);

CREATE TABLE Ejercicios (
    id_ejercicio NUMBER(10) NOT NULL,
    nombre_ejercicio  VARCHAR2(100) NOT NULL,
    series NUMBER(2),
    repeticiones NUMBER(3),
    descripcion VARCHAR2(500),
    duracion_min NUMBER(4)
);

---------------------
-- ATRIBUTOS Y TIPOS
---------------------

ALTER TABLE Personas
MODIFY (rol VARCHAR2(20) CHECK (rol IN ('Usuario', 'Nutricionista')));

ALTER TABLE Usuarios
MODIFY (sexo CHAR(1) CHECK (sexo IN ('M','F')));

ALTER TABLE Usuarios
MODIFY (edad NUMBER(3) CHECK (edad > 0));

ALTER TABLE Usuarios
MODIFY (peso NUMBER(5,2) CHECK (peso > 0));

ALTER TABLE Usuarios
MODIFY (altura NUMBER(5,3) CHECK (altura > 0));

ALTER TABLE Usuarios
MODIFY (frecuencia_entreno NUMBER(1) CHECK (frecuencia_entreno BETWEEN 1 AND 7));

ALTER TABLE Usuarios
MODIFY (membresia_activa CHAR(1) CHECK (membresia_activa IN ('0','1')) NOT NULL);

ALTER TABLE Feedbacks
MODIFY (calificacion NUMBER(1) CHECK (calificacion BETWEEN 1 AND 5));

ALTER TABLE Feedbacks
MODIFY (tipo_feedback VARCHAR2(100) CHECK (tipo_feedback IN ('Nutricionista','Plan','Progreso','Sistema')));

ALTER TABLE Feedbacks
MODIFY (visibilidad VARCHAR2(50) CHECK (visibilidad IN ('Público','Privado')));

ALTER TABLE Progresos
MODIFY (peso_actual NUMBER(5,2) CHECK (peso_actual > 0));

ALTER TABLE Progresos
MODIFY (porcentaje_grasa NUMBER(4,2) CHECK (porcentaje_grasa BETWEEN 0 AND 100));

ALTER TABLE Progresos
MODIFY (fecha_registro DATE NOT NULL);

ALTER TABLE Rutinas
MODIFY (duracion_rutina NUMBER(3) CHECK (duracion_rutina > 0));

ALTER TABLE Rutinas
MODIFY (nivel_dificultad VARCHAR2(50) CHECK (nivel_dificultad IN ('Básico','Intermedio','Avanzado')) NOT NULL);

ALTER TABLE Alimentaciones
MODIFY (calorias NUMBER(5) CHECK (calorias >= 0));

ALTER TABLE Alimentaciones
MODIFY (carbohidratos NUMBER(5) CHECK (carbohidratos >= 0));

ALTER TABLE Alimentaciones
MODIFY (grasas NUMBER(5) CHECK (grasas >= 0));

ALTER TABLE Alimentaciones
MODIFY (proteinas NUMBER(5) CHECK (proteinas >= 0));

--------------------
-- CLAVES PRIMARIAS
--------------------

ALTER TABLE Personas ADD CONSTRAINT pk_persona PRIMARY KEY (id_persona);
ALTER TABLE Nutricionistas ADD CONSTRAINT pk_nutricionista PRIMARY KEY (id_persona);
ALTER TABLE Usuarios ADD CONSTRAINT pk_usuario PRIMARY KEY (id_persona);
ALTER TABLE Feedbacks ADD CONSTRAINT pk_feedback PRIMARY KEY (id_feedback);
ALTER TABLE Recomendaciones ADD CONSTRAINT pk_recomendacion PRIMARY KEY (id_recomendacion);
ALTER TABLE Objetivos ADD CONSTRAINT pk_objetivo PRIMARY KEY (id_objetivo);
ALTER TABLE Progresos ADD CONSTRAINT pk_progreso PRIMARY KEY (id_progreso);
ALTER TABLE PlanesFitness ADD CONSTRAINT pk_planfitness PRIMARY KEY (id_plan);
ALTER TABLE Rutinas ADD CONSTRAINT pk_rutina PRIMARY KEY (id_rutina);
ALTER TABLE Alimentaciones ADD CONSTRAINT pk_alimentacion PRIMARY KEY (id_alimentacion);
ALTER TABLE Habitos ADD CONSTRAINT pk_habito PRIMARY KEY (id_habito);
ALTER TABLE PlanesFitnessDeUsuarios ADD CONSTRAINT pk_planfitness_usuario PRIMARY KEY (id_usuario, id_planfitness);

----------------
-- CLAVES ÚNICAS 
----------------

ALTER TABLE Personas ADD CONSTRAINT uk_persona_correo UNIQUE (correo);

------------------
-- CLAVES FORÁNEAS
------------------

ALTER TABLE Usuarios ADD CONSTRAINT fk_usuario_persona FOREIGN KEY (id_persona)
REFERENCES Personas(id_persona);

ALTER TABLE Nutricionistas ADD CONSTRAINT fk_nutricionista_persona FOREIGN KEY (id_persona)
REFERENCES Personas(id_persona);

ALTER TABLE Recomendaciones ADD CONSTRAINT fk_recomendacion_nutricionista FOREIGN KEY (id_nutricionista)
REFERENCES Nutricionistas(id_persona);

ALTER TABLE Objetivos ADD CONSTRAINT fk_objetivo_usuario FOREIGN KEY (id_persona)
REFERENCES Usuarios(id_persona);

ALTER TABLE Progresos ADD CONSTRAINT fk_progreso_usuario FOREIGN KEY (id_persona)
REFERENCES Usuarios(id_persona);

ALTER TABLE PlanesFitnessDeUsuarios ADD CONSTRAINT fk_planf_usuario FOREIGN KEY (id_usuario)
REFERENCES Usuarios(id_persona);

ALTER TABLE PlanesFitnessDeUsuarios ADD CONSTRAINT fk_planf_planfitness FOREIGN KEY (id_planfitness)
REFERENCES PlanesFitness(id_plan);

ALTER TABLE Rutinas ADD CONSTRAINT fk_rutina_planfitness FOREIGN KEY (id_plan)
REFERENCES PlanesFitness(id_plan);

ALTER TABLE Alimentaciones ADD CONSTRAINT fk_alimentacion_planfitness FOREIGN KEY (id_plan)
REFERENCES PlanesFitness(id_plan);

ALTER TABLE Habitos ADD CONSTRAINT fk_habito_planfitness FOREIGN KEY (id_plan)
REFERENCES PlanesFitness(id_plan);

----------------------------------
-- XTablas: ELIMINACIÓN DE TABLAS
----------------------------------

DROP TABLE PlanesFitnessDeUsuarios CASCADE CONSTRAINTS;
DROP TABLE Habitos CASCADE CONSTRAINTS;
DROP TABLE Alimentaciones CASCADE CONSTRAINTS;
DROP TABLE Rutinas CASCADE CONSTRAINTS;
DROP TABLE PlanesFitness CASCADE CONSTRAINTS;
DROP TABLE Progresos CASCADE CONSTRAINTS;
DROP TABLE Objetivos CASCADE CONSTRAINTS;
DROP TABLE Recomendaciones CASCADE CONSTRAINTS;
DROP TABLE Feedbacks CASCADE CONSTRAINTS;
DROP TABLE Usuarios CASCADE CONSTRAINTS;
DROP TABLE Nutricionistas CASCADE CONSTRAINTS;
DROP TABLE Personas CASCADE CONSTRAINTS;
DROP TABLE Ejercicios CASCADE CONSTRAINTS;

----------------------------------
-- POBLAROK: INGRESO DE DATOS CORRECTOS
----------------------------------

--Tabla: Personas
INSERT INTO Personas VALUES (1, 'Carlos Pérez', 'carlosp@gmail.com', 'pass001', 'Nutricionista');
INSERT INTO Personas VALUES (2, 'Laura Gómez', 'laurag@gmail.com', 'pass002', 'Nutricionista');
INSERT INTO Personas VALUES (3, 'Juan Ruiz', 'juanr@gmail.com', 'pass003', 'Nutricionista');
INSERT INTO Personas VALUES (4, 'Marta Díaz', 'martad@gmail.com', 'pass004', 'Nutricionista');
INSERT INTO Personas VALUES (5, 'Pedro López', 'pedrol@gmail.com', 'pass005', 'Nutricionista');
INSERT INTO Personas VALUES (6, 'Daniel Torres', 'dtorres@gmail.com', 'pass006', 'Usuario');
INSERT INTO Personas VALUES (7, 'Ana Rojas', 'anar@gmail.com', 'pass007', 'Usuario');
INSERT INTO Personas VALUES (8, 'Luis Castro', 'lcastro@gmail.com', 'pass008', 'Usuario');
INSERT INTO Personas VALUES (9, 'Valentina Mora', 'vmora@gmail.com', 'pass009', 'Usuario');
INSERT INTO Personas VALUES (10, 'Camilo Suárez', 'csuarez@gmail.com', 'pass010', 'Usuario');
INSERT INTO Personas VALUES (11, 'Sofía Torres', 'storres@gmail.com', 'pass011', 'Usuario');
INSERT INTO Personas VALUES (12, 'Diego León', 'dleon@gmail.com', 'pass012', 'Usuario');

--Tabla: Nutricionistas
INSERT INTO Nutricionistas VALUES (1, 'Nutrición deportiva', 'Apasionado por el rendimiento físico.', '10 años asesorando atletas.', 45, 12);
INSERT INTO Nutricionistas VALUES (2, 'Nutrición clínica', 'Experta en control de peso.', 'Licenciada en nutrición UNAL.', 30, 8);
INSERT INTO Nutricionistas VALUES (3, 'Nutrición holística', 'Promueve la alimentación natural.', 'Diplomado en salud integral.', 25, 6);
INSERT INTO Nutricionistas VALUES (4, 'Dietas personalizadas', 'Crea planes según objetivos.', 'Ex entrenadora certificada.', 18, 10);
INSERT INTO Nutricionistas VALUES (5, 'Rehabilitación nutricional', 'Foco en recuperación muscular.', 'MSc en nutrición deportiva.', 28, 9);

--Tabla: Usuarios
INSERT INTO Usuarios VALUES (6, 'Aumentar masa muscular', 'Intermedio', 5, 22, 'M', 70.5, 1.73, DATE '2024-05-01', 1, DATE '2025-05-01');
INSERT INTO Usuarios VALUES (7, 'Perder grasa', 'Principiante', 4, 25, 'F', 62.0, 1.65, DATE '2024-06-15', 1, DATE '2025-06-15');
INSERT INTO Usuarios VALUES (8, 'Tonificar', 'Intermedio', 3, 28, 'M', 75.2, 1.80, DATE '2024-07-10', 1, DATE '2025-07-10');
INSERT INTO Usuarios VALUES (9, 'Mejorar resistencia', 'Avanzado', 6, 31, 'F', 58.4, 1.68, DATE '2024-08-01', 1, DATE '2025-08-01');
INSERT INTO Usuarios VALUES (10, 'Mantener peso', 'Intermedio', 5, 26, 'M', 68.1, 1.72, DATE '2024-05-25', 1, DATE '2025-05-25');
INSERT INTO Usuarios VALUES (11, 'Aumentar fuerza', 'Avanzado', 6, 24, 'F', 60.8, 1.69, DATE '2024-06-10', 1, DATE '2025-06-10');
INSERT INTO Usuarios VALUES (12, 'Reducir grasa corporal', 'Principiante', 3, 27, 'M', 83.4, 1.78, DATE '2024-07-05', 1, DATE '2025-07-05');


--Tabla: PlanesFitness
INSERT INTO PlanesFitness VALUES (1, 'Plan Fuerza Total', '8 semanas', 'Entrenamiento de cuerpo completo.');
INSERT INTO PlanesFitness VALUES (2, 'Plan Quema Grasa', '6 semanas', 'Alta intensidad y control calórico.');
INSERT INTO PlanesFitness VALUES (3, 'Plan Tonificación', '10 semanas', 'Mejora muscular y resistencia.');
INSERT INTO PlanesFitness VALUES (4, 'Plan Principiante', '4 semanas', 'Base técnica y acondicionamiento.');
INSERT INTO PlanesFitness VALUES (5, 'Plan Avanzado', '12 semanas', 'Máximo rendimiento y fuerza.');
INSERT INTO PlanesFitness VALUES (6, 'Plan Rehabilitación', '6 semanas', 'Enfoque en movilidad y control.');
INSERT INTO PlanesFitness VALUES (7, 'Plan Vegano', '8 semanas', 'Basado en proteínas vegetales.');
INSERT INTO PlanesFitness VALUES (8, 'Plan Crossfit', '10 semanas', 'Alta intensidad funcional.');
INSERT INTO PlanesFitness VALUES (9, 'Plan Balanceado', '6 semanas', 'Combinación de fuerza y cardio.');
INSERT INTO PlanesFitness VALUES (10, 'Plan Definición', '8 semanas', 'Baja grasa y mantenimiento muscular.');

--Tabla: Recomendaciones
INSERT INTO Recomendaciones VALUES (1, 1, 'Mantén una ingesta alta de proteínas.', DATE '2024-05-10', 'Nutrición');
INSERT INTO Recomendaciones VALUES (2, 2, 'Evita alimentos procesados.', DATE '2024-05-12', 'Salud');
INSERT INTO Recomendaciones VALUES (3, 3, 'Bebe 2L de agua al día.', DATE '2024-05-15', 'Hidratación');
INSERT INTO Recomendaciones VALUES (4, 4, 'Incluye grasas saludables.', DATE '2024-05-18', 'Nutrición');
INSERT INTO Recomendaciones VALUES (5, 5, 'Duerme al menos 7 horas.', DATE '2024-05-20', 'Descanso');
INSERT INTO Recomendaciones VALUES (6, 1, 'Evita el exceso de azúcar.', DATE '2024-05-22', 'Salud');
INSERT INTO Recomendaciones VALUES (7, 2, 'Consume frutas con moderación.', DATE '2024-05-25', 'Nutrición');
INSERT INTO Recomendaciones VALUES (8, 3, 'Varía tus fuentes de proteína.', DATE '2024-05-28', 'Rendimiento');
INSERT INTO Recomendaciones VALUES (9, 4, 'Reduce el estrés con ejercicios suaves.', DATE '2024-06-01', 'Bienestar');
INSERT INTO Recomendaciones VALUES (10, 5, 'No te saltes comidas.', DATE '2024-06-03', 'Metabolismo');

--Tabla: Objetivos
INSERT INTO Objetivos VALUES (11, 'Definición muscular', 'Reducir grasa al 12%.', 6, DATE '2024-09-01');
INSERT INTO Objetivos VALUES (12, 'Mantener peso', 'Estabilizar peso 68kg.', 7, DATE '2024-09-10');
INSERT INTO Objetivos VALUES (18, 'Aumentar flexibilidad', 'Mejorar rango de movimiento.', 8, DATE '2024-09-20');
INSERT INTO Objetivos VALUES (19, 'Recuperar movilidad', 'Volver al entrenamiento completo.', 9, DATE '2024-10-01');
INSERT INTO Objetivos VALUES (20, 'Incrementar cardio', 'Aumentar VO2 max.', 10, DATE '2024-10-10');


-- Tabla: Feedbacks

INSERT INTO Feedbacks VALUES (1, 'Excelente seguimiento del nutricionista.', DATE '2024-09-10', 5, 'Nutricionista', 'Público');
INSERT INTO Feedbacks VALUES (2, 'El plan fue exigente pero efectivo.', DATE '2024-09-15', 4, 'Plan', 'Público');
INSERT INTO Feedbacks VALUES (3, 'Buen progreso, aunque falta más control.', DATE '2024-09-20', 3, 'Progreso', 'Privado');
INSERT INTO Feedbacks VALUES (4, 'Excelente atención y acompañamiento.', DATE '2024-09-25', 5, 'Nutricionista', 'Público');
INSERT INTO Feedbacks VALUES (5, 'Sistema intuitivo y fácil de usar.', DATE '2024-09-28', 4, 'Sistema', 'Público');
INSERT INTO Feedbacks VALUES (6, 'Los resultados fueron notables.', DATE '2024-10-02', 5, 'Progreso', 'Público');
INSERT INTO Feedbacks VALUES (7, 'El plan fue claro y bien estructurado.', DATE '2024-10-05', 4, 'Plan', 'Privado');
INSERT INTO Feedbacks VALUES (8, 'Excelente comunicación con el nutricionista.', DATE '2024-10-08', 5, 'Nutricionista', 'Público');
INSERT INTO Feedbacks VALUES (9, 'El sistema presentó algunos errores.', DATE '2024-10-10', 3, 'Sistema', 'Privado');
INSERT INTO Feedbacks VALUES (10, 'Progreso constante y motivador.', DATE '2024-10-12', 5, 'Progreso', 'Público');


-- Tabla: Progresos

INSERT INTO Progresos VALUES (1, 6, 71.2, 'Pecho 95cm, Cintura 78cm', 14.5, DATE '2024-09-10');
INSERT INTO Progresos VALUES (2, 7, 60.8, 'Cintura 70cm, Cadera 95cm', 20.2, DATE '2024-09-15');
INSERT INTO Progresos VALUES (3, 8, 76.5, 'Brazos 33cm, Piernas 58cm', 18.0, DATE '2024-09-20');
INSERT INTO Progresos VALUES (4, 9, 57.9, 'Cintura 68cm, Espalda 90cm', 19.8, DATE '2024-09-25');
INSERT INTO Progresos VALUES (5, 10, 67.5, 'Pecho 90cm, Cintura 77cm', 16.3, DATE '2024-09-28');
INSERT INTO Progresos VALUES (6, 11, 61.5, 'Piernas 56cm, Cintura 72cm', 21.0, DATE '2024-10-02');
INSERT INTO Progresos VALUES (7, 12, 81.9, 'Cintura 84cm, Pecho 100cm', 22.5, DATE '2024-10-05');
-----
CREATE SEQUENCE Progresos_seq
START WITH 8
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Tabla: PlanesFitnessDeUsuarios

INSERT INTO PlanesFitnessDeUsuarios VALUES (6, 1, 'Excelente plan, aumenté mi fuerza rápidamente.');
INSERT INTO PlanesFitnessDeUsuarios VALUES (7, 2, 'Muy bueno, noté cambios en pocas semanas.');
INSERT INTO PlanesFitnessDeUsuarios VALUES (8, 3, 'Buen equilibrio entre cardio y tonificación.');
INSERT INTO PlanesFitnessDeUsuarios VALUES (9, 6, 'Ideal para recuperación después de lesión.');
INSERT INTO PlanesFitnessDeUsuarios VALUES (10, 4, 'Perfecto para retomar entrenamiento.');
INSERT INTO PlanesFitnessDeUsuarios VALUES (11, 5, 'Desafiante pero efectivo.');
INSERT INTO PlanesFitnessDeUsuarios VALUES (12, 9, 'Excelente balance general.');

-- Tabla: Rutinas

INSERT INTO Rutinas VALUES (1, 'Fuerza Base', 'Entrenamiento de cuerpo completo con foco en técnica.', 'Lunes,Miércoles,Viernes', 60, 'Intermedio', 'Fuerza', 1);
INSERT INTO Rutinas VALUES (2, 'Cardio HIIT', 'Alta intensidad con descansos cortos.', 'Martes,Jueves', 40, 'Intermedio', 'Cardio', 2);
INSERT INTO Rutinas VALUES (3, 'Tonificación General', 'Rutinas con pesas ligeras y repeticiones altas.', 'Lunes,Viernes', 50, 'Básico', 'Resistencia', 3);
INSERT INTO Rutinas VALUES (4, 'Movilidad Articular', 'Ejercicios para mejorar rango de movimiento.', 'Miércoles,Viernes', 45, 'Básico', 'Rehabilitación', 6);
INSERT INTO Rutinas VALUES (5, 'Crossfit Intenso', 'Entrenamiento funcional de alta exigencia.', 'Lunes,Miércoles,Viernes', 55, 'Avanzado', 'Funcional', 8);
INSERT INTO Rutinas VALUES (6, 'Definición Muscular', 'Rutina dividida por grupos musculares.', 'Lunes a Sábado', 70, 'Avanzado', 'Hipertrofia', 10);


-- Tabla: Alimentaciones

INSERT INTO Alimentaciones VALUES (1, 'Desayuno Proteico', 450, 40, 15, 35, 1);
INSERT INTO Alimentaciones VALUES (2, 'Almuerzo Balanceado', 600, 50, 20, 40, 1);
INSERT INTO Alimentaciones VALUES (3, 'Cena Ligera', 400, 35, 10, 30, 2);
INSERT INTO Alimentaciones VALUES (4, 'Snack Saludable', 200, 20, 5, 10, 3);
INSERT INTO Alimentaciones VALUES (5, 'Batido Vegano', 250, 30, 5, 20, 7);
INSERT INTO Alimentaciones VALUES (6, 'Refección Rehabilitante', 500, 45, 15, 35, 6);
INSERT INTO Alimentaciones VALUES (7, 'Comida Crossfit', 700, 60, 25, 45, 8);
INSERT INTO Alimentaciones VALUES (8, 'Dieta Definición', 550, 40, 15, 45, 10);


-- Tabla: Habitos

INSERT INTO Habitos VALUES (1, 'Dormir bien', 'Dormir mínimo 7 horas diarias.', 'Diario', 1);
INSERT INTO Habitos VALUES (2, 'Hidratación', 'Beber al menos 2L de agua.', 'Diario', 2);
INSERT INTO Habitos VALUES (3, 'Estiramientos', 'Realizar 10 minutos de estiramiento después del entrenamiento.', 'Diario', 3);
INSERT INTO Habitos VALUES (4, 'Control del Estrés', 'Practicar respiración consciente 5 minutos.', 'Diario', 6);
INSERT INTO Habitos VALUES (5, 'Evitar alcohol', 'Limitar el consumo a eventos sociales.', 'Semanal', 9);
INSERT INTO Habitos VALUES (6, 'Consumo de frutas', 'Incluir 3 porciones de frutas al día.', 'Diario', 7);
INSERT INTO Habitos VALUES (7, 'Planificación de comidas', 'Organizar los menús semanales.', 'Semanal', 10);

-- ==========================================
--  POBLARNOOK - INGRESO DE DATOS INCORRECTOS
-- ==========================================

-- Tabla: Personas
INSERT INTO Personas VALUES (1, 'Ana López', 'ana@example.com', 'pass123', 'Usuario');
INSERT INTO Personas VALUES (1, 'Carlos Ruiz', 'carlos@example.com', 'pass456', 'Usuario');
INSERT INTO Personas VALUES (2, 'Luis Gómez', 'ana@example.com', 'pass789', 'Usuario');
INSERT INTO Personas VALUES (3, NULL, 'maria@example.com', 'clave123', 'Usuario');
INSERT INTO Personas VALUES (4, 'Pedro', 'pedro@example.com', 'clave999', 'Entrenador');

-- Tabla: Nutricionistas
INSERT INTO Nutricionistas VALUES (999, 'Deportiva', 'Perfil', 'Trayectoria', 5, 3);
INSERT INTO Nutricionistas VALUES (1, 'Funcional', 'Texto', 'Experiencia', 'cinco', 2);

-- Tabla: Usuarios
INSERT INTO Usuarios VALUES (888, 'Perder peso', 'Básico', 8, 25, 'M', 70.5, 1.75, SYSDATE, 1, SYSDATE);
INSERT INTO Usuarios VALUES (2, 'Tonificar', 'Avanzado', 5, -3, 'M', 65.2, 1.80, SYSDATE, 1, SYSDATE);
INSERT INTO Usuarios VALUES (3, 'Fuerza', 'Intermedio', 4, 22, 'X', 70.0, 1.80, SYSDATE, 1, SYSDATE);
INSERT INTO Usuarios VALUES (999, 'Resistencia', 'Básico', 3, 30, 'F', 0, 1.70, SYSDATE, 1, SYSDATE);
INSERT INTO Usuarios VALUES (50, 'Ganar masa', 'Avanzado', 5, 28, 'M', 80, 1.80, NULL, 1, SYSDATE);

-- Tabla: Feedbacks
INSERT INTO Feedbacks VALUES (1, 'Buen servicio', SYSDATE, 6, 'Plan', 'Público');
INSERT INTO Feedbacks VALUES (2, 'Regular', SYSDATE, 3, 'Cliente', 'Público');
INSERT INTO Feedbacks VALUES (3, NULL, SYSDATE, 4, 'Plan', 'Privado');
INSERT INTO Feedbacks VALUES (4, 'Excelente', 'fecha', 5, 'Plan', 'Privado');

-- Tabla: Recomendaciones
INSERT INTO Recomendaciones VALUES (1, 999, 'Comer más proteína', SYSDATE, 'Nutricional');
INSERT INTO Recomendaciones VALUES (2, 1, 'Dormir mejor', SYSDATE, '');
INSERT INTO Recomendaciones VALUES (3, 1, 'Hidratación', 'fecha', 'Salud');

-- Tabla: Objetivos
INSERT INTO Objetivos VALUES (1, 'Definición muscular', 'Bajar grasa corporal', 999, SYSDATE);
INSERT INTO Objetivos VALUES (1, 'Fuerza', 'Aumentar fuerza', 2, SYSDATE);
INSERT INTO Objetivos VALUES (3, NULL, 'Contenido', 2, SYSDATE);

-- Tabla: Progresos
INSERT INTO Progresos VALUES (1, 999, 70.0, '90-80-95', 20.0, SYSDATE);
INSERT INTO Progresos VALUES (2, 2, -5.0, '90-80-95', 20.0, SYSDATE);
INSERT INTO Progresos VALUES (3, 2, 70.0, '90-80-95', 150.0, SYSDATE);
INSERT INTO Progresos VALUES (4, 2, 70.0, '90-80-95', 20.0, NULL);

-- Tabla: PlanesFitness
INSERT INTO PlanesFitness VALUES (1, 'Plan Básico', '3 meses', 'Entrenamiento');
INSERT INTO PlanesFitness VALUES (1, 'Plan Avanzado', '2 meses', 'Fuerza');
INSERT INTO PlanesFitness VALUES (2, NULL, '1 mes', 'Fuerza');
INSERT INTO PlanesFitness VALUES (3, 'Plan', 3, 'Texto');

-- Tabla: Rutinas
INSERT INTO Rutinas VALUES (1, 'Rutina A', 'Descripción', 'L-M', 60, 'Experto', 'Fuerza', 999);
INSERT INTO Rutinas VALUES (2, 'Rutina B', 'Desc', 'L-M', -30, 'Básico', 'Cardio', 1);
INSERT INTO Rutinas VALUES (3, NULL, 'Desc', 'L-M', 60, 'Básico', 'Fuerza', 1);

-- Tabla: Alimentaciones
INSERT INTO Alimentaciones VALUES (1, 'Desayuno', -100, 40, 10, 20, 1);
INSERT INTO Alimentaciones VALUES (2, 'Cena', 500, 60, 15, 30, 999);
INSERT INTO Alimentaciones VALUES (3, NULL, 300, 40, 10, 20, 1);

-- Tabla: Habitos
INSERT INTO Habitos VALUES (1, NULL, 'Dormir 8 horas', 'Diario', 1);
INSERT INTO Habitos VALUES (2, 'Leer', NULL, 'Semanal', 999);
INSERT INTO Habitos VALUES (3, 'Hidratarse', 'Beber agua', NULL, 1);

-- Tabla: PlanesFitnessDeUsuarios
INSERT INTO PlanesFitnessDeUsuarios VALUES (999, 1, 'Excelente plan');
INSERT INTO PlanesFitnessDeUsuarios VALUES (1, 999, 'No me gustó');
INSERT INTO PlanesFitnessDeUsuarios VALUES (1, 1, 'Repetido');

-- ==========================================
--  XPOBLAR - ELIMINACION DE DATOS
-- ==========================================

DELETE FROM PlanesFitnessDeUsuarios;
DELETE FROM Recomendaciones;
DELETE FROM Feedbacks;
DELETE FROM Progresos;
DELETE FROM Objetivos;
DELETE FROM Rutinas;
DELETE FROM Alimentacions;
DELETE FROM Habitos;
DELETE FROM Usuarios;
DELETE FROM Nutricionistas;
DELETE FROM PlanesFitness;
DELETE FROM Personas;
DELETE FROM Ejercicios;

-- ==========================================
--  CONSULTAS - Consulta SQL Incluir identificador
-- ==========================================


-- Q1: Listar todos los usuarios activos con su nivel y meta
SELECT 
    p.id_persona,
    p.nombre,
    u.nivel,
    u.meta_
FROM Personas p
JOIN Usuarios u 
    ON TO_CHAR(p.id_persona) = TO_CHAR(u.id_persona)
WHERE TRIM(TO_CHAR(u.membresia_activa)) IN ('1', 'S'); 


-- Q2: Consultar el progreso más reciente de cada usuario
SELECT p.id_persona, p.peso_actual, p.medidas, p.porcentaje_grasa, p.fecha_registro
FROM Progresos p
JOIN (
  SELECT id_persona, MAX(fecha_registro) AS max_fecha
  FROM Progresos
  GROUP BY id_persona
) m ON p.id_persona = m.id_persona AND p.fecha_registro = m.max_fecha;

-- Q3: Mostrar los nutricionistas con mayor cantidad de planes publicados
SELECT n.id_persona, p.nombre, n.planes_publicados
FROM Nutricionistas n
JOIN Personas p ON n.id_persona = p.id_persona
ORDER BY n.planes_publicados DESC;

