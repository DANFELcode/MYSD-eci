--Crear tablas
CREATE TABLE Shift(
    Shift_date VARCHAR(7),
    Shift_type VARCHAR(7),
    Manager VARCHAR(7),
    Operator VARCHAR(7),
    Engineer1 VARCHAR(7),
    Engineer2 VARCHAR(7)

)

CREATE TABLE Shift_type(
    Shift_date VARCHAR(7),
    Start_time VARCHAR(5),
    End_time VARCHAR(5)
   
)

CREATE TABLE Staff(
    Staff_code VARCHAR(6),
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Level_code NUMBER(11)
)

CREATE TABLE Levels(
    Level_code NUMBER(11),
    Manager CHAR(1),
    Operators CHAR(1),
    Engineer CHAR(1)
)

--Adicionar restricciones

ALTER TABLE Shift
ADD CONSTRAINT pk_Shift PRIMARY KEY (Shift_date, shift_type);

ALTER TABLE Shift_type
ADD CONSTRAINT pk_Shift_type PRIMARY KEY (Shift_type);

ALTER TABLE Staff
ADD CONSTRAINT pk_Staff_code PRIMARY KEY (Staff_code);

ALTER TABLE Levels
ADD CONSTRAINT pk_Level_code PRIMARY KEY (Level_code);

ALTER TABLE Staff 
ADD CONSTRAINT fk_Staff_level
FOREIGN KEY (Level_code)
REFERENCES Levels (Level_code);

ALTER TABLE Shift
ADD CONSTRAINT fk_Shift_type
FOREIGN KEY (Shift_type)
REFERENCES Shift_type(Level_code);

ALTER TABLE Shift
ADD CONSTRAINT fk_Staff_level
FOREIGN KEY (Level_code)
REFERENCES Levels (Level_code);

--Poner restricciones sobre nulidad
ALTER TABLE Levels
MODIFY (Level_code NUMBER(11) NOT NULL);

ALTER TABLE Staff
MODIFY (Staff_code VARCHAR(6) NOT NULL);

ALTER TABLE Staff
MODIFY (Level_code NUMBER(11) NOT NULL);

ALTER TABLE Shift
MODIFY (Shift_date DATE NOT NULL);

ALTER TABLE Shift
MODIFY (Shift_type VARCHAR(7) NOT NULL);

ALTER TABLE Shift
MODIFY (Manager VARCHAR(7) NOT NULL);

ALTER TABLE Shift
MODIFY (Operator VARCHAR(7) NOT NULL);

ALTER TABLE Shift
MODIFY (Engineer1 VARCHAR(7) NOT NULL);

ALTER TABLE Shift_type
MODIFY (Shift_type VARCHAR(7) NOT NULL);


--PoblarOK
SELECT 'INSERT INTO Levels (Level_code, Manager, Operator, Engineer) VALUES ('
       || Level_code || ', '
       || CASE WHEN Manager IS NULL THEN 'NULL' ELSE '''' || Manager || '''' END || ', '
       || CASE WHEN Operator IS NULL THEN 'NULL' ELSE '''' || Operator || '''' END || ', '
       || CASE WHEN Engineer IS NULL THEN 'NULL' ELSE '''' || Engineer || '''' END || ');'
FROM Levels;

