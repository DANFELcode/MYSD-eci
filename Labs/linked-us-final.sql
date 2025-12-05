-- Creacion de de tipos

-- Creacion de tipos OBJECT (corregidos)
CREATE OR REPLACE TYPE TEmailInstitucional AS OBJECT (
    email VARCHAR2(100)
);

CREATE OR REPLACE TYPE TArchivoXML AS OBJECT (
    archivo VARCHAR2(2048)
);

CREATE OR REPLACE TYPE TA_o AS OBJECT (
    an_o NUMBER(4)
);

CREATE OR REPLACE TYPE TActorResponsable AS OBJECT (
    actor VARCHAR2(50)
);

CREATE OR REPLACE TYPE TCategoria AS OBJECT (
    categoria CHAR(1)
);

CREATE OR REPLACE TYPE TCausadoPor AS OBJECT (
    por VARCHAR2(10)
);

CREATE OR REPLACE TYPE TEstado AS OBJECT (
    estado CHAR(1)
);

CREATE OR REPLACE TYPE TGranConcepto AS OBJECT (
    concepto VARCHAR2(50)
);

CREATE OR REPLACE TYPE TJustificacion AS OBJECT (
    justificacion VARCHAR2(50)
);

CREATE OR REPLACE TYPE TSeveridad AS OBJECT (
    severidad VARCHAR2(20)
);

CREATE OR REPLACE TYPE TTaman_o AS OBJECT (
    taman_o VARCHAR2(6)
);

CREATE OR REPLACE TYPE TTipoEvidencia AS OBJECT (
    tipo CHAR(1)
);

CREATE OR REPLACE TYPE TUrl AS OBJECT (
    url VARCHAR2(50)
);


DROP TYPE TEmailInstitucional;
DROP TYPE TArchivoXML;
DROP TYPE TA_o;
DROP TYPE TActorResponsable;
DROP TYPE TCategoria;
DROP TYPE TCausadoPor;
DROP TYPE TEmailInstitucional;
DROP TYPE TEstado;
DROP TYPE TGranConcepto;
DROP TYPE TJustificacion;
DROP TYPE TSeveridad;
DROP TYPE TTaman_o;
DROP TYPE TTipoEvidencia;
DROP TYPE TUrl;

-- CREACION DE TABLAS -------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Notificaciones (
	id NUMBER(6) NOT NULL,
	error NUMBER(6) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
	correoResponsable TEmailInstitucional NOT NULL,
	fechaHora DATE NOT NULL
);

CREATE TABLE ErroresCriticos (
	id NUMBER(6) NOT NULL,
	estado TArchivoXML NOT NULL
);

CREATE TABLE Evidencias (
	id NUMBER(6) NOT NULL,
	error NUMBER(6) NOT NULL,
	tipo TTipoEvidencia NULL,
	ruta VARCHAR(100) NOT NULL,
	fecha DATE NOT NULL
);

CREATE TABLE Errores (
	id NUMBER(6) NOT NULL,
	mensaje VARCHAR(100) NOT NULL,
	fechaHora DATE NOT NULL,
	causadoPor TCausadoPor NOT NULL,
	severidad TSeveridad NOT NULL,
	responsable TActorResponsable NOT NULL,
	validacion NUMBER(6) NOT NULL,
	origen TGranConcepto NOT NULL
);

CREATE TABLE VALIDACIONES (
    ID_VALIDACION NUMBER PRIMARY KEY,
    ID_COMPETENCIA NUMBER NOT NULL,
    PERFIL_VALIDADOR VARCHAR2(100) NOT NULL,
    PERFIL_EVALUADO VARCHAR2(100) NOT NULL,
    FECHA DATE NOT NULL,
    ESTADO VARCHAR2(20) NOT NULL, 
    JUSTIFICACION VARCHAR2(4000),
    EVIDENCIAS VARCHAR2(4000)
);

CREATE SEQUENCE SQ_VALIDACION START WITH 1;


CREATE TABLE EvidenciasValidacion (
	idEvidencia NUMBER(6) NOT NULL,
	validacion NUMBER(6) NOT NULL,
	url TUrl NOT NULL
);

CREATE TABLE Logros (
	profesional VARCHAR(30) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	categoria TCategoria NOT NULL,
	fecha DATE NOT NULL,
	editorial VARCHAR(10) NULL
);

CREATE TABLE Profesionales (
	correo VARCHAR(30) NOT NULL,
	sectorInteres VARCHAR(10) NOT NULL,
	resumen VARCHAR(50) NOT NULL
);

CREATE TABLE ProfesionalesCompetencias (
	profesional VARCHAR(30) NOT NULL,
	competencia NUMBER(2) NOT NULL
);

CREATE TABLE Competencias (
	codigo NUMBER(2) NOT NULL,
	nombre VARCHAR(10) NOT NULL
);

CREATE TABLE Seguimientos (
	perfil VARCHAR(30) NOT NULL,
	sigueA VARCHAR(30) NOT NULL
);

CREATE TABLE Perfiles (
	correo VARCHAR(30) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	pais VARCHAR(10) NOT NULL
);

CREATE TABLE Fundaciones (
	correo VARCHAR(50) NOT NULL,
   razon VARCHAR2(50) NOT NULL,
   ciudad VARCHAR(50) NOT NULL,
   pais VARCHAR2(50) NOT NULL,
	taman_o TTaman_o NOT NULL,
	propuesta VARCHAR(1000) NOT NULL UNIQUE,
	a_o TA_o NOT NULL,
   proyectos NUMBER(38) NOT NULL,
   sector VARCHAR2(50) NOT NULL
);



CREATE TABLE Actua (
	fundacion VARCHAR(30) NOT NULL,
	sector VARCHAR(10) NOT NULL,
	numProyectos NUMBER(5) NOT NULL
);

CREATE TABLE Sectores (
	nombre VARCHAR(10) NOT NULL
);

CREATE TABLE CompetenciaSectores (
	competencia NUMBER(2) NOT NULL,
	sector VARCHAR(10) NOT NULL
);

DROP TABLE Actua CASCADE CONSTRAINTS;
DROP TABLE CompetenciaSectores CASCADE CONSTRAINTS;
DROP TABLE EvidenciasValidacion CASCADE CONSTRAINTS;
DROP TABLE Evidencias CASCADE CONSTRAINTS;
DROP TABLE ErroresCriticos CASCADE CONSTRAINTS;
DROP TABLE Notificaciones CASCADE CONSTRAINTS;
DROP TABLE Seguimientos CASCADE CONSTRAINTS;
DROP TABLE Logros CASCADE CONSTRAINTS;
DROP TABLE ProfesionalesCompetencias CASCADE CONSTRAINTS;
DROP TABLE Fundaciones CASCADE CONSTRAINTS;
DROP TABLE Errores CASCADE CONSTRAINTS;
DROP TABLE Validaciones CASCADE CONSTRAINTS;
DROP TABLE Competencias CASCADE CONSTRAINTS;
DROP TABLE Profesionales CASCADE CONSTRAINTS;
DROP TABLE Perfiles CASCADE CONSTRAINTS;
DROP TABLE Sectores CASCADE CONSTRAINTS;
COMMIT;

-- CREACION DE LLAVES PRIMARIAS ---------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Notificaciones ADD CONSTRAINT pk_notificaciones PRIMARY KEY (id);
ALTER TABLE ErroresCriticos ADD CONSTRAINT pk_erroresCriticos PRIMARY KEY (id);
ALTER TABLE Evidencias ADD CONSTRAINT pk_evidencias PRIMARY KEY (id);
ALTER TABLE Errores ADD CONSTRAINT pk_errores PRIMARY KEY (id);
ALTER TABLE Validaciones ADD CONSTRAINT pk_validaciones PRIMARY KEY (numero);
ALTER TABLE EvidenciasValidacion ADD CONSTRAINT pk_evidencias_validacion PRIMARY KEY (idEvidencia);
ALTER TABLE Logros ADD CONSTRAINT pk_logros PRIMARY KEY (profesional, nombre);
ALTER TABLE Profesionales ADD CONSTRAINT pk_profesionales PRIMARY KEY (correo);
ALTER TABLE ProfesionalesCompetencias ADD CONSTRAINT pk_profesionales_competencias PRIMARY KEY (profesional, competencia);
ALTER TABLE Competencias ADD CONSTRAINT pk_competencias PRIMARY KEY (codigo);
ALTER TABLE Seguimientos ADD CONSTRAINT pk_seguimientos PRIMARY KEY (perfil, sigueA);
ALTER TABLE Perfiles ADD CONSTRAINT pk_perfiles PRIMARY KEY (correo);
ALTER TABLE Fundaciones ADD CONSTRAINT pk_fundaciones PRIMARY KEY (correo);
ALTER TABLE Actua ADD CONSTRAINT pk_actua PRIMARY KEY (fundacion, sector);
ALTER TABLE Sectores ADD CONSTRAINT pk_sectores PRIMARY KEY (nombre);
ALTER TABLE CompetenciaSectores ADD CONSTRAINT pk_competencia_sectores PRIMARY KEY (competencia, sector);


