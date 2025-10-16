------------------------------------------------------------
-- 1. CREACIÓN Y ELIMINACIÓN DE TABLAS
------------------------------------------------------------
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Level CASCADE CONSTRAINTS;

CREATE TABLE Level (
    level_code NUMBER(11),
    manager CHAR(1),
    operator CHAR(1),
    engineer CHAR(1)
);

CREATE TABLE Staff (
    staff_code VARCHAR2(6),
    first_name VARCHAR2(50),
    last_name VARCHAR2(50)
);

------------------------------------------------------------
-- 2. DEFINICIÓN DE RESTRICCIONES DECLARATIVAS
------------------------------------------------------------

------------------------------------------------------------
-- RESTRICCIONES DE ATRIBUTO
-- (valores válidos, obligatoriedad y tipos)
------------------------------------------------------------
ALTER TABLE Level
ADD CONSTRAINT pk_level PRIMARY KEY (level_code);

ALTER TABLE Level
ADD CONSTRAINT chk_manager CHECK (manager IN ('Y', NULL));

ALTER TABLE Level
ADD CONSTRAINT chk_operator CHECK (operator IN ('Y', NULL));

ALTER TABLE Level
ADD CONSTRAINT chk_engineer CHECK (engineer IN ('Y', NULL));

ALTER TABLE Staff
ADD CONSTRAINT pk_staff PRIMARY KEY (staff_code);

ALTER TABLE Staff
MODIFY (first_name NOT NULL);

ALTER TABLE Staff
MODIFY (last_name NOT NULL);

------------------------------------------------------------
-- RESTRICCIONES DE TUPLA
-- (reglas que implican más de un atributo)
------------------------------------------------------------
ALTER TABLE Level
ADD CONSTRAINT chk_unica_funcion
CHECK (
    (CASE WHEN manager = 'Y' THEN 1 ELSE 0 END) +
    (CASE WHEN operator = 'Y' THEN 1 ELSE 0 END) +
    (CASE WHEN engineer = 'Y' THEN 1 ELSE 0 END)
    <= 1
);

------------------------------------------------------------
-- 3. VALIDACIÓN DE LA PROTECCIÓN DE LA BASE DE DATOS
-- (casos significativos con comentarios)
------------------------------------------------------------

-- ==========================================================
-- INGRESO DE DATOS CORRECTOS CON RESPECTO A LAS RESTRICCIONES DE ATRIBUTOS
-- ==========================================================
INSERT INTO Level VALUES (1, 'Y', NULL, NULL); 
-- Correcto: 'Y' permitido para manager, los demás NULL

INSERT INTO Staff VALUES ('A001', 'Carlos', 'Gomez'); 
-- Correcto: todos los campos cumplen tipo y no son NULL

-- ==========================================================
-- INTENTO DE INGRESO DE DATOS INCORRECTOS CON RESPECTO A LAS RESTRICCIONES DE ATRIBUTOS
-- ==========================================================
INSERT INTO Level VALUES (2, 'Z', NULL, NULL); 
-- Incorrecto: 'Z' no permitido, solo 'Y' o NULL

INSERT INTO Staff VALUES ('A002', NULL, 'Lopez'); 
-- Incorrecto: first_name no puede ser NULL

-- ==========================================================
-- INGRESO DE DATOS CORRECTOS CON RESPECTO A LAS RESTRICCIONES DE TUPLAS
-- ==========================================================
INSERT INTO Level VALUES (3, NULL, 'Y', NULL); 
-- Correcto: solo una función con 'Y'

INSERT INTO Level VALUES (4, NULL, NULL, 'Y'); 
-- Correcto: solo engineer tiene 'Y', válido

-- ==========================================================
-- INTENTO DE INGRESO DE DATOS INCORRECTOS CON RESPECTO A LAS RESTRICCIONES DE TUPLAS
-- ==========================================================
INSERT INTO Level VALUES (5, 'Y', 'Y', NULL); 
-- Incorrecto: dos funciones con 'Y' en la misma tupla