SELECT 'INSERT INTO Staff (Staff_code, First_name, Last_name, Level_code) VALUES ('''
       || Staff_code || ''', '''
       || First_name || ''', '''
       || Last_name || ''', '
       || Level_code || ');'
FROM Staff;

SELECT 'INSERT INTO Shift (Shift_date, Shift_type, Manager, Operator, Engineer1, Engineer2) VALUES ('
       || 'TO_DATE(''' || TO_CHAR(Shift_date, 'DD-MON-YYYY') || ''', ''DD-MON-YYYY''), '''
       || Shift_type || ''', '''
       || Manager || ''', '''
       || Operator || ''', '''
       || Engineer1 || ''', '
       || CASE WHEN Engineer2 IS NULL THEN 'NULL' ELSE '''' || Engineer2 || '''' END
       || ');'
FROM Shift;

SELECT 'INSERT INTO Shift_type (Shift_type, Start_time, End_time) VALUES ('''
       || Shift_type || ''', '''
       || TO_CHAR(Start_time, 'HH24:MI') || ''', '''
       || TO_CHAR(End_time, 'HH24:MI') || ''');'
FROM Shift_type;


--PoblarNoOK
ALTER TABLE Levels
ADD CONSTRAINT CK_Levels_Operator CHECK (Operator IN ('Y', NULL));

ALTER TABLE Levels
ADD CONSTRAINT CK_Levels_Engineer CHECK (Engineer IN ('Y', NULL));

ALTER TABLE Staff
ADD CONSTRAINT PK_Staff PRIMARY KEY (Staff_code);

ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_Level FOREIGN KEY (Level_code)
REFERENCES Levels (Level_code);

ALTER TABLE Shift
ADD CONSTRAINT FK_Shift_Engineer2 FOREIGN KEY (Engineer2)
REFERENCES Staff (Staff_code);

ALTER TABLE Shift
ADD CONSTRAINT CK_Shift_Type CHECK (Shift_type IN ('Early', 'Late'));


--PoblarNoOK
ALTER TABLE Levels
ADD CONSTRAINT CK_Levels_Operator CHECK (Operator IN ('Y', NULL));

ALTER TABLE Levels
ADD CONSTRAINT CK_Levels_Engineer CHECK (Engineer IN ('Y', NULL));

ALTER TABLE Staff
ADD CONSTRAINT PK_Staff PRIMARY KEY (Staff_code);

ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_Level FOREIGN KEY (Level_code)
REFERENCES Levels (Level_code);

ALTER TABLE Shift
ADD CONSTRAINT FK_Shift_Engineer2 FOREIGN KEY (Engineer2)
REFERENCES Staff (Staff_code);

ALTER TABLE Shift
ADD CONSTRAINT CK_Shift_Type CHECK (Shift_type IN ('Early', 'Late'));

--Consultas
--Cuántos empleados hay por cada nivel
SELECT Level_code, COUNT(*) AS num_empleados
FROM Staff
GROUP BY Level_code;

--Duración en horas de cada tipo de turno:
SELECT Shift_type,
       (End_time - Start_time) * 24 AS duration_hours
FROM Shift_type;

--¿Qué operadores trabajaron en más de un turno?
SELECT Operator, COUNT(*) AS num_turnos
FROM Shift
GROUP BY Operator
HAVING COUNT(*) > 1;


--XPoblar
DELETE FROM Shift;
DELETE FROM Staff;
DELETE FROM Shift_type;
DELETE FROM Levels;


--Xtablas
DROP TABLE Shift;
DROP TABLE Staff;
DROP TABLE Shift_type;
DROP TABLE Levels;



--- A06-------------------------------------------------------------------------------------------------------
DROP TABLE Staff CASCADE CONSTRAINTS;

CREATE TABLE Staff(
    Staff_code VARCHAR2(6) PRIMARY KEY,
    First_name VARCHAR2(50),
    Last_name VARCHAR2(50),
    Level_code NUMBER(11),
    info_empleados XMLTYPE  -- almacena el XML con Vinculacion, Estudios, Comentarios
        
);

INSERT INTO Staff (Staff_code, First_name, Last_name, Level_code, info_empleados)
VALUES (
  'AB1','Anthony','Butler',1,
  XMLTYPE(
    q'[
<info_empleados>
  <Vinculacion>
    <FechaInicio>2020-01-10</FechaInicio>
    <FechaFin/>
  </Vinculacion>
  <Estudios>
    <Estudio>
      <NombreTitulo>Técnico en Soporte</NombreTitulo>
      <Institucion>SENA</Institucion>
      <Nivel>pregrado</Nivel>
      <Anio>2019</Anio>
      <Nota>4.2</Nota>
    </Estudio>
  </Estudios>
  <Comentarios>
    <Positivos>
      <Comentario>Atención rápida</Comentario>
      <Comentario>Muy amable</Comentario>
    </Positivos>
    <Negativos>
      <Comentario>Documentación incompleta</Comentario>
    </Negativos>
  </Comentarios>
</info_empleados>
]' )
);

INSERT INTO Staff (Staff_code, First_name, Last_name, Level_code, info_empleados)
VALUES (
  'AB2','Alexis','Butler',3,
  XMLTYPE(
    q'[
<info_empleados>
  <Vinculacion>
    <FechaInicio>2021-06-01</FechaInicio>
    <FechaFin/>
  </Vinculacion>
  <Estudios>
    <Estudio>
      <NombreTitulo>Diplomado en Redes</NombreTitulo>
      <Institucion>Politécnico</Institucion>
      <Nivel>curso libre</Nivel>
      <Anio>2020</Anio>
      <Nota>4.5</Nota>
    </Estudio>
  </Estudios>
  <Comentarios>
    <Positivos>
      <Comentario>Resuelve problemas</Comentario>
    </Positivos>
    <Negativos/>
  </Comentarios>
</info_empleados>
]' )
);

INSERT INTO Staff (Staff_code, First_name, Last_name, Level_code, info_empleados)
VALUES (
  'AE1','Ava','Ellis',7,
  XMLTYPE(
    q'[
<info_empleados>
  <Vinculacion>
    <FechaInicio>2018-09-20</FechaInicio>
    <FechaFin/>
  </Vinculacion>
  <Estudios>
    <Estudio>
      <NombreTitulo>Ingeniería de Sistemas</NombreTitulo>
      <Institucion>Universidad X</Institucion>
      <Nivel>pregrado</Nivel>
      <Anio>2017</Anio>
      <Nota>4.6</Nota>
    </Estudio>
    <Estudio>
      <NombreTitulo>Especialización en Seguridad</NombreTitulo>
      <Institucion>Universidad Y</Institucion>
      <Nivel>posgrado</Nivel>
      <Anio>2020</Anio>
      <Nota>4.7</Nota>
    </Estudio>
  </Estudios>
  <Comentarios>
    <Positivos>
      <Comentario>Excelencia técnica</Comentario>
      <Comentario>Muy proactiva</Comentario>
      <Comentario>Explica claramente</Comentario>
    </Positivos>
    <Negativos/>
  </Comentarios>
</info_empleados>
]' )
);

INSERT INTO Staff (Staff_code, First_name, Last_name, Level_code, info_empleados)
VALUES (
  'AL1','Alexander','Lawson',3,
  XMLTYPE(
    q'[
<info_empleados>
  <Vinculacion>
    <FechaInicio>2022-02-15</FechaInicio>
    <FechaFin/>
  </Vinculacion>
  <Estudios>
    <Estudio>
      <NombreTitulo>Técnico en Electrónica</NombreTitulo>
      <Institucion>Instituto Z</Institucion>
      <Nivel>curso libre</Nivel>
      <Anio>2021</Anio>
      <Nota>4.1</Nota>
    </Estudio>
  </Estudios>
  <Comentarios>
    <Positivos/>
    <Negativos>
      <Comentario>Comunicación mejorable</Comentario>
    </Negativos>
  </Comentarios>
</info_empleados>
]' )
);

INSERT INTO Staff (Staff_code, First_name, Last_name, Level_code, info_empleados)
VALUES (
  'AW1','Alyssa','White',1,
  XMLTYPE(
    q'[
<info_empleados>
  <Vinculacion>
    <FechaInicio>2019-11-05</FechaInicio>
    <FechaFin/>
  </Vinculacion>
  <Estudios>
    <Estudio>
      <NombreTitulo>Analista de Sistemas</NombreTitulo>
      <Institucion>Universidad A</Institucion>
      <Nivel>pregrado</Nivel>
      <Anio>2018</Anio>
      <Nota>4.4</Nota>
    </Estudio>
  </Estudios>
  <Comentarios>
    <Positivos>
      <Comentario>Excelente seguimiento</Comentario>
      <Comentario>Soluciones claras</Comentario>
    </Positivos>
    <Negativos/>
  </Comentarios>
</info_empleados>
]' )
);

--B1

SELECT s.Staff_code,
       xt.NombreTitulo,
       xt.Institucion,
       xt.Nivel,
       xt.Anio,
       xt.Nota
FROM Staff s
   , XMLTABLE(
       '/info_empleados/Estudios/Estudio'
       PASSING s.info_empleados
       COLUMNS
         NombreTitulo VARCHAR2(200) PATH 'NombreTitulo',
         Institucion  VARCHAR2(200) PATH 'Institucion',
         Nivel        VARCHAR2(50)  PATH 'Nivel',
         Anio         NUMBER        PATH 'Anio',
         Nota         NUMBER        PATH 'Nota'
     ) xt
WHERE s.Staff_code = 'AE1';

--B2

WITH positivos_por_empleado AS (
  SELECT s.Staff_code,
         COUNT(p.comentario) AS total_positivos
  FROM Staff s
  LEFT JOIN XMLTABLE(
       '/info_empleados/Comentarios/Positivos/Comentario'
       PASSING s.info_empleados
       COLUMNS comentario VARCHAR2(4000) PATH '.'
  ) p ON 1=1
  GROUP BY s.Staff_code
),
promedio AS (
  SELECT AVG(total_positivos) AS prom_pos FROM positivos_por_empleado
)
SELECT p.Staff_code, p.total_positivos
FROM positivos_por_empleado p, promedio
WHERE p.total_positivos > promedio.prom_pos;

--B3
SELECT COUNT(*) AS empleados_retirados
FROM Staff s
WHERE XMLExists(
  '/info_empleados/Vinculacion/FechaFin[text() != ""]'
  PASSING s.info_empleados
);

-- B4. 2 CONSULTAS ADICIONALES
--1) 
SELECT s.Staff_code,
       v.FechaInicio,
       v.FechaFin
FROM Staff s,
     XMLTABLE(
       '/info_empleados/Vinculacion'
       PASSING s.info_empleados
       COLUMNS
         FechaInicio VARCHAR2(20) PATH 'FechaInicio',
         FechaFin    VARCHAR2(20) PATH 'FechaFin'
     ) v;

--2)
SELECT dbms_xmlgen.getXMLType(
         'SELECT info_empleados FROM Staff WHERE Staff_code = ''AB1'''
       ) AS xml_generado
FROM dual;