-- CREACION DE LLAVES FORANEAS ----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Notificaciones
ADD CONSTRAINT fk_notificaciones_erroresCriticos
FOREIGN KEY (error) REFERENCES ErroresCriticos(id) ON DELETE CASCADE;

ALTER TABLE ErroresCriticos
ADD CONSTRAINT fk_erroresCriticos_errores
FOREIGN KEY (id) REFERENCES Errores(id) ON DELETE CASCADE;

ALTER TABLE Evidencias
ADD CONSTRAINT fk_evidencias_errores
FOREIGN KEY (error) REFERENCES Errores(id);

ALTER TABLE Errores
ADD CONSTRAINT fk_errores_validaciones
FOREIGN KEY (validacion) REFERENCES Validaciones(numero) ON DELETE CASCADE;

ALTER TABLE Validaciones
ADD CONSTRAINT fk_validaciones_perfiles
FOREIGN KEY (dadaPor) REFERENCES Perfiles(correo);

ALTER TABLE Validaciones
ADD CONSTRAINT fk_validaciones_profesionales
FOREIGN KEY (dadaA) REFERENCES Profesionales(correo) ON DELETE CASCADE;

ALTER TABLE Validaciones
ADD CONSTRAINT fk_validaciones_competencias
FOREIGN KEY (correspondienteA) REFERENCES Competencias(codigo) ON DELETE CASCADE;

ALTER TABLE EvidenciasValidacion
ADD CONSTRAINT fk_evidenciasValidacion_validaciones
FOREIGN KEY (idEvidencia) REFERENCES Validaciones(numero);

ALTER TABLE Logros
ADD CONSTRAINT fk_logros_profesionales
FOREIGN KEY (profesional) REFERENCES Profesionales(correo) ON DELETE CASCADE;

ALTER TABLE Profesionales
ADD CONSTRAINT fk_profesionales_sectores
FOREIGN KEY (sectorInteres) REFERENCES Sectores(nombre) ON DELETE CASCADE;

ALTER TABLE ProfesionalesCompetencias
ADD CONSTRAINT fk_profesionalesCompetencias_profesionales
FOREIGN KEY (profesional) REFERENCES Profesionales(correo) ON DELETE CASCADE;

ALTER TABLE ProfesionalesCompetencias
ADD CONSTRAINT fk_profesionalesCompetencias_competencias
FOREIGN KEY (competencia) REFERENCES Competencias(codigo) ON DELETE CASCADE;

ALTER TABLE Seguimientos
ADD CONSTRAINT fk_seguimientos_perfil_perfiles
FOREIGN KEY (perfil) REFERENCES Perfiles(correo);

ALTER TABLE Seguimientos
ADD CONSTRAINT fk_seguimientos_sigueA_perfiles
FOREIGN KEY (sigueA) REFERENCES Perfiles(correo);

ALTER TABLE Fundaciones
ADD CONSTRAINT fk_fundaciones_perfiles
FOREIGN KEY (correo) REFERENCES Perfiles(correo);

ALTER TABLE Actua
ADD CONSTRAINT fk_actua_fundaciones
FOREIGN KEY (fundacion) REFERENCES Fundaciones(correo) ON DELETE CASCADE;

ALTER TABLE Actua
ADD CONSTRAINT fk_actua_sectores
FOREIGN KEY (sector) REFERENCES Sectores(nombre) ON DELETE CASCADE;

ALTER TABLE CompetenciaSectores
ADD CONSTRAINT fk_competenciasSectores_competencias
FOREIGN KEY (competencia) REFERENCES Competencias(codigo);

ALTER TABLE CompetenciaSectores
ADD CONSTRAINT fk_competenciasSectores_sectores
FOREIGN KEY (sector) REFERENCES Sectores(nombre);

-- RESTRICIONES INDIVIDUALES ------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Fundaciones ADD CONSTRAINT ck_fundacion_a_o CHECK (
	a_o.an_o >= 1900
);

ALTER TABLE Errores ADD CONSTRAINT ck_error_actorResponsable CHECK (
	responsable.actor IN (
		'Ascociacion de Universidades del Norte',
        	'Fundación',
        	'Gerente de Linked-us',
        	'Jefe de monitoreo',
        	'Miembro de Junta Administradora',
        	'Perfil',
        	'Profesional'
	)
);

ALTER TABLE ErroresCriticos ADD CONSTRAINT ck_errorCritico_estado CHECK (
	estado.archivo LIKE '%.xml'
);

ALTER TABLE Logros ADD CONSTRAINT ck_logro_categoria CHECK (
	categoria.categoria IN ('P', 'R', 'I')
);

ALTER TABLE Errores ADD CONSTRAINT ck_error_causadoPor CHECK (
	causadoPor.por IN ('P', 'R', 'I')
);

ALTER TABLE Validaciones ADD CONSTRAINT ck_validacion_consecutivo CHECK (
	numero >= 0
);

ALTER TABLE Perfiles ADD CONSTRAINT ck_perfil_correo CHECK (
	correo LIKE '%@%'               AND
	correo NOT LIKE '%@gmail.com'   AND
	correo NOT LIKE '%@hotmail.com' AND
	correo NOT LIKE '%@yahoo.com'
);

ALTER TABLE Notificaciones ADD CONSTRAINT ck_notificacion_emailInstitucional CHECK (
	correoResponsable.email LIKE '%@%.edu.co'
);

ALTER TABLE Validaciones ADD CONSTRAINT ck_validacion_estado CHECK (
	estado.estado IN ('E', 'T', 'A')
);

ALTER TABLE Errores ADD CONSTRAINT ck_error_origen CHECK ( -- TODO
	origen.concepto IN (	
		'sector',
		'profesional',
		'competencia',
		'fundacion',
		'validacion'
	)
);

ALTER TABLE Validaciones ADD CONSTRAINT ck_validacion_justificacion CHECK (
	REGEXP_COUNT(justificacion.justificacion, '\s+') >= 5
);

ALTER TABLE Perfiles ADD CONSTRAINT ck_perfil_nombre CHECK (
	REGEXP_LIKE(nombre, '^[A-Za-z]+\s{1}[A-Za-z]+$')
);

ALTER TABLE Errores ADD CONSTRAINT ck_error_severidad CHECK (
	severidad.severidad IN ('INFORMATIVO', 'CRITICO', 'ADVERTENCIA')
);

ALTER TABLE Fundaciones ADD CONSTRAINT ck_fundacion_tama_o CHECK (
	taman_o.taman_o IN ('0-50', '50-100', '100+')
);

ALTER TABLE Evidencias ADD CONSTRAINT ck_evidencia_tipoEvidencia CHECK (
	tipo.tipo IN ('L', 'A', 'D')
);

ALTER TABLE EvidenciasValidacion ADD CONSTRAINT ck_fundacion_url CHECK (
	(url.url LIKE '%.html') OR (url.url LIKE '%.pdf')
);

-- TUPLAS OK ----------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Perfiles (correo, nombre, pais)
VALUES ('juan.perez@uni.edu.co', 'Juan Perez', 'COL');

INSERT INTO Perfiles (correo, nombre, pais)
VALUES ('fund@uni.edu.co', 'Ana Ruiz', 'COL');

INSERT INTO Sectores (nombre) VALUES ('educacion');

INSERT INTO Competencias (codigo, nombre) VALUES (1, 'Investig');

INSERT INTO Profesionales (correo, sectorInteres, resumen)
VALUES ('maria.lopez@org.com', 'educacion', 'Resumen profesional');

INSERT INTO Fundaciones (correo, taman_o, propuesta, ciudad, a_o)
VALUES (
	'fund@uni.edu.co',
	TTaman_o('50-100'),
	'Propuesta Unica Fundacion 1',
	'Bogota',
	TA_o(2000)
);

INSERT INTO Actua (fundacion, sector, numProyectos)
VALUES ('fund@uni.edu.co', 'educacion', 5);

INSERT INTO CompetenciaSectores (competencia, sector)
VALUES (1, 'educacion');

INSERT INTO ProfesionalesCompetencias (profesional, competencia)
VALUES ('maria.lopez@org.com', 1);

INSERT INTO Validaciones (numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado)
VALUES (
	100,
	'juan.perez@uni.edu.co',
	'maria.lopez@org.com',
	1,
	SYSDATE,
	TJustificacion('Esta es una justificacion muy importante adicional'),
	TEstado('E')
);

INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
VALUES (
	10,
	'Error crítico de prueba',
	SYSDATE,
	TCausadoPor('P'),
	TSeveridad('CRITICO'),
	TActorResponsable('Profesional'),
	100,
	TGranConcepto('profesional')
);

INSERT INTO ErroresCriticos (id, estado)
VALUES (
	10,
	TArchivoXML('error_10.xml')
);

INSERT INTO Notificaciones (id, error, descripcion, correoResponsable, fechaHora)
VALUES (
	1,
	10,
	'Notificación sobre error crítico 10',
	TEmailInstitucional('noti@uni.edu.co'),
	SYSDATE
);

INSERT INTO Evidencias (id, error, tipo, ruta, fecha)
VALUES (
	200,
	10,
	TTipoEvidencia('L'),
	's3://bucket/path/log_10.txt',
	SYSDATE
);

