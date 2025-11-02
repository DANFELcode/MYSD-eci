--DECLARATIVAS
------------------------------------------------------------
-- TUPLAS
------------------------------------------------------------

-- Usuarios: coherencia entre fechas, peso y altura
ALTER TABLE Usuarios
ADD CONSTRAINT ck_usuario_membresia CHECK (
    (membresia_activa = 1 AND fecha_fin_membresia > fecha_inicio_membresia)
    OR (membresia_activa = 0)
);

ALTER TABLE Usuarios
ADD CONSTRAINT ck_usuario_peso_altura CHECK (
    peso BETWEEN 30 AND 250 AND altura BETWEEN 1.3 AND 2.5
);

-- Progresos: peso y grasa corporal coherentes
ALTER TABLE Progresos
ADD CONSTRAINT ck_progreso_valores CHECK (
    peso_actual BETWEEN 30 AND 250 AND porcentaje_grasa BETWEEN 3 AND 45
);

-- PlanesFitnessDeUsuarios: comentario no vacío
ALTER TABLE PlanesFitnessDeUsuarios
ADD CONSTRAINT ck_planusuario_comentario CHECK (
    comentario_usuario IS NOT NULL AND LENGTH(TRIM(comentario_usuario)) > 0
);


-----------------------------
-- TUPLASOK 
-----------------------------

-- Persona válida
INSERT INTO Personas VALUES (13, 'Juan Pérez', 'juanp@gmail.com', 'pass013', 'Usuario');

-- Usuario válido (fechas coherentes, peso y altura razonables)
INSERT INTO Usuarios VALUES (14, 'Aumentar masa muscular', 'Principiante', 4, 22, 'M', 70.5, 1.73, DATE '2025-01-01', 1, DATE '2026-01-01');

-- Progreso válido (peso y grasa corporal normales)
INSERT INTO Progresos VALUES (12, 17, 71.2, 'Pecho 95cm, Cintura 80cm', 18.5, DATE '2024-09-11');

-- PlanFitnessDeUsuario válido (comentario no vacío)
INSERT INTO PlanesFitnessDeUsuarios VALUES (6, 2, 'Excelente plan, aumenté mi fuerza rápidamente.');

COMMIT;

-----------------------------
-- TUPLASNoOK 
-----------------------------

-- Peso fuera de rango
INSERT INTO Usuarios VALUES (15, 'Aumentar masa muscular', 'Avanzado', 5, 25, 'M', 500, 1.7, DATE '2025-01-01', 1, DATE '2026-01-01');

-- Fecha fin menor a inicio
INSERT INTO Usuarios VALUES (16, 'Tonificar', 'Intermedio', 3, 28, 'M', 75.2, 1.80, DATE '2026-04-12', 1, DATE '2025-07-10');

-- Porcentaje de grasa imposible
INSERT INTO Progresos VALUES (13, 18, 99.3, 'Pecho 100cm, Cintura 87cm', 60.1, DATE '2025-09-11');

-- Comentario vacío
INSERT INTO PlanesFitnessDeUsuarios VALUES (14, 2, '');


------------------------------------------------------------
--ACCIONES DE REFERENCIA 
------------------------------------------------------------

ALTER TABLE Usuarios
ADD CONSTRAINT fk_usuario_persona
FOREIGN KEY (id_persona)
REFERENCES Personas(id_persona)
ON DELETE CASCADE;

ALTER TABLE Nutricionistas
ADD CONSTRAINT fk_nutricionista_persona
FOREIGN KEY (id_persona)
REFERENCES Personas(id_persona)
ON DELETE CASCADE;

ALTER TABLE Progresos
ADD CONSTRAINT fk_progreso_usuario
FOREIGN KEY (id_persona)
REFERENCES Usuarios(id_persona)
ON DELETE CASCADE;

ALTER TABLE Objetivos
ADD CONSTRAINT fk_objetivo_usuario
FOREIGN KEY (id_persona)
REFERENCES Usuarios(id_persona)
ON DELETE CASCADE;

ALTER TABLE PlanesFitnessDeUsuarios
ADD CONSTRAINT fk_planusuario_usuario
FOREIGN KEY (id_usuario)
REFERENCES Usuarios(id_persona)
ON DELETE CASCADE;

ALTER TABLE PlanesFitnessDeUsuarios
ADD CONSTRAINT fk_planusuario_plan
FOREIGN KEY (id_planfitness)
REFERENCES PlanesFitness(id_plan)
ON DELETE CASCADE;

ALTER TABLE Rutinas
ADD CONSTRAINT fk_rutina_plan
FOREIGN KEY (id_plan)
REFERENCES PlanesFitness(id_plan)
ON DELETE CASCADE;

ALTER TABLE Alimentaciones
ADD CONSTRAINT fk_alimentacion_plan
FOREIGN KEY (id_plan)
REFERENCES PlanesFitness(id_plan)
ON DELETE CASCADE;