INSERT INTO Level VALUES (6, 'Y', NULL, 'Y'); 
-- Incorrecto: más de una función marcada con 'Y'

------------------------------------------------------------
-- VISUALIZAR DATOS VÁLIDOS
------------------------------------------------------------
SELECT * FROM Level;
SELECT * FROM Staff;

-- Parte B. Adicionando acciones de referencia

-- 1. Eliminar la llave foránea existente. (Acciones)
ALTER TABLE Staff DROP CONSTRAINT fk_staff_level;

-- 2. Crear nuevamente la llave foránea con la acción de referencia requerida
ALTER TABLE Staff
ADD CONSTRAINT fk_staff_level
FOREIGN KEY (level_code)
REFERENCES Level(level_code)
ON DELETE SET NULL;

-- 3. Validación de las acciones de referencia. (AccionesOK)

-- Inserción de datos correctos
INSERT INTO Level VALUES (1, 'Y', NULL, NULL);
INSERT INTO Level VALUES (2, NULL, 'Y', NULL);
INSERT INTO Staff VALUES ('S001', 'Ana', 'Rojas', 1);
INSERT INTO Staff VALUES ('S002', 'Carlos', 'Gomez', 2);

-- Intento de ingreso incorrecto (nivel inexistente)
INSERT INTO Staff VALUES ('S003', 'Pedro', 'Lopez', 10);

-- Verificación de la acción ON DELETE SET NULL
DELETE FROM Level WHERE level_code = 1;
SELECT * FROM Staff;

-- 4. Cambio de política de referencia
ALTER TABLE Staff DROP CONSTRAINT fk_staff_level;

ALTER TABLE Staff
ADD CONSTRAINT fk_staff_level
FOREIGN KEY (level_code)
REFERENCES Level(level_code)
ON DELETE CASCADE;

-- Verificación de la acción ON DELETE CASCADE
DELETE FROM Level WHERE level_code = 2;
SELECT * FROM Staff;

--Parte C. Adicionando disparadores

--1. Escribir las instrucciones necesarias para crear y eliminar los disparadores definidos. ( Disparadores – XDisparadores )
--Disparador 1: impedir insertar un Staff sin Level asignado (si existe al menos un Level)
CREATE OR REPLACE TRIGGER trg_staff_level_check
BEFORE INSERT ON Staff
FOR EACH ROW
WHEN (NEW.level_code IS NULL)
BEGIN
    DECLARE
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Level;
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'No se puede insertar un Staff sin nivel mientras existan niveles definidos.');
        END IF;
    END;
END;


-- Disparador 2: impedir modificar el level_code de un empleado
CREATE OR REPLACE TRIGGER trg_no_update_level
BEFORE UPDATE OF level_code ON Staff
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'No está permitido cambiar el nivel asignado a un Staff.');
END;

-- Eliminación de los disparadores
DROP TRIGGER trg_staff_level_check;
DROP TRIGGER trg_no_update_level;


--2. Escribir 3 instrucciones que permitan probar la actualización de la base de datos haciendo uso de los disparadores. ( DisparadoresOK )
-- 1. Insertar un nivel válido
INSERT INTO Level VALUES (40, 'Y', NULL, NULL);

-- 2. Insertar un Staff con ese nivel (válido)
INSERT INTO Staff VALUES ('S020', 'Clara', 'Diaz', 40);

-- 3. Eliminar ese Staff para activar el trigger de auditoría
DELETE FROM Staff WHERE staff_code = 'S020';


--3. Escribir 3 instrucciones para probar los disparadores protegen la base de datos impidiendo cambios no permitidos. (DisparadoresNoOK
-- 1. Intentar insertar Staff sin level_code cuando existen niveles
INSERT INTO Staff VALUES ('S021', 'Rosa', 'Perez', NULL);

-- 2. Insertar un Staff correcto para probar actualización prohibida
INSERT INTO Staff VALUES ('S022', 'Tomas', 'Rincon', 40);
UPDATE Staff SET level_code = 50 WHERE staff_code = 'S022';

-- 3. Verificar que no se haya modificado nada
SELECT * FROM Staff;