INSERT INTO Logros (profesional, nombre, categoria, fecha, editorial)
VALUES (
	'maria.lopez@org.com',
	'Mejor Investigacion 2024',
	TCategoria('P'),
	SYSDATE,
	NULL
);

-- TUPLAS NO OK -------------------------------------------------------------------------------------------------------------------------------------------

-- Año menor a 1900
INSERT INTO Fundaciones (correo, taman_o, propuesta, ciudad, a_o)
VALUES ('fund1@uni.edu.co', TTaman_o('0-50'), 'Propuesta inválida', 'Bogotá', TA_o(1800));

-- Actor no permitido
INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
VALUES (1, 'Error prueba', SYSDATE, TCausadoPor('P'), TSeveridad('CRITICO'), TActorResponsable('Usuario no válido'), 1, TGranConcepto('sector'));

-- No termina en .xml
INSERT INTO ErroresCriticos (id, estado)
VALUES (1, TArchivoXML('error.txt'));

-- Categoría inválida
INSERT INTO Logros (profesional, nombre, categoria, fecha, editorial)
VALUES ('pro1@uni.edu.co', 'Premio Falso', TCategoria('X'), SYSDATE, 'Edit');

-- CausadoPor inválido
INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
VALUES (2, 'Error test', SYSDATE, TCausadoPor('Z'), TSeveridad('CRITICO'), TActorResponsable('Perfil'), 1, TGranConcepto('profesional'));

-- Número negativo
INSERT INTO Validaciones (numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado)
VALUES (-10, 'perfil@correo.com', 'prof@correo.com', 1, SYSDATE, TJustificacion('Justificación válida con suficientes palabras'), TEstado('E'));

-- Dominio no permitido
INSERT INTO Perfiles (correo, nombre, pais)
VALUES ('user@gmail.com', 'Juan Perez', 'COL');

-- No termina en .edu.co
INSERT INTO Notificaciones (id, error, descripcion, correoResponsable, fechaHora)
VALUES (1, 1, 'Notificación inválida', TEmailInstitucional('user@empresa.com'), SYSDATE);

-- Estado no válido
INSERT INTO Validaciones (numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado)
VALUES (10, 'perfil@correo.com', 'prof@correo.com', 1, SYSDATE, TJustificacion('Texto válido con varias palabras'), TEstado('X'));

-- Origen no permitido
INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
VALUES (3, 'Error origen', SYSDATE, TCausadoPor('P'), TSeveridad('CRITICO'), TActorResponsable('Perfil'), 1, TGranConcepto('invalidConcept'));

-- Justificación con menos de 5 palabras
INSERT INTO Validaciones (numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado)
VALUES (11, 'perfil@correo.com', 'prof@correo.com', 1, SYSDATE, TJustificacion('Muy corta'), TEstado('E'));

-- Nombre con números
INSERT INTO Perfiles (correo, nombre, pais)
VALUES ('juan@correo.com', 'Juan123', 'COL');

-- Severidad no válida
INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
VALUES (4, 'Error severidad', SYSDATE, TCausadoPor('P'), TSeveridad('GRAVE'), TActorResponsable('Perfil'), 1, TGranConcepto('sector'));

-- Tamaño fuera de los valores permitidos
INSERT INTO Fundaciones (correo, taman_o, propuesta, ciudad, a_o)
VALUES ('fund2@uni.edu.co', TTaman_o('200'), 'Propuesta invalida', 'Bogotá', TA_o(2020));

-- Tipo de evidencia no válido
INSERT INTO Evidencias (id, error, tipo, ruta, fecha)
VALUES (1, 1, TTipoEvidencia('Z'), '/ruta/prueba', SYSDATE);

-- URL no termina en .pdf o .html
INSERT INTO EvidenciasValidacion (idEvidencia, validacion, url)
VALUES (1, 1, TUrl('https://sitio.com/documento.txt'));

-- ACCIONES Y ACCIONES OK ---------------------------------------------------------------------------------------------------------------------------------
-- note: realizar deletes antes de estas prubeas (pruebas independientes)

INSERT INTO Sectores (nombre) VALUES ('Salud');
INSERT INTO Sectores (nombre) VALUES ('Educacion');

INSERT INTO Competencias (codigo, nombre) VALUES (1, 'Liderazgo');
INSERT INTO Competencias (codigo, nombre) VALUES (2, 'Trabajo');

INSERT INTO Perfiles (correo, nombre, pais)
VALUES ('perfil1@correo.com', 'Juan Perez', 'COL');

INSERT INTO Perfiles (correo, nombre, pais)
VALUES ('fund1@uni.edu.co', 'Funda uno', 'COL');

INSERT INTO Profesionales (correo, sectorInteres, resumen)
VALUES ('prof1@uni.edu.co', 'Salud', 'Profesional en salud pública');

INSERT INTO Fundaciones (correo, taman_o, propuesta, ciudad, a_o)
VALUES ('fund1@uni.edu.co', TTaman_o('0-50'), 'Propuesta Fundación 1', 'Bogotá', TA_o(2020));

INSERT INTO Actua (fundacion, sector, numProyectos)
VALUES ('fund1@uni.edu.co', 'Salud', 5);

INSERT INTO Logros (profesional, nombre, categoria, fecha, editorial)
VALUES ('prof1@uni.edu.co', 'Publicación 1', TCategoria('P'), SYSDATE, 'UniPress');

INSERT INTO ProfesionalesCompetencias (profesional, competencia)
VALUES ('prof1@uni.edu.co', 1);

INSERT INTO Validaciones (numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado)
VALUES (1, 'perfil1@correo.com', 'prof1@uni.edu.co', 1, SYSDATE, TJustificacion('u d t c c d'), TEstado('E'));

INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
VALUES (1, 'Error de prueba', SYSDATE, TCausadoPor('P'), TSeveridad('CRITICO'), TActorResponsable('Perfil'), 1, TGranConcepto('sector'));

INSERT INTO ErroresCriticos (id, estado)
VALUES (1, TArchivoXML('archivo.xml'));

INSERT INTO Notificaciones (id, error, descripcion, correoResponsable, fechaHora)
VALUES (1, 1, 'Notificación prueba', TEmailInstitucional('admin@uni.edu.co'), SYSDATE);

-- Esperado: registros en Logros y ProfesionalesCompetencias con ese profesional se eliminan.
DELETE FROM Profesionales WHERE correo = 'prof1@uni.edu.co';

-- Esperado: se eliminan Profesionales del sector "Salud" y filas en Actua con sector = 'Salud'.
DELETE FROM Sectores WHERE nombre = 'Salud';

-- Esperado: filas relacionadas en Actua desaparecen automáticamente.
DELETE FROM Fundaciones WHERE correo = 'fund1@uni.edu.co';

-- Esperado: las Validaciones y las filas en ProfesionalesCompetencias asociadas se eliminan.
DELETE FROM Competencias WHERE codigo = 1;

SELECT * FROM Logros;
SELECT * FROM ProfesionalesCompetencias;
SELECT * FROM Profesionales;
SELECT * FROM Actua;
SELECT * FROM Validaciones;

-- DELETES PARA HACER QUE TODAS LAS PRUEBAS SEAN INDEPENDIENTES -------------------------------------------------------------------------------------------
DELETE FROM Notificaciones;
DELETE FROM ErroresCriticos;
DELETE FROM Evidencias;
DELETE FROM Errores;
DELETE FROM Validaciones;
DELETE FROM EvidenciasValidacion;
DELETE FROM Logros;
DELETE FROM ProfesionalesCompetencias;
DELETE FROM Profesionales;
DELETE FROM CompetenciaSectores;
DELETE FROM Seguimientos;
DELETE FROM Fundaciones;
DELETE FROM Actua;
DELETE FROM Sectores;
DELETE FROM Perfiles;
DELETE FROM Competencias;

-- TRIGGERS -----------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER tr_validacion_bi
BEFORE INSERT ON Validaciones
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    :NEW.fecha := SYSDATE;
    :NEW.estado.estado := 'E';
    
    --
    
    SELECT COUNT(*) INTO v_count
    FROM Seguimientos
    WHERE perfil = :NEW.dadaPor AND sigueA = :NEW.dadaA;
    
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El validador no pertenece a la red del evaluado');
    END IF;
    
    --
    
    SELECT COUNT(*) INTO v_count
    FROM Validaciones
    WHERE dadaPor = :NEW.dadaPor
      AND dadaA = :NEW.dadaA
      AND correspondienteA = :NEW.correspondienteA;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Esta competencia ya fue validada por este perfil');
    END IF;
END;

CREATE OR REPLACE TRIGGER tr_validacion_bu
BEFORE UPDATE ON Validaciones
FOR EACH ROW
DECLARE
    v_evidencias NUMBER;