ALTER TABLE Habitos
ADD CONSTRAINT fk_habito_plan
FOREIGN KEY (id_plan)
REFERENCES PlanesFitness(id_plan)
ON DELETE CASCADE;


-----------------------------
-- ACCIONESOK 
-----------------------------

-- Usuario con dependencias
INSERT INTO Personas VALUES (17, 'Laura Gómez', 'laura@gmail.com', '3015559999', 'Usuario');
INSERT INTO Usuarios VALUES (17, 'Mantener peso', 'Avanzado', 5, 26, 'M', 68.1, 1.72, DATE '2026-05-25', 1, DATE '2026-07-25');
INSERT INTO Progresos VALUES (17, 17, 67.5, 'Pecho 90cm, Cintura 77cm', 16.3, DATE '2025-09-28');
INSERT INTO Objetivos VALUES (14, 17,'Definición muscular', 'Reducir grasa al 12%.', DATE '2024-09-01');

-- Prueba de borrado en cascada
DELETE FROM Usuarios WHERE id_persona = 17;

-- PlanFitness con dependencias
INSERT INTO PlanesFitness VALUES (100, 'Plan de fuerza', '3 días a la semana', 'Entrenamiento enfocado en aumentar la fuerza considerablemente');
INSERT INTO Rutinas VALUES (5, 100, 'Crossfit Intenso', 'Entrenamiento funcional de alta exigencia.', 3, 55, 'Avanzado', 'Funcional');
INSERT INTO Alimentaciones VALUES (17, 100,'Cena Ligera', 400, 35, 10, 30);

-- Prueba de borrado en cascada en PlanFitness
DELETE FROM PlanesFitness WHERE id_plan = 100;

COMMIT;

-----------------------------
--Disparadores
-----------------------------
--Disparador que se se asegura de validar la membresía antes de insertar o actualizar un usuario y actualizar el estado de la membresía si es necesario.
CREATE OR REPLACE TRIGGER trg_validar_membresia
BEFORE INSERT OR UPDATE ON Usuarios
FOR EACH ROW
BEGIN
    IF :NEW.fecha_fin_membresia IS NOT NULL AND :NEW.fecha_fin_membresia < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: La membresía ya está vencida, no se puede insertar.');
    END IF;
    
    IF :NEW.fecha_fin_membresia IS NOT NULL AND :NEW.fecha_fin_membresia >= SYSDATE THEN
        :NEW.membresia_activa := '1';
    ELSE
        :NEW.membresia_activa := '0';
    END IF;
END;

--Disparador que inserta un registro inicial en la tabla Progresos cuando se crea un nuevo usuario, teniendo como base su peso inicial y las inserciones correspondientes.
CREATE OR REPLACE TRIGGER trg_insertar_progreso_inicial
AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    -- Validación: peso debe ser positivo
    IF :NEW.peso <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: el peso del usuario debe ser mayor a 0.');
    END IF;

    -- Inserción del progreso inicial
    INSERT INTO Progresos (
        id_progreso,
        usuario,
        peso_actual,
        medidas,
        porcentaje_grasa,
        fecha_registro
    ) VALUES (
        Progresos_seq.NEXTVAL,       
        :NEW.id_persona,
        :NEW.peso,
        'Inicial',                   
        NULL,                        
        SYSDATE                       
    );
END;
-----------------------------
--DisparadoresOK
-----------------------------
INSERT INTO Usuarios 
(id_persona, meta_, nivel, frecuencia_entreno, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES
(13, 'Ganar fuerza', 'Intermedio', 4, 23, 'M', 72.5, 1.75, DATE '2024-11-01', 1, DATE '2025-11-01');


INSERT INTO Usuarios 
(id_persona, meta_, nivel, frecuencia_entreno, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES
(14, 'Perder grasa', 'Principiante', 3, 28, 'F', 65.0, 1.68, DATE '2025-11-01', 1, DATE '2025-12-01');

-----------------------------
--DisparadoresNoOK
-----------------------------
INSERT INTO Usuarios 
(id_persona, meta_, nivel, frecuencia_entreno, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES
(15, 'Mantener peso', 'Avanzado', 5, 30, 'M', 70.0, 1.70, DATE '2020-01-01', 0, DATE '2021-01-01');


INSERT INTO Usuarios 
(id_persona, meta_, nivel, frecuencia_entreno, edad, sexo, peso, altura, fecha_inicio_membresia, membresia_activa, fecha_fin_membresia)
VALUES
(16, 'Tonificación', 'Intermedio', 4, 26, 'F', 0, 1.65, DATE '2025-11-01', 1, DATE '2026-01-01');

--------------------------
--XDisparadores
--------------------------
DROP TRIGGER trg_actualizar_membresia;
DROP TRIGGER trg_insertar_progreso_inicial;
