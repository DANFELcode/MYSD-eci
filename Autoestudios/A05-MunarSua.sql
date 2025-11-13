------------------------------------------------------------
-- 1. CREACIÓN Y ELIMINACIÓN DE TABLAS
------------------------------------------------------------
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Level_ CASCADE CONSTRAINTS;

CREATE TABLE Level_ (
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

ALTER TABLE Level_
ADD CONSTRAINT pk_level PRIMARY KEY (level_code);

ALTER TABLE Level_
ADD CONSTRAINT chk_manager CHECK (manager IN ('Y', NULL));

ALTER TABLE Level_
ADD CONSTRAINT chk_operator CHECK (operator IN ('Y', NULL));

ALTER TABLE Level_
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
ALTER TABLE Level_
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
INSERT INTO Level_ VALUES (1, 'Y', NULL, NULL); 
-- Correcto: 'Y' permitido para manager, los demás NULL

INSERT INTO Staff VALUES ('A001', 'Carlos', 'Gomez'); 
-- Correcto: todos los campos cumplen tipo y no son NULL

-- ==========================================================
-- INTENTO DE INGRESO DE DATOS INCORRECTOS CON RESPECTO A LAS RESTRICCIONES DE ATRIBUTOS
-- ==========================================================
INSERT INTO Level_ VALUES (2, 'Z', NULL, NULL); 
-- Incorrecto: 'Z' no permitido, solo 'Y' o NULL

INSERT INTO Staff VALUES ('A002', NULL, 'Lopez'); 
-- Incorrecto: first_name no puede ser NULL

-- ==========================================================
-- INGRESO DE DATOS CORRECTOS CON RESPECTO A LAS RESTRICCIONES DE TUPLAS
-- ==========================================================
INSERT INTO Level_ VALUES (3, NULL, 'Y', NULL); 
-- Correcto: solo una función con 'Y'

INSERT INTO Level_ VALUES (4, NULL, NULL, 'Y'); 
-- Correcto: solo engineer tiene 'Y', válido

-- ==========================================================
-- INTENTO DE INGRESO DE DATOS INCORRECTOS CON RESPECTO A LAS RESTRICCIONES DE TUPLAS
-- ==========================================================
INSERT INTO Level_ VALUES (5, 'Y', 'Y', NULL); 
-- Incorrecto: dos funciones con 'Y' en la misma tupla

INSERT INTO Level_ VALUES (6, 'Y', NULL, 'Y'); 
-- Incorrecto: más de una función marcada con 'Y'

------------------------------------------------------------
-- VISUALIZAR DATOS VÁLIDOS
------------------------------------------------------------
SELECT * FROM Level_;
SELECT * FROM Staff;

-- Parte B. Adicionando acciones de referencia

-- 1. Eliminar la llave foránea existente. (Acciones)
ALTER TABLE Staff DROP CONSTRAINT fk_staff_level;

-- 2. Crear nuevamente la llave foránea con la acción de referencia requerida
ALTER TABLE Staff
ADD CONSTRAINT fk_staff_level
FOREIGN KEY (level_code)
REFERENCES Level_(level_code)
ON DELETE SET NULL;

-- 3. Validación de las acciones de referencia. (AccionesOK)

-- Inserción de datos correctos
INSERT INTO Level_ VALUES (1, 'Y', NULL, NULL);
INSERT INTO Level_ VALUES (2, NULL, 'Y', NULL);
INSERT INTO Staff VALUES ('S001', 'Ana', 'Rojas', 1);
INSERT INTO Staff VALUES ('S002', 'Carlos', 'Gomez', 2);

-- Intento de ingreso incorrecto (nivel inexistente)
INSERT INTO Staff VALUES ('S003', 'Pedro', 'Lopez', 10);

-- Verificación de la acción ON DELETE SET NULL
DELETE FROM Level_ WHERE level_code = 1;
SELECT * FROM Staff;

-- 4. Cambio de política de referencia
ALTER TABLE Staff DROP CONSTRAINT fk_staff_level;

ALTER TABLE Staff
ADD CONSTRAINT fk_staff_level
FOREIGN KEY (level_code)
REFERENCES Level_(level_code)
ON DELETE CASCADE;

-- Verificación de la acción ON DELETE CASCADE
DELETE FROM Level_ WHERE level_code = 2;
SELECT * FROM Staff;

--Parte C. Adicionando disparadores

--1. Escribir las instrucciones necesarias para crear y eliminar los disparadores definidos. ( Disparadores – XDisparadores )
--Disparador 1: impedir insertar un Staff sin Level_ asignado (si existe al menos un Level_)
CREATE OR REPLACE TRIGGER trg_staff_level_check
BEFORE INSERT ON Staff
FOR EACH ROW
WHEN (NEW.level_code IS NULL)
BEGIN
    DECLARE
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM Level_;
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
INSERT INTO Level_ VALUES (40, 'Y', NULL, NULL);

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



CREATE OR REPLACE PACKAGE PC_STAFF AS
    -- Crea un empleado y retorna su código
    FUNCTION add(
        first_name  VARCHAR,
        last_name   VARCHAR,
        level_       NUMBER
    ) RETURN VARCHAR;

    -- Actualiza el nivel de un empleado
    PROCEDURE update_ (
        staff_code  NUMBER,
        new_level   NUMBER
    );

    -- Inserta un nuevo nivel
    PROCEDURE addLevel(
        level_code  NUMBER,
        manager     CHAR,
        operator    CHAR,
        engineer    CHAR
    );

    -- Consulta de un empleado por código
    FUNCTION co(
        staff_code VARCHAR
    ) RETURN SYS_REFCURSOR;

    -- Elimina un empleado por código
    PROCEDURE DELETE_(
        staff_code VARCHAR
    );

    -- Primera consulta operativa
    FUNCTION coByFunction RETURN SYS_REFCURSOR;

    -- Segunda consulta operativa
    FUNCTION coByLevel(
        level_code NUMBER
    ) RETURN SYS_REFCURSOR;
END PC_STAFF;
/


CREATE OR REPLACE PACKAGE BODY PC_STAFF AS

    -- Función ADD: inserta un nuevo empleado y retorna su código
    FUNCTION add(first_name VARCHAR, last_name VARCHAR, level_ NUMBER)
    RETURN VARCHAR IS
        v_staff_code VARCHAR2(6);
    BEGIN
        v_staff_code := 'S' || LPAD(TO_CHAR(SEQ_STAFF.NEXTVAL), 3, '0');
        INSERT INTO Staff (staff_code, first_name, last_name, level_code)
        VALUES (v_staff_code, first_name, last_name, level_);
        RETURN v_staff_code;
    END add;


    -- Procedimiento UPDATE: cambia el nivel de un empleado
    PROCEDURE update_(staff_code NUMBER, new_level NUMBER) IS
    BEGIN
        UPDATE Staff
        SET level_code = new_level
        WHERE staff_code = staff_code;
    END update_;


    -- Procedimiento ADDLEVEL: agrega un nuevo nivel
    PROCEDURE addLevel(level_code NUMBER, manager CHAR, operator CHAR, engineer CHAR) IS
    BEGIN
        INSERT INTO Level_ (level_code, manager, operator, engineer)
        VALUES (level_code, manager, operator, engineer);
    END addLevel;


    -- Función CO: consulta por código de empleado
    FUNCTION co(staff_code VARCHAR)
    RETURN SYS_REFCURSOR IS
        c SYS_REFCURSOR;
    BEGIN
        OPEN c FOR
            SELECT s.staff_code, s.first_name, s.last_name, l.level_code,
                   l.manager, l.operator, l.engineer
            FROM Staff s
            LEFT JOIN Level_ l ON s.level_code = l.level_code
            WHERE s.staff_code = co.staff_code;
        RETURN c;
    END co;


    -- Procedimiento DELETE: elimina un empleado
    PROCEDURE DELETE_(staff_code VARCHAR) IS
    BEGIN
        DELETE FROM Staff WHERE staff_code = DELETE_.staff_code;
    END DELETE_;


    -- Primera consulta operativa: empleados con función asignada
    FUNCTION coByFunction RETURN SYS_REFCURSOR IS
        c SYS_REFCURSOR;
    BEGIN
        OPEN c FOR
            SELECT s.staff_code, s.first_name, s.last_name,
                   CASE
                       WHEN l.manager = 'Y' THEN 'Manager'
                       WHEN l.operator = 'Y' THEN 'Operator'
                       WHEN l.engineer = 'Y' THEN 'Engineer'
                       ELSE 'N/A'
                   END AS function_name
            FROM Staff s
            JOIN Level_ l ON s.level_code = l.level_code;
        RETURN c;
    END coByFunction;


    -- Segunda consulta operativa: empleados por nivel
    FUNCTION coByLevel(level_code NUMBER)
    RETURN SYS_REFCURSOR IS
        c SYS_REFCURSOR;
    BEGIN
        OPEN c FOR
            SELECT s.staff_code, s.first_name, s.last_name
            FROM Staff s
            WHERE s.level_code = coByLevel.level_code;
        RETURN c;
    END coByLevel;

END PC_STAFF;
/

------------------------------------------------------------
-- CASOS DE PRUEBA EXITOSOS (CRUDOK)
------------------------------------------------------------

--Agregar un nuevo nivel correctamente
EXEC PC_STAFF.ADDLEVEL (100, 'Y', NULL, NULL);

--Agregar un nuevo empleado usando la función ADD
DECLARE
    v_code VARCHAR2(10);
BEGIN
    v_code := PC_STAFF.add('Laura', 'Mendoza', 100);
    DBMS_OUTPUT.PUT_LINE('Empleado creado con código: ' || v_code);
END;
/

--Consultar un empleado existente (usando la función CO)
DECLARE
    c SYS_REFCURSOR;
    v_code VARCHAR2(10) := 'S001';  
    v_staff Staff%ROWTYPE;
BEGIN
    c := PC_STAFF.co(v_code);
    FETCH c INTO v_staff.staff_code, v_staff.first_name, v_staff.last_name;
    DBMS_OUTPUT.PUT_LINE('Consulta exitosa: ' || v_staff.staff_code || ' - ' || v_staff.first_name);
    CLOSE c;
END;
/

--Actualizar el nivel de un empleado
BEGIN
    PC_STAFF.update_('S001', 100);
    DBMS_OUTPUT.PUT_LINE('Nivel actualizado correctamente.');
END;
/

--Eliminar un empleado existente
BEGIN
    PC_STAFF.DELETE_('S001');
    DBMS_OUTPUT.PUT_LINE('Empleado eliminado correctamente.');
END;
/

--Consulta operativa por función
DECLARE
    c SYS_REFCURSOR;
    v_code VARCHAR2(10);
    v_first VARCHAR2(50);
    v_last VARCHAR2(50);
    v_function VARCHAR2(20);
BEGIN
    c := PC_STAFF.coByFunction;
    LOOP
        FETCH c INTO v_code, v_first, v_last, v_function;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_code || ' - ' || v_function);
    END LOOP;
    CLOSE c;
END;
/

--Consulta operativa por nivel
DECLARE
    c SYS_REFCURSOR;
    v_code VARCHAR2(10);
    v_first VARCHAR2(50);
    v_last VARCHAR2(50);
BEGIN
    c := PC_STAFF.coByLevel(100);
    LOOP
        FETCH c INTO v_code, v_first, v_last;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_code || ' - ' || v_first);
    END LOOP;
    CLOSE c;
END;
/

------------------------------------------------------------
-- CASOS QUE GENERAN EXCEPCIONES (CRUDNoOK)
------------------------------------------------------------

--Intentar agregar un nivel duplicado (PK violada)
BEGIN
    PC_STAFF.addLevel(100, NULL, 'Y', NULL);
END;
/

--Intentar agregar un empleado con nivel inexistente (FK violada)
DECLARE
    v_code VARCHAR2(10);
BEGIN
    v_code := PC_STAFF.add('Andres', 'Ruiz', 999);  
END;
/

--Intentar actualizar un empleado inexistente
BEGIN
    PC_STAFF.update_('S999', 100);
END;
/

------------------------------------------------------------
-- ELIMINACIÓN DEL PAQUETE (CRUDX)
------------------------------------------------------------
DROP PACKAGE BODY PC_STAFF;