BEGIN
    -- solo permitir modificar si está en proceso
    IF :OLD.estado.estado <> 'E' THEN
        RAISE_APPLICATION_ERROR(-20010, 'Solo se pueden modificar validaciones en estado En Proceso');
    END IF;

    -- no permitir cambios en columnas distintas de justificación o estado
    IF (:NEW.dadaPor <> :OLD.dadaPor OR
        :NEW.dadaA <> :OLD.dadaA OR
        :NEW.correspondienteA <> :OLD.correspondienteA OR
        :NEW.fecha <> :OLD.fecha) THEN
        RAISE_APPLICATION_ERROR(-20011, 'Solo se puede modificar la justificación o el estado');
    END IF;

    -- si se cambia el estado a Terminada, verificar justificación y evidencias
    IF :NEW.estado.estado = 'T' THEN
        SELECT COUNT(*) INTO v_evidencias
        FROM EvidenciasValidacion
        WHERE validacion = :OLD.numero;

        IF (:NEW.justificacion.justificacion IS NULL OR v_evidencias = 0) THEN
            RAISE_APPLICATION_ERROR(-20012, 'Para terminar la validación debe haber justificación y al menos una evidencia');
        END IF;
    END IF;
END;

CREATE OR REPLACE TRIGGER tr_profesional_bu
BEFORE UPDATE ON Profesionales
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- no permitir cambiar el identificador de correo
    IF :NEW.correo <> :OLD.correo THEN
        RAISE_APPLICATION_ERROR(-20100, 'No se puede modificar el correo del profesional (identificador).');
    END IF;

    -- Permitir modificar solo resumen o el sector de interés
    IF (:NEW.resumen <> :OLD.resumen OR :NEW.sectorInteres <> :OLD.sectorInteres) THEN
        NULL;
    ELSE
        RAISE_APPLICATION_ERROR(-20101, 'Solo se permite modificar el resumen o el sector de interés del profesional.');
    END IF;
END;

CREATE OR REPLACE TRIGGER trg_registrar_validacion
BEFORE INSERT OR UPDATE ON Validacion
FOR EACH ROW
BEGIN
    IF :NEW.fecha > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se puede registrar una validación con fecha futura.');
    END IF;

    IF :NEW.estado = 'APROBADA' AND :NEW.justificacion IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Una validación aprobada debe tener justificación.');
    END IF;
END;
/


-- TRIGGERS OK --------------------------------------------------------------------------------------------------------------------------------------------

-- informacion de contexto
INSERT INTO Perfiles VALUES ('perfil1@uni.edu.co', 'Juan Perez', 'CO');
INSERT INTO Perfiles VALUES ('perfil2@uni.edu.co', 'Maria Gomez', 'CO');

INSERT INTO Sectores VALUES ('Educacion');

INSERT INTO Profesionales VALUES ('perfil1@uni.edu.co', 'Educacion', 'Docente experimentado');

INSERT INTO Competencias VALUES (1, 'Liderazgo');
INSERT INTO Competencias VALUES (2, 'Trabajo o');
INSERT INTO Seguimientos VALUES ('perfil1@uni.edu.co', 'perfil1@uni.edu.co');

INSERT INTO Validaciones (
    numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado
) VALUES (
    1,
    'perfil1@uni.edu.co',
    'prof1@uni.edu.co',
    1,
    NULL,
    TJustificacion('Tiene las competencias necesarias'),
    TEstado(NULL)
);


-----------------

--Consultar información
SELECT *
FROM mbda.DATA;

-- Consultar cuantos datos tiene
SELECT COUNT(DISTINCT CORREO)
FROM mbda.DATA;

-- Incluirse como fundacion
INSERT INTO mbda.DATA VALUES ('juan.munar-c@mail.escuelaing.edu.co','Escuela', 'Bogota', 'Colombia', 245, 'google.pl/nascetur/ridiculus.pdf', 2025, 4283,'Educacion');
INSERT INTO mbda.DATA VALUES ('daniel.sua-s@mail.escuelaing.edu.co','Escuela', 'Bogota', 'Colombia', 305, 'google.pl/nascetur/ridiculus.pdf', 2025, 4113,'Home');

--Intento de modificación y de borrado
DELETE FROM mbda.DATA WHERE CORREO IN ('juan.munar-c@mail.escuelaing.edu.co', 'daniel.sua-s@mail.escuelaing.edu.co');

UPDATE mbda.DATA
SET CORREO = 'juan.munar-c@gmail.com'
WHERE CORREO = 'juan.munar-c@mail.escuelaing.edu.co';


-- Instruccion para otorgar los permisos que actualmente tiene esa tabla

DESCRIBE mbda.DATA;

-- Instrucciones necesarias para importar los datos de la tabla
-- Asumiendo esta estructura para mbda.DATA:
-- col1: correo, col2: nombre, col3: ciudad, col4: pais, col5: tamaño, 
-- col6: propuesta_url, col7: año, col8: id, col9: tipo

-- Insertar datos en la tabla Fundaciones con la estructura correcta
-- Versión con transformaciones separadas para mejor legibilidad
INSERT INTO Fundaciones (correo, razon, ciudad, pais, taman_o, propuesta, a_o, proyectos, sector)
SELECT 
    correo,
    razon,
    ciudad, 
    pais,
    
    -- Transformación de tamaño
    CASE 
        WHEN proyectos <= 50 THEN TTaman_o('0-50')
        WHEN proyectos <= 100 THEN TTaman_o('50-100')
        ELSE TTaman_o('100+')
    END AS taman_o,
    
    -- Transformación de propuesta
    CASE 
        -- Si es XML, convertir a HTML
        WHEN LOWER(propuesta) LIKE '%.xml' THEN
            REPLACE(
                CASE WHEN LENGTH(propuesta) > 50 THEN 
                    SUBSTR(propuesta, INSTR(propuesta, '/', -1) + 1)
                ELSE propuesta END,
                '.xml', '.html'
            )
        -- Si no tiene extensión conocida, convertir a PDF
        WHEN LOWER(propuesta) NOT LIKE '%.html' 
         AND LOWER(propuesta) NOT LIKE '%.pdf' 
         AND LOWER(propuesta) NOT LIKE '%.xml' THEN
            CASE WHEN LENGTH(propuesta) > 50 THEN 
                SUBSTR(propuesta, INSTR(propuesta, '/', -1) + 1)
            ELSE propuesta END || '.pdf'
        -- Si es muy larga, reubicar en raíz
        WHEN LENGTH(propuesta) > 50 THEN
            SUBSTR(propuesta, INSTR(propuesta, '/', -1) + 1)
        ELSE propuesta
    END AS propuesta,
    
    -- Año como objeto
    TA_o(a_o),
    
    proyectos,
    sector
    
FROM mbda.DATA;

---------------------------------------
--PARTE C. Modelo físico. Componentes.
--1.
--CRUDE
---------------------------------------
CREATE OR REPLACE PACKAGE PC_VALIDACIONES AS
    
    -- Adición
    PROCEDURE AGREGAR_VALIDACION(
        P_ID_COMPETENCIA IN NUMBER,
        P_PERFIL_VALIDADOR IN VARCHAR2,
        P_PERFIL_EVALUADO IN VARCHAR2
    );

    -- Modificación
    PROCEDURE MODIFICAR_VALIDACION(
        P_ID_VALIDACION IN NUMBER,
        P_JUSTIFICACION IN VARCHAR2,
        P_EVIDENCIAS IN VARCHAR2,
        P_ESTADO IN VARCHAR2
    );

    -- Anulación por Junta
    PROCEDURE ANULAR_VALIDACION(
        P_ID_VALIDACION IN NUMBER
    );

    -- Consulta de validaciones por sectores (Junta)
    FUNCTION CONSULTA_SECTORES
        RETURN SYS_REFCURSOR;

    -- Consulta de validaciones por profesional (Candidato)
    FUNCTION CONSULTA_POR_PERFIL(
        P_CORREO IN VARCHAR2
    ) RETURN SYS_REFCURSOR;

END PC_VALIDACIONES;

-----------------------------------------------
--CRUDI
-----------------------------------------------
CREATE OR REPLACE PACKAGE BODY PC_VALIDACIONES AS

------------------------------------------------------
-- AGREGAR VALIDACION
------------------------------------------------------
PROCEDURE AGREGAR_VALIDACION(
    P_ID_COMPETENCIA IN NUMBER,
    P_PERFIL_VALIDADOR IN VARCHAR2,
    P_PERFIL_EVALUADO IN VARCHAR2
) IS
    V_EXISTE NUMBER;
BEGIN
    -- Regla: no puede evaluar la misma competencia más de una vez
    SELECT COUNT(*) INTO V_EXISTE
    FROM VALIDACIONES
    WHERE ID_COMPETENCIA = P_ID_COMPETENCIA
      AND PERFIL_VALIDADOR = P_PERFIL_VALIDADOR;

    IF V_EXISTE > 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'El perfil ya validó esta competencia anteriormente.');
    END IF;

    INSERT INTO VALIDACIONES (
        ID_VALIDACION, ID_COMPETENCIA,
        PERFIL_VALIDADOR, PERFIL_EVALUADO,
        FECHA, ESTADO
    )
    VALUES (
        SQ_VALIDACION.NEXTVAL,
        P_ID_COMPETENCIA,
        P_PERFIL_VALIDADOR,
        P_PERFIL_EVALUADO,
        SYSDATE,
        'EN_PROCESO'
    );
END AGREGAR_VALIDACION;


------------------------------------------------------
-- MODIFICAR VALIDACION
------------------------------------------------------
PROCEDURE MODIFICAR_VALIDACION(
    P_ID_VALIDACION IN NUMBER,
    P_JUSTIFICACION IN VARCHAR2,
    P_EVIDENCIAS IN VARCHAR2,
    P_ESTADO IN VARCHAR2
) IS
    V_ESTADO VARCHAR2(20);
BEGIN
    SELECT ESTADO INTO V_ESTADO
    FROM VALIDACIONES
    WHERE ID_VALIDACION = P_ID_VALIDACION;

    IF V_ESTADO <> 'EN_PROCESO' THEN
        RAISE_APPLICATION_ERROR(-20002,
            'Solo pueden modificarse validaciones EN_PROCESO.');
    END IF;

    IF P_ESTADO = 'TERMINADA' AND
       (P_JUSTIFICACION IS NULL OR P_EVIDENCIAS IS NULL) THEN
        RAISE_APPLICATION_ERROR(-20003,
            'Para terminar la validación debe haber justificación y al menos una evidencia.');
    END IF;

    UPDATE VALIDACIONES
    SET JUSTIFICACION = P_JUSTIFICACION,
        EVIDENCIAS = P_EVIDENCIAS,
        ESTADO = P_ESTADO
    WHERE ID_VALIDACION = P_ID_VALIDACION;
END MODIFICAR_VALIDACION;


------------------------------------------------------
-- ANULAR VALIDACION
------------------------------------------------------
PROCEDURE ANULAR_VALIDACION(
    P_ID_VALIDACION IN NUMBER
) IS
    V_ESTADO VARCHAR2(20);
BEGIN
    SELECT ESTADO INTO V_ESTADO
    FROM VALIDACIONES
    WHERE ID_VALIDACION = P_ID_VALIDACION;

    IF V_ESTADO <> 'TERMINADA' THEN
        RAISE_APPLICATION_ERROR(-20004,
            'Solo se pueden anular validaciones TERMINADAS.');
    END IF;

    UPDATE VALIDACIONES
    SET ESTADO = 'ANULADA'
    WHERE ID_VALIDACION = P_ID_VALIDACION;
END ANULAR_VALIDACION;


------------------------------------------------------
-- CONSULTA SECTORES (Junta)
------------------------------------------------------
FUNCTION CONSULTA_SECTORES
RETURN SYS_REFCURSOR IS
    C SYS_REFCURSOR;
BEGIN
    OPEN C FOR
        SELECT SECTOR,
               COUNT(*) AS TOTAL,
               SUM(CASE WHEN ESTADO = 'TERMINADA' THEN 1 ELSE 0 END) AS FIRMES,
               SUM(CASE WHEN ESTADO = 'ANULADA' THEN 1 ELSE 0 END) AS ANULADAS,
               (SUM(CASE WHEN ESTADO = 'TERMINADA' THEN 1 ELSE 0 END) /
                COUNT(*)) * 100 AS PORCENTAJE_FIRMES
        FROM VISTA_VALIDACIONES_SECTOR
        GROUP BY SECTOR
        ORDER BY TOTAL DESC;

    RETURN C;
END CONSULTA_SECTORES;


------------------------------------------------------
-- CONSULTA POR PERFIL (Candidato)
------------------------------------------------------
FUNCTION CONSULTA_POR_PERFIL(
    P_CORREO IN VARCHAR2
) RETURN SYS_REFCURSOR IS
    C SYS_REFCURSOR;
BEGIN
    OPEN C FOR
        SELECT NOMBRE_COMPETENCIA,
               SUM(CASE WHEN ESTADO = 'TERMINADA' THEN 1 ELSE 0 END) AS FIRMES,
               (SUM(CASE WHEN ESTADO = 'TERMINADA' THEN 1 ELSE 0 END) /
                COUNT(*)) * 100 AS PORCENTAJE
        FROM VISTA_VALIDACIONES_PERFIL
        WHERE PERFIL_EVALUADO = P_CORREO
        GROUP BY NOMBRE_COMPETENCIA;

    RETURN C;
END CONSULTA_POR_PERFIL;


END PC_VALIDACIONES;

------------------------------------------
--CRUDX
------------------------------------------
DROP PACKAGE PC_VALIDACIONES;
DROP PACKAGE BODY PC_VALIDACIONES;



-----------------------------------------------
--2.Prueben el paquete con los casos más significativos: 5 éxito y 3 de fracaso.
-----------------------------------------------
--CRUDOK
-- Adición válida
BEGIN
    PC_VALIDACIONES.AGREGAR_VALIDACION(
        10, 'validador@mail.com', 'evaluado@mail.com'
    );
END;
/

-- Modificación válida
BEGIN
    PC_VALIDACIONES.MODIFICAR_VALIDACION(
        1, 'Cumple requisitos', 'Evidencia.pdf', 'TERMINADA'
    );
END;
/

-- Anulación válida
BEGIN
    PC_VALIDACIONES.ANULAR_VALIDACION(1);
END;

-----------------------------------------------------
--CRUDNOOK
-- Intentar agregar validación duplicada
BEGIN
    PC_VALIDACIONES.AGREGAR_VALIDACION(
        10, 'validador@mail.com', 'evaluado@mail.com'
    );
END;
/

-- Intentar modificar una validación que no está EN_PROCESO
BEGIN
    PC_VALIDACIONES.MODIFICAR_VALIDACION(
        1, 'Justificación', 'Evidencia', 'TERMINADA'
    );
END;
/

-- Intentar anular validación que NO está TERMINADA
BEGIN
    PC_VALIDACIONES.ANULAR_VALIDACION(2);
END;

--------------------------------------------
--D. Modelo físico. Seguridad.
-- =============================================
-- ESPECIFICACIÓN PAQUETE USUARIO (PA_USUARIO)
-- =============================================
CREATE OR REPLACE PACKAGE PA_USUARIO AS
    -- Operaciones para Profesionales
    PROCEDURE profesional_a4(
        p_correo IN VARCHAR2, 
        p_sectorInteres IN VARCHAR2, 
        p_resumen IN VARCHAR2
    );
    
    PROCEDURE profesional_m0(
        p_correo IN VARCHAR2, 
        p_columna IN VARCHAR2, 
        p_nuevo_valor IN VARCHAR2
    );
    
    PROCEDURE profesional_e1(p_correo IN VARCHAR2);
    PROCEDURE profesional_print_co;
    
    -- Operaciones para Competencias
    PROCEDURE competencia_a4(p_codigo IN NUMBER, p_nombre IN VARCHAR2);
    PROCEDURE competencia_m0(p_codigo IN NUMBER, p_columna IN VARCHAR2, p_nuevo_valor IN VARCHAR2);
    PROCEDURE competencia_e1(p_codigo IN NUMBER);
    PROCEDURE competencia_print_co;
    
    -- Operaciones para Fundaciones
    PROCEDURE fundacion_a4(
        p_correo IN VARCHAR2,
        p_razon IN VARCHAR2,
        p_ciudad IN VARCHAR2,
        p_pais IN VARCHAR2,
        p_taman_o IN VARCHAR2,
        p_propuesta IN VARCHAR2,
        p_a_o IN NUMBER,
        p_proyectos IN NUMBER,
        p_sector IN VARCHAR2
    );
    
    PROCEDURE fundacion_m0(
        p_correo IN VARCHAR2, 
        p_columna IN VARCHAR2, 
        p_nuevo_valor IN VARCHAR2
    );
    
    PROCEDURE fundacion_e1(p_correo IN VARCHAR2);
    PROCEDURE fundacion_print_co;
    
    -- Operación para importar fundación
    PROCEDURE fundacion_importar;

END PA_USUARIO;
/

-- =============================================
-- ESPECIFICACIÓN PAQUETE JUNTA (PA_JUNTA)
-- =============================================
CREATE OR REPLACE PACKAGE PA_JUNTA AS
    -- Operaciones para Validaciones
    PROCEDURE validacion_a4(
        p_numero IN NUMBER,
        p_dadaPor IN VARCHAR2,
        p_dadaA IN VARCHAR2,
        p_correspondienteA IN NUMBER,
        p_justificacion IN VARCHAR2
    );
    
    PROCEDURE validacion_m0(
        p_numero IN NUMBER,
        p_columna IN VARCHAR2,
        p_nuevo_valor IN VARCHAR2
    );
    
    PROCEDURE validacion_e1(p_numero IN NUMBER);
    PROCEDURE validacion_print_co;
    
    -- Operaciones para Errores
    PROCEDURE error_a4(
        p_id IN NUMBER,
        p_mensaje IN VARCHAR2,
        p_causadoPor IN VARCHAR2,
        p_severidad IN VARCHAR2,
        p_responsable IN VARCHAR2,
        p_validacion IN NUMBER,
        p_origen IN VARCHAR2
    );
    
    PROCEDURE error_m0(
        p_id IN NUMBER,
        p_columna IN VARCHAR2,
        p_nuevo_valor IN VARCHAR2
    );
    
    PROCEDURE error_e1(p_id IN NUMBER);
    PROCEDURE error_print_co;
    
    -- Operaciones para Notificaciones
    PROCEDURE notificacion_a4(
        p_id IN NUMBER,
        p_error IN NUMBER,
        p_descripcion IN VARCHAR2,
        p_correoResponsable IN VARCHAR2
    );
    
    PROCEDURE notificacion_m0(
        p_id IN NUMBER,
        p_columna IN VARCHAR2,
        p_nuevo_valor IN VARCHAR2
    );
    
    PROCEDURE notificacion_e1(p_id IN NUMBER);
    PROCEDURE notificacion_print_co;

END PA_JUNTA;
/

-- =============================================
-- IMPLEMENTACIÓN PAQUETE USUARIO (PA_USUARIO)
-- =============================================
CREATE OR REPLACE PACKAGE BODY PA_USUARIO AS

    -- PROFESIONAL: Agregar
    PROCEDURE profesional_a4(
        p_correo IN VARCHAR2, 
        p_sectorInteres IN VARCHAR2, 
        p_resumen IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Profesionales (correo, sectorInteres, resumen)
        VALUES (p_correo, p_sectorInteres, p_resumen);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END profesional_a4;

    -- PROFESIONAL: Modificar
    PROCEDURE profesional_m0(
        p_correo IN VARCHAR2, 
        p_columna IN VARCHAR2, 
        p_nuevo_valor IN VARCHAR2
    ) AS
        v_sql VARCHAR2(1000);
    BEGIN
        v_sql := 'UPDATE Profesionales SET ' || p_columna || ' = :1 WHERE correo = :2';
        EXECUTE IMMEDIATE v_sql USING p_nuevo_valor, p_correo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END profesional_m0;

    -- PROFESIONAL: Eliminar
    PROCEDURE profesional_e1(p_correo IN VARCHAR2) AS
    BEGIN
        DELETE FROM Profesionales WHERE correo = p_correo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END profesional_e1;

    -- PROFESIONAL: Consultar
    PROCEDURE profesional_print_co AS
        CURSOR c_profesionales IS SELECT * FROM Profesionales;
    BEGIN
        FOR rec IN c_profesionales LOOP
            DBMS_OUTPUT.PUT_LINE('Correo: ' || rec.correo || ', Sector: ' || rec.sectorInteres || ', Resumen: ' || rec.resumen);
        END LOOP;
    END profesional_print_co;

    -- COMPETENCIA: Agregar
    PROCEDURE competencia_a4(p_codigo IN NUMBER, p_nombre IN VARCHAR2) AS
    BEGIN
        INSERT INTO Competencias (codigo, nombre) VALUES (p_codigo, p_nombre);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END competencia_a4;

    -- COMPETENCIA: Modificar
    PROCEDURE competencia_m0(p_codigo IN NUMBER, p_columna IN VARCHAR2, p_nuevo_valor IN VARCHAR2) AS
        v_sql VARCHAR2(1000);
    BEGIN
        v_sql := 'UPDATE Competencias SET ' || p_columna || ' = :1 WHERE codigo = :2';
        EXECUTE IMMEDIATE v_sql USING p_nuevo_valor, p_codigo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END competencia_m0;

    -- COMPETENCIA: Eliminar
    PROCEDURE competencia_e1(p_codigo IN NUMBER) AS
    BEGIN
        DELETE FROM Competencias WHERE codigo = p_codigo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END competencia_e1;

    -- COMPETENCIA: Consultar
    PROCEDURE competencia_print_co AS
        CURSOR c_competencias IS SELECT * FROM Competencias;
    BEGIN
        FOR rec IN c_competencias LOOP
            DBMS_OUTPUT.PUT_LINE('Código: ' || rec.codigo || ', Nombre: ' || rec.nombre);
        END LOOP;
    END competencia_print_co;

    -- FUNDACION: Agregar
    PROCEDURE fundacion_a4(
        p_correo IN VARCHAR2,
        p_razon IN VARCHAR2,
        p_ciudad IN VARCHAR2,
        p_pais IN VARCHAR2,
        p_taman_o IN VARCHAR2,
        p_propuesta IN VARCHAR2,
        p_a_o IN NUMBER,
        p_proyectos IN NUMBER,
        p_sector IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Fundaciones (correo, razon, ciudad, pais, taman_o, propuesta, a_o, proyectos, sector)
        VALUES (p_correo, p_razon, p_ciudad, p_pais, TTaman_o(p_taman_o), p_propuesta, TA_o(p_a_o), p_proyectos, p_sector);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END fundacion_a4;

    -- FUNDACION: Modificar
    PROCEDURE fundacion_m0(
        p_correo IN VARCHAR2, 
        p_columna IN VARCHAR2, 
        p_nuevo_valor IN VARCHAR2
    ) AS
        v_sql VARCHAR2(1000);
    BEGIN
        IF p_columna = 'taman_o' THEN
            UPDATE Fundaciones SET taman_o = TTaman_o(p_nuevo_valor) WHERE correo = p_correo;
        ELSIF p_columna = 'a_o' THEN
            UPDATE Fundaciones SET a_o = TA_o(TO_NUMBER(p_nuevo_valor)) WHERE correo = p_correo;
        ELSE
            v_sql := 'UPDATE Fundaciones SET ' || p_columna || ' = :1 WHERE correo = :2';
            EXECUTE IMMEDIATE v_sql USING p_nuevo_valor, p_correo;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END fundacion_m0;

    -- FUNDACION: Eliminar
    PROCEDURE fundacion_e1(p_correo IN VARCHAR2) AS
    BEGIN
        DELETE FROM Fundaciones WHERE correo = p_correo;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END fundacion_e1;

    -- FUNDACION: Consultar
    PROCEDURE fundacion_print_co AS
        CURSOR c_fundaciones IS SELECT * FROM Fundaciones;
    BEGIN
        FOR rec IN c_fundaciones LOOP
            DBMS_OUTPUT.PUT_LINE('Correo: ' || rec.correo || ', Razón: ' || rec.razon || ', Ciudad: ' || rec.ciudad);
        END LOOP;
    END fundacion_print_co;

    -- FUNDACION: Importar
    PROCEDURE fundacion_importar AS
    BEGIN
        INSERT INTO Fundaciones (correo, razon, ciudad, pais, taman_o, propuesta, a_o, proyectos, sector)
        SELECT 
            correo,
            razon,
            ciudad, 
            pais,
            CASE 
                WHEN proyectos <= 50 THEN TTaman_o('0-50')
                WHEN proyectos <= 100 THEN TTaman_o('50-100')
                ELSE TTaman_o('100+')
            END,
            CASE 
                WHEN LOWER(propuesta) LIKE '%.xml' THEN
                    REPLACE(
                        CASE WHEN LENGTH(propuesta) > 50 THEN 
                            SUBSTR(propuesta, INSTR(propuesta, '/', -1) + 1)
                        ELSE propuesta END,
                        '.xml', '.html'
                    )
                WHEN LOWER(propuesta) NOT LIKE '%.html' 
                 AND LOWER(propuesta) NOT LIKE '%.pdf' 
                 AND LOWER(propuesta) NOT LIKE '%.xml' THEN
                    CASE WHEN LENGTH(propuesta) > 50 THEN 
                        SUBSTR(propuesta, INSTR(propuesta, '/', -1) + 1)
                    ELSE propuesta END || '.pdf'
                WHEN LENGTH(propuesta) > 50 THEN
                    SUBSTR(propuesta, INSTR(propuesta, '/', -1) + 1)
                ELSE propuesta
            END,
            TA_o(a_o),
            proyectos,
            sector
        FROM mbda.DATA;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END fundacion_importar;

END PA_USUARIO;
/

-- =============================================
-- IMPLEMENTACIÓN PAQUETE JUNTA (PA_JUNTA)
-- =============================================
CREATE OR REPLACE PACKAGE BODY PA_JUNTA AS

    -- VALIDACION: Agregar
    PROCEDURE validacion_a4(
        p_numero IN NUMBER,
        p_dadaPor IN VARCHAR2,
        p_dadaA IN VARCHAR2,
        p_correspondienteA IN NUMBER,
        p_justificacion IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Validaciones (numero, dadaPor, dadaA, correspondienteA, fecha, justificacion, estado)
        VALUES (p_numero, p_dadaPor, p_dadaA, p_correspondienteA, SYSDATE, TJustificacion(p_justificacion), TEstado('E'));
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END validacion_a4;

    -- VALIDACION: Modificar
    PROCEDURE validacion_m0(
        p_numero IN NUMBER,
        p_columna IN VARCHAR2,
        p_nuevo_valor IN VARCHAR2
    ) AS
        v_sql VARCHAR2(1000);
    BEGIN
        IF p_columna = 'justificacion' THEN
            UPDATE Validaciones SET justificacion = TJustificacion(p_nuevo_valor) WHERE numero = p_numero;
        ELSIF p_columna = 'estado' THEN
            UPDATE Validaciones SET estado = TEstado(p_nuevo_valor) WHERE numero = p_numero;
        ELSE
            v_sql := 'UPDATE Validaciones SET ' || p_columna || ' = :1 WHERE numero = :2';
            EXECUTE IMMEDIATE v_sql USING p_nuevo_valor, p_numero;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END validacion_m0;

    -- VALIDACION: Eliminar
    PROCEDURE validacion_e1(p_numero IN NUMBER) AS
    BEGIN
        DELETE FROM Validaciones WHERE numero = p_numero;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END validacion_e1;

    -- VALIDACION: Consultar
    PROCEDURE validacion_print_co AS
        CURSOR c_validaciones IS SELECT * FROM Validaciones;
    BEGIN
        FOR rec IN c_validaciones LOOP
            DBMS_OUTPUT.PUT_LINE('Número: ' || rec.numero || ', DadaPor: ' || rec.dadaPor || ', DadaA: ' || rec.dadaA);
        END LOOP;
    END validacion_print_co;

    -- ERROR: Agregar
    PROCEDURE error_a4(
        p_id IN NUMBER,
        p_mensaje IN VARCHAR2,
        p_causadoPor IN VARCHAR2,
        p_severidad IN VARCHAR2,
        p_responsable IN VARCHAR2,
        p_validacion IN NUMBER,
        p_origen IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Errores (id, mensaje, fechaHora, causadoPor, severidad, responsable, validacion, origen)
        VALUES (p_id, p_mensaje, SYSDATE, TCausadoPor(p_causadoPor), TSeveridad(p_severidad), 
                TActorResponsable(p_responsable), p_validacion, TGranConcepto(p_origen));
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END error_a4;

    -- ERROR: Modificar
    PROCEDURE error_m0(
        p_id IN NUMBER,
        p_columna IN VARCHAR2,
        p_nuevo_valor IN VARCHAR2
    ) AS
        v_sql VARCHAR2(1000);
    BEGIN
        IF p_columna = 'causadoPor' THEN
            UPDATE Errores SET causadoPor = TCausadoPor(p_nuevo_valor) WHERE id = p_id;
        ELSIF p_columna = 'severidad' THEN
            UPDATE Errores SET severidad = TSeveridad(p_nuevo_valor) WHERE id = p_id;
        ELSIF p_columna = 'responsable' THEN
            UPDATE Errores SET responsable = TActorResponsable(p_nuevo_valor) WHERE id = p_id;
        ELSIF p_columna = 'origen' THEN
            UPDATE Errores SET origen = TGranConcepto(p_nuevo_valor) WHERE id = p_id;
        ELSE
            v_sql := 'UPDATE Errores SET ' || p_columna || ' = :1 WHERE id = :2';
            EXECUTE IMMEDIATE v_sql USING p_nuevo_valor, p_id;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END error_m0;

    -- ERROR: Eliminar
    PROCEDURE error_e1(p_id IN NUMBER) AS
    BEGIN
        DELETE FROM Errores WHERE id = p_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END error_e1;

    -- ERROR: Consultar
    PROCEDURE error_print_co AS
        CURSOR c_errores IS SELECT * FROM Errores;
    BEGIN
        FOR rec IN c_errores LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id || ', Mensaje: ' || rec.mensaje || ', Severidad: ' || rec.severidad.severidad);
        END LOOP;
    END error_print_co;

    -- NOTIFICACION: Agregar
    PROCEDURE notificacion_a4(
        p_id IN NUMBER,
        p_error IN NUMBER,
        p_descripcion IN VARCHAR2,
        p_correoResponsable IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO Notificaciones (id, error, descripcion, correoResponsable, fechaHora)
        VALUES (p_id, p_error, p_descripcion, TEmailInstitucional(p_correoResponsable), SYSDATE);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END notificacion_a4;

    -- NOTIFICACION: Modificar
    PROCEDURE notificacion_m0(
        p_id IN NUMBER,
        p_columna IN VARCHAR2,
        p_nuevo_valor IN VARCHAR2
    ) AS
        v_sql VARCHAR2(1000);
    BEGIN
        IF p_columna = 'correoResponsable' THEN
            UPDATE Notificaciones SET correoResponsable = TEmailInstitucional(p_nuevo_valor) WHERE id = p_id;
        ELSE
            v_sql := 'UPDATE Notificaciones SET ' || p_columna || ' = :1 WHERE id = :2';
            EXECUTE IMMEDIATE v_sql USING p_nuevo_valor, p_id;
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END notificacion_m0;

    -- NOTIFICACION: Eliminar
    PROCEDURE notificacion_e1(p_id IN NUMBER) AS
    BEGIN
        DELETE FROM Notificaciones WHERE id = p_id;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END notificacion_e1;

    -- NOTIFICACION: Consultar
    PROCEDURE notificacion_print_co AS
        CURSOR c_notificaciones IS SELECT * FROM Notificaciones;
    BEGIN
        FOR rec IN c_notificaciones LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id || ', Error: ' || rec.error || ', Descripción: ' || rec.descripcion);
        END LOOP;
    END notificacion_print_co;

END PA_JUNTA;


-- =============================================
-- CREACIÓN DE ROLES Y ASIGNACIÓN DE PERMISOS
-- =============================================

-- Creación de roles
CREATE ROLE ROL_USUARIO_;
CREATE ROLE ROL_JUNTA_;

-- Otorgar permisos ejecución de paquetes
GRANT EXECUTE ON PA_USUARIO TO ROL_USUARIO_;
GRANT EXECUTE ON PA_JUNTA TO ROL_JUNTA_;

-- Otorgar permisos de selección en tablas necesarias
GRANT SELECT ON Profesionales TO ROL_USUARIO_;
GRANT SELECT ON Competencias TO ROL_USUARIO_;
GRANT SELECT ON Fundaciones TO ROL_USUARIO_;
GRANT SELECT ON Validaciones TO ROL_JUNTA_;
GRANT SELECT ON Errores TO ROL_JUNTA_;
GRANT SELECT ON Notificaciones TO ROL_JUNTA_;

-- Permisos adicionales para operaciones DML
GRANT INSERT, UPDATE, DELETE ON Profesionales TO ROL_USUARIO_;
GRANT INSERT, UPDATE, DELETE ON Competencias TO ROL_USUARIO_;
GRANT INSERT, UPDATE, DELETE ON Fundaciones TO ROL_USUARIO_;
GRANT INSERT, UPDATE, DELETE ON Validaciones TO ROL_JUNTA_;
GRANT INSERT, UPDATE, DELETE ON Errores TO ROL_JUNTA_;
GRANT INSERT, UPDATE, DELETE ON Notificaciones TO ROL_JUNTA_;


SET ROLE ROL_USUARIO_;


--------LAB 06 -----------------------------------------------------------------------------------------------------------
<?xml version="1.0" encoding="UTF-8"?>
<EstadoSistema>
    <UsoCPU unidad="porcentaje">75.3</UsoCPU>
    <UsuariosConectados>142</UsuariosConectados>
    <ProcesosActivos>
        <Proceso id="1" nombre="ValidacionService" prioridad="alta"/>
        <Proceso id="2" nombre="NotificationService" prioridad="media"/>
        <Proceso id="3" nombre="DataSync" prioridad="baja"/>
    </ProcesosActivos>
    <NivelCarga estado="moderado">
        <Descripcion>Sistema operando con carga moderada</Descripcion>
        <Porcentaje>68</Porcentaje>
    </NivelCarga>
    <FechaHoraRegistro>2024-12-04T15:30:00</FechaHoraRegistro>
</EstadoSistema>
------DTD Correspondiente

<!DOCTYPE EstadoSistema [
    <!ELEMENT EstadoSistema (UsoCPU, UsuariosConectados, ProcesosActivos, NivelCarga, FechaHoraRegistro)>
    
    <!ELEMENT UsoCPU (#PCDATA)>
    <!ATTLIST UsoCPU unidad CDATA #REQUIRED>
    
    <!ELEMENT UsuariosConectados (#PCDATA)>
    
    <!ELEMENT ProcesosActivos (Proceso+)>
    
    <!ELEMENT Proceso EMPTY>
    <!ATTLIST Proceso 
        id CDATA #REQUIRED
        nombre CDATA #REQUIRED
        prioridad (alta|media|baja) #REQUIRED>
    
    <!ELEMENT NivelCarga (Descripcion, Porcentaje)>
    <!ATTLIST NivelCarga estado (bajo|moderado|alto|critico) #REQUIRED>
    
    <!ELEMENT Descripcion (#PCDATA)>
    <!ELEMENT Porcentaje (#PCDATA)>
    <!ELEMENT FechaHoraRegistro (#PCDATA)>
]>


-- Primero eliminamos la tabla existente si hay conflictos
DROP TABLE ErroresCriticos CASCADE CONSTRAINTS;

-- Recreamos la tabla con el nuevo campo estadoSistema
CREATE TABLE ErroresCriticos (
    id NUMBER(6) NOT NULL,
    estado TArchivoXML NOT NULL,
    estadoSistema XMLTYPE NULL,
    CONSTRAINT pk_erroresCriticos PRIMARY KEY (id),
    CONSTRAINT fk_erroresCriticos_errores FOREIGN KEY (id) 
        REFERENCES Errores(id) ON DELETE CASCADE
);

---Poblar ok----
-- Caso 1: Error crítico con estado del sistema - Carga Alta
INSERT INTO ErroresCriticos (id, estado, estadoSistema)
VALUES (
    10,
    TArchivoXML('error_10.xml'),
    XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <EstadoSistema>
        <UsoCPU unidad="porcentaje">92.5</UsoCPU>
        <UsuariosConectados>245</UsuariosConectados>
        <ProcesosActivos>
            <Proceso id="1" nombre="ValidacionService" prioridad="alta"/>
            <Proceso id="2" nombre="NotificationService" prioridad="alta"/>
            <Proceso id="3" nombre="DataSync" prioridad="media"/>
        </ProcesosActivos>
        <NivelCarga estado="alto">
            <Descripcion>Sistema operando con carga alta</Descripcion>
            <Porcentaje>92</Porcentaje>
        </NivelCarga>
        <FechaHoraRegistro>2024-12-04T15:30:00</FechaHoraRegistro>
    </EstadoSistema>')
);

-- Caso 2: Error crítico con carga moderada
INSERT INTO ErroresCriticos (id, estado, estadoSistema)
VALUES (
    20,
    TArchivoXML('error_20.xml'),
    XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <EstadoSistema>
        <UsoCPU unidad="porcentaje">65.8</UsoCPU>
        <UsuariosConectados>158</UsuariosConectados>
        <ProcesosActivos>
            <Proceso id="1" nombre="ValidacionService" prioridad="media"/>
            <Proceso id="2" nombre="NotificationService" prioridad="baja"/>
        </ProcesosActivos>
        <NivelCarga estado="moderado">
            <Descripcion>Sistema operando normalmente</Descripcion>
            <Porcentaje>65</Porcentaje>
        </NivelCarga>
        <FechaHoraRegistro>2024-12-04T16:15:00</FechaHoraRegistro>
    </EstadoSistema>')
);

-- Caso 3: Error crítico con carga baja
INSERT INTO ErroresCriticos (id, estado, estadoSistema)
VALUES (
    30,
    TArchivoXML('error_30.xml'),
    XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <EstadoSistema>
        <UsoCPU unidad="porcentaje">35.2</UsoCPU>
        <UsuariosConectados>78</UsuariosConectados>
        <ProcesosActivos>
            <Proceso id="1" nombre="ValidacionService" prioridad="baja"/>
            <Proceso id="2" nombre="DataSync" prioridad="baja"/>
        </ProcesosActivos>
        <NivelCarga estado="bajo">
            <Descripcion>Sistema con carga baja</Descripcion>
            <Porcentaje>35</Porcentaje>
        </NivelCarga>
        <FechaHoraRegistro>2024-12-04T17:00:00</FechaHoraRegistro>
    </EstadoSistema>')
);

COMMIT;

---PoblarNoOk
-- Caso 1: XML mal formado (falta etiqueta de cierre)
INSERT INTO ErroresCriticos (id, estado, estadoSistema)
VALUES (
    40,
    TArchivoXML('error_40.xml'),
    XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <EstadoSistema>
        <UsoCPU unidad="porcentaje">75.3
        <UsuariosConectados>142</UsuariosConectados>
    </EstadoSistema>')
);
-- Error esperado: XML no válido

-- Caso 2: Estructura incorrecta (elemento no definido en DTD)
INSERT INTO ErroresCriticos (id, estado, estadoSistema)
VALUES (
    50,
    TArchivoXML('error_50.xml'),
    XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <EstadoSistema>
        <ElementoInvalido>Dato incorrecto</ElementoInvalido>
    </EstadoSistema>')
);
-- Error esperado: Estructura no coincide con la definida

-- Caso 3: Valor de atributo inválido (prioridad no permitida)
INSERT INTO ErroresCriticos (id, estado, estadoSistema)
VALUES (
    60,
    TArchivoXML('error_60.xml'),
    XMLTYPE('<?xml version="1.0" encoding="UTF-8"?>
    <EstadoSistema>
        <UsoCPU unidad="porcentaje">75.3</UsoCPU>
        <UsuariosConectados>142</UsuariosConectados>
        <ProcesosActivos>
            <Proceso id="1" nombre="Test" prioridad="urgente"/>
        </ProcesosActivos>
        <NivelCarga estado="moderado">
            <Descripcion>Test</Descripcion>
            <Porcentaje>68</Porcentaje>
        </NivelCarga>
        <FechaHoraRegistro>2024-12-04T15:30:00</FechaHoraRegistro>
    </EstadoSistema>')
);
-- Error esperado: Prioridad "urgente" no está definida en el DTD


-- Consulta: Usuarios que más generan errores en la plataforma
SELECT 
    e.responsable.actor AS Usuario,
    COUNT(*) AS TotalErrores,
    e.causadoPor.por AS TipoOperacion,
    s.NivelCarga AS NivelCargaSistema,
    COUNT(CASE WHEN e.severidad.severidad = 'CRITICO' THEN 1 END) AS ErroresCriticos,
    COUNT(CASE WHEN e.severidad.severidad = 'ADVERTENCIA' THEN 1 END) AS ErroresAdvertencia,
    COUNT(CASE WHEN e.severidad.severidad = 'INFORMATIVO' THEN 1 END) AS ErroresInformativos,
    ROUND(
        (COUNT(CASE WHEN e.severidad.severidad = 'CRITICO' THEN 1 END) * 100.0) / 
        NULLIF(COUNT(*), 0), 
        2
    ) AS PorcentajeCriticos
FROM Errores e
LEFT JOIN ErroresCriticos ec ON e.id = ec.id
LEFT JOIN XMLTABLE(
    '/EstadoSistema'
    PASSING ec.estadoSistema
    COLUMNS
        UsoCPU NUMBER PATH 'UsoCPU',
        UsuariosConectados NUMBER PATH 'UsuariosConectados',
        NivelCarga VARCHAR2(20) PATH 'NivelCarga/@estado',
        CantidadEvidencias NUMBER PATH 'count(ProcesosActivos/Proceso)'
) s ON 1=1
WHERE e.fechaHora >= ADD_MONTHS(SYSDATE, -1)
GROUP BY e.responsable.actor, e.causadoPor.por, s.NivelCarga
HAVING COUNT(*) >= 3
ORDER BY TotalErrores DESC, PorcentajeCriticos DESC;

--4. Proponer otra consulta: Obtener detalles de errores críticos con estado del sistema donde la carga es alta o moderada, ordenados por nivel de carga y usuarios conectados.
SELECT
    ec.id AS ID_ErrorCritico,
    ec.estado.archivo AS NombreArchivoEstado,
    s.NivelCarga,
    s.UsoCPU,
    s.UsuariosConectados,
    s.FechaRegistro
FROM
    ErroresCriticos ec,
    XMLTABLE(
        '/EstadoSistema'
        PASSING ec.estadoSistema
        COLUMNS
            NivelCarga VARCHAR2(20) PATH 'NivelCarga/@estado',
            UsoCPU     NUMBER(5, 2) PATH 'UsoCPU',
            UsuariosConectados NUMBER PATH 'UsuariosConectados',
            FechaRegistro      VARCHAR2(50) PATH 'FechaHoraRegistro'
    ) s
WHERE
    s.NivelCarga IN ('alto', 'moderado')
ORDER BY
    s.NivelCarga DESC, s.UsuariosConectados DESC;

--5. Extender info del atributo y nueva consulta
--Nuevo DTD
<!DOCTYPE EstadoSistema [
    <!ELEMENT EstadoSistema (UsoCPU, UsuariosConectados, ProcesosActivos, NivelCarga, FechaHoraRegistro)>
    
    <!ELEMENT UsoCPU (#PCDATA)>
    <!ATTLIST UsoCPU unidad CDATA #REQUIRED>
    
    <!ELEMENT UsuariosConectados (#PCDATA)>
    
    <!ELEMENT ProcesosActivos (Proceso+)>
    
    <!ELEMENT Proceso EMPTY>
    <!ATTLIST Proceso 
        id CDATA #REQUIRED
        nombre CDATA #REQUIRED
        prioridad (alta|media|baja) #REQUIRED>
        memoria_KB CDATA #IMPLIED> --este es el nuevo atributo
    
    <!ELEMENT NivelCarga (Descripcion, Porcentaje)>
    <!ATTLIST NivelCarga estado (bajo|moderado|alto|critico) #REQUIRED>
    
    <!ELEMENT Descripcion (#PCDATA)>
    <!ELEMENT Porcentaje (#PCDATA)>
    <!ELEMENT FechaHoraRegistro (#PCDATA)>
]>

--Nueva consulta:consultar procesos activos con prioridad alta y mostrar su uso de memoria, ordenados por uso de memoria descendente.
SELECT
    ec.id AS ID_ErrorCritico,
    ec.estado.archivo AS NombreArchivoEstado,
    p.NombreProceso,
    p.Prioridad,
    p.MemoriaKB
FROM
    ErroresCriticos ec,
    XMLTABLE(
        '/EstadoSistema/ProcesosActivos/Proceso'
        PASSING ec.estadoSistema
        COLUMNS
            NombreProceso VARCHAR2(50) PATH '@nombre',
            Prioridad     VARCHAR2(10) PATH '@prioridad',
            MemoriaKB     NUMBER       PATH '@memoria_KB'
    ) p
WHERE
    p.Prioridad = 'alta'
ORDER BY
    ec.id, p.MemoriaKB DESC;