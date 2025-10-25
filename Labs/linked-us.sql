/* ===========================================================
   CICLO 1: Tablas (crear tablas)
   =========================================================== */

CREATE DOMAIN TCorreo AS VARCHAR2(100);
CREATE DOMAIN TNombre AS VARCHAR2(50);
CREATE DOMAIN TPais AS VARCHAR2(10);
CREATE DOMAIN TCadena100 AS VARCHAR2(100);
CREATE DOMAIN TCadena50 AS VARCHAR2(50);
CREATE DOMAIN TCadena20 AS VARCHAR2(20);
CREATE DOMAIN TCadena10 AS VARCHAR2(10);
CREATE DOMAIN TUrl AS VARCHAR2(200);

CREATE DOMAIN TSeveridad AS VARCHAR2(10)
  CONSTRAINT dm_tseveridad_chk CHECK (UPPER(VALUE) IN ('BAJA','MEDIA','ALTA','CRITICA'));

CREATE DOMAIN TGranConcepto AS VARCHAR2(30)
  CONSTRAINT dm_tgranconcepto_chk CHECK (UPPER(VALUE) IN ('HARDWARE','SOFTWARE','NETWORK','USUARIO','OTRO'));

CREATE DOMAIN TTamano AS VARCHAR2(10)
  CONSTRAINT dm_ttamano_chk CHECK (VALUE IS NULL OR VALUE IN ('Pequeña','Mediana','Grande'));

CREATE DOMAIN TTipoEvidencia AS VARCHAR2(20)
  CONSTRAINT dm_ttipo_chk CHECK (VALUE IS NULL OR UPPER(VALUE) IN ('CAPTURA','LOG','DOCUMENTO','IMAGE','CAPTURE','AUTO'));

CREATE DOMAIN TA_o AS NUMBER(4)
  CONSTRAINT dm_tanio_chk CHECK (VALUE IS NULL OR (VALUE BETWEEN 1900 AND 2100));

CREATE DOMAIN TEntero5 AS NUMBER(5)
  CONSTRAINT dm_tentero5_chk CHECK (VALUE IS NULL OR (VALUE >= 0 AND VALUE < 100000));

CREATE DOMAIN TEstadoValidacion AS VARCHAR2(20)
  CONSTRAINT dm_testado_chk CHECK (VALUE IS NULL OR UPPER(VALUE) IN ('PENDIENTE','APROBADA','RECHAZADA'));

CREATE DOMAIN TCategoriaLogro AS VARCHAR2(30);

CREATE TABLE Notificacion (
  identificador NUMBER,
  descripcion TCadena100,
  correo TCorreo,
  fechaHora TIMESTAMP
);

CREATE TABLE "Error" (
  identificador NUMBER(6),
  mensaje TCadena100,
  fechaHora TIMESTAMP,
  responsable TCadena50,
  severidad TSeveridad,
  origen TGranConcepto,
  causadoPor TCadena50
);

CREATE TABLE ErrorCritico (
  identificador NUMBER(6),
  estado CLOB
);

CREATE TABLE Evidencia (
  identificador NUMBER(6),
  tipo TTipoEvidencia,
  ruta TCadena100,
  fecha DATE
);

CREATE TABLE Validacion (
  numero NUMBER,
  fecha DATE,
  justificacion VARCHAR2(4000),
  evidencias VARCHAR2(2000),
  estado TEstadoValidacion,
  id_error NUMBER(6)
);

CREATE TABLE Perfil (
  correo TCorreo,
  nombre TNombre,
  pais TPais
);

CREATE TABLE Profesional (
  correo TCorreo,
  resumen VARCHAR2(50)
);

CREATE TABLE Fundacion (
  correo TCorreo,
  tama_o TTamano,
  propuesta TUrl,
  ciudad TCadena10,
  a_o TA_o,
  id_sector NUMBER
);

CREATE TABLE Logro (
  id_logro NUMBER,
  categoria TCategoriaLogro,
  nombre TCadena20,
  fecha DATE,
  editorial TCadena10,
  correo_profesional TCorreo
);

CREATE TABLE Sector (
  id_sector NUMBER,
  nombre TCadena10
);

CREATE TABLE Competencia (
  codigo NUMBER,
  nombre TCadena10,
  id_sector NUMBER
);

CREATE TABLE Actua (
  id_actua NUMBER,
  correo_fundacion TCorreo,
  id_sector NUMBER,
  numProyectos TEntero5
);

/* ===========================================================
   CICLO 1: XTablas (borrar tablas)
   =========================================================== */

-- DROP TABLE Actua CASCADE CONSTRAINTS;
-- DROP TABLE Competencia CASCADE CONSTRAINTS;
-- DROP TABLE Sector CASCADE CONSTRAINTS;
-- DROP TABLE Logro CASCADE CONSTRAINTS;
-- DROP TABLE Fundacion CASCADE CONSTRAINTS;
-- DROP TABLE Profesional CASCADE CONSTRAINTS;
-- DROP TABLE Perfil CASCADE CONSTRAINTS;
-- DROP TABLE Validacion CASCADE CONSTRAINTS;
-- DROP TABLE Evidencia CASCADE CONSTRAINTS;
-- DROP TABLE ErrorCritico CASCADE CONSTRAINTS;
-- DROP TABLE "Error" CASCADE CONSTRAINTS;
-- DROP TABLE Notificacion CASCADE CONSTRAINTS;

/* ===========================================================
   CICLO 1: Primarias
   =========================================================== */

ALTER TABLE Notificacion ADD CONSTRAINT pk_notificacion PRIMARY KEY (identificador);
ALTER TABLE "Error" ADD CONSTRAINT pk_error PRIMARY KEY (identificador);
ALTER TABLE ErrorCritico ADD CONSTRAINT pk_errorcritico PRIMARY KEY (identificador);
ALTER TABLE Evidencia ADD CONSTRAINT pk_evidencia PRIMARY KEY (identificador);
ALTER TABLE Validacion ADD CONSTRAINT pk_validacion PRIMARY KEY (numero);
ALTER TABLE Perfil ADD CONSTRAINT pk_perfil PRIMARY KEY (correo);
ALTER TABLE Profesional ADD CONSTRAINT pk_profesional PRIMARY KEY (correo);
ALTER TABLE Fundacion ADD CONSTRAINT pk_fundacion PRIMARY KEY (correo);
ALTER TABLE Logro ADD CONSTRAINT pk_logro PRIMARY KEY (id_logro);
ALTER TABLE Sector ADD CONSTRAINT pk_sector PRIMARY KEY (id_sector);
ALTER TABLE Competencia ADD CONSTRAINT pk_competencia PRIMARY KEY (codigo);
ALTER TABLE Actua ADD CONSTRAINT pk_actua PRIMARY KEY (id_actua);

/* ===========================================================
   CICLO 1: Únicas
   =========================================================== */

ALTER TABLE Notificacion ADD CONSTRAINT uq_notif_descr_fecha UNIQUE (descripcion, fechaHora);
ALTER TABLE Evidencia ADD CONSTRAINT uq_evidencia_ruta UNIQUE (ruta);
ALTER TABLE Sector ADD CONSTRAINT uq_sector_nombre UNIQUE (nombre);
ALTER TABLE Competencia ADD CONSTRAINT uq_competencia_sector UNIQUE (nombre, id_sector);

/* ===========================================================
   CICLO 1: Atributos
   =========================================================== */

ALTER TABLE Perfil ADD CONSTRAINT chk_perfil_correo_format CHECK (correo IS NULL OR INSTR(correo,'@')>1);
ALTER TABLE Notificacion MODIFY (descripcion NOT NULL);
ALTER TABLE "Error" MODIFY (mensaje NOT NULL);
ALTER TABLE "Error" MODIFY (fechaHora NOT NULL);
ALTER TABLE Validacion ADD CONSTRAINT chk_validacion_estado_len CHECK (estado IS NULL OR LENGTH(estado) <= 20);
ALTER TABLE Evidencia MODIFY (ruta NOT NULL);
ALTER TABLE Fundacion MODIFY (ciudad NOT NULL);
ALTER TABLE Logro MODIFY (correo_profesional NOT NULL);
ALTER TABLE Competencia MODIFY (id_sector NOT NULL);
ALTER TABLE Actua ADD CONSTRAINT chk_actua_numProyectos CHECK (numProyectos IS NULL OR numProyectos >= 0);

/* ===========================================================
   CICLO 1: Foráneas
   =========================================================== */

ALTER TABLE ErrorCritico ADD CONSTRAINT fk_errorcritico_error FOREIGN KEY (identificador) REFERENCES "Error"(identificador) ON DELETE CASCADE;
ALTER TABLE Evidencia ADD CONSTRAINT fk_evidencia_error FOREIGN KEY (identificador) REFERENCES "Error"(identificador) ON DELETE CASCADE;
ALTER TABLE Validacion ADD CONSTRAINT fk_validacion_error FOREIGN KEY (id_error) REFERENCES "Error"(identificador) ON DELETE SET NULL;
ALTER TABLE Profesional ADD CONSTRAINT fk_prof_perfil FOREIGN KEY (correo) REFERENCES Perfil(correo) ON DELETE CASCADE;
ALTER TABLE Fundacion ADD CONSTRAINT fk_fund_perfil FOREIGN KEY (correo) REFERENCES Perfil(correo) ON DELETE CASCADE;
ALTER TABLE Logro ADD CONSTRAINT fk_logro_prof FOREIGN KEY (correo_profesional) REFERENCES Profesional(correo) ON DELETE CASCADE;
ALTER TABLE Fundacion ADD CONSTRAINT fk_fund_sector FOREIGN KEY (id_sector) REFERENCES Sector(id_sector) ON DELETE SET NULL;
ALTER TABLE Competencia ADD CONSTRAINT fk_comp_sector FOREIGN KEY (id_sector) REFERENCES Sector(id_sector) ON DELETE CASCADE;
ALTER TABLE Actua ADD CONSTRAINT fk_actua_fundacion FOREIGN KEY (correo_fundacion) REFERENCES Fundacion(correo) ON DELETE CASCADE;
ALTER TABLE Actua ADD CONSTRAINT fk_actua_sector FOREIGN KEY (id_sector) REFERENCES Sector(id_sector) ON DELETE CASCADE;

/* ===========================================================
   CICLO 1: PoblarOK
   =========================================================== */

INSERT INTO Notificacion VALUES (1,'Revisión inicial','admin@uni.edu',TO_TIMESTAMP('2025-10-01 08:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (2,'Alerta por error crítico','soporte@uni.edu',TO_TIMESTAMP('2025-10-02 14:30:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (3,'Seguimiento validación','validador@uni.edu',TO_TIMESTAMP('2025-10-03 09:45:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (4,'Aviso mantenimiento','admin@uni.edu',TO_TIMESTAMP('2025-10-05 09:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (5,'Informe diario','reportes@uni.edu',TO_TIMESTAMP('2025-10-07 08:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (6,'Recordatorio reunión','admin@uni.edu',TO_TIMESTAMP('2025-10-08 15:20:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (7,'Actualización completada','soporte@uni.edu',TO_TIMESTAMP('2025-10-08 11:45:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (8,'Tarea asignada','admin@uni.edu',TO_TIMESTAMP('2025-10-09 09:30:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (9,'Control periódico','control@uni.edu',TO_TIMESTAMP('2025-10-07 12:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Notificacion VALUES (10,'Actualización de datos','soporte@uni.edu',TO_TIMESTAMP('2025-10-10 10:00:00','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Perfil VALUES ('ana@uni.edu','Ana Torres','Colombia');
INSERT INTO Perfil VALUES ('juan@uni.edu','Juan Pérez','México');
INSERT INTO Perfil VALUES ('luis@uni.edu','Luis García','España');
INSERT INTO Perfil VALUES ('maria@uni.edu','Maria Lopez','Colombia');
INSERT INTO Perfil VALUES ('carlos@uni.edu','Carlos Diaz','Colombia');
INSERT INTO Perfil VALUES ('sofia@uni.edu','Sofía Rojas','Chile');
INSERT INTO Perfil VALUES ('pedro@uni.edu','Pedro Sánchez','Argentina');
INSERT INTO Perfil VALUES ('laura@uni.edu','Laura Gómez','Perú');
INSERT INTO Perfil VALUES ('andres@uni.edu','Andrés Castro','Ecuador');
INSERT INTO Perfil VALUES ('valentina@uni.edu','Valentina Ruiz','Colombia');
INSERT INTO Perfil VALUES ('felipe@uni.edu','Felipe Morales','Uruguay');
INSERT INTO Perfil VALUES ('camila@uni.edu','Camila Torres','Bolivia');
INSERT INTO Perfil VALUES ('mateo@uni.edu','Mateo Herrera','España');

INSERT INTO Profesional VALUES ('ana@uni.edu','Experto en gestión de proyectos');
INSERT INTO Profesional VALUES ('juan@uni.edu','Investigador en IA');
INSERT INTO Profesional VALUES ('maria@uni.edu','Desarrolladora backend');
INSERT INTO Profesional VALUES ('carlos@uni.edu','Especialista en redes');
INSERT INTO Profesional VALUES ('sofia@uni.edu','Investigadora biomédica');
INSERT INTO Profesional VALUES ('pedro@uni.edu','Administrador sistemas');
INSERT INTO Profesional VALUES ('laura@uni.edu','Coordinadora proyectos');
INSERT INTO Profesional VALUES ('andres@uni.edu','Analista de datos');
INSERT INTO Profesional VALUES ('valentina@uni.edu','Diseñadora UX');
INSERT INTO Profesional VALUES ('felipe@uni.edu','DevOps engineer');
INSERT INTO Profesional VALUES ('camila@uni.edu','QA tester');
INSERT INTO Profesional VALUES ('mateo@uni.edu','Arquitecto SW');

INSERT INTO Perfil VALUES ('fund1@org.org','Fundacion Uno','Colombia');
INSERT INTO Fundacion VALUES ('fund1@org.org','Mediana','http://fund1.org','Bogota',2005,1);
INSERT INTO Perfil VALUES ('fund2@org.org','Fundacion Dos','Colombia');
INSERT INTO Fundacion VALUES ('fund2@org.org','Pequeña','http://fund2.org','Medellin',2010,2);
INSERT INTO Perfil VALUES ('fund3@org.org','Fundacion Tres','Colombia');
INSERT INTO Fundacion VALUES ('fund3@org.org','Grande','http://fund3.org','Cali',1998,3);
INSERT INTO Perfil VALUES ('fund4@org.org','Fundacion Cuatro','Colombia');
INSERT INTO Fundacion VALUES ('fund4@org.org','Pequeña','http://fund4.org','Pereira',2012,1);
INSERT INTO Perfil VALUES ('fund5@org.org','Fundacion Cinco','Colombia');
INSERT INTO Fundacion VALUES ('fund5@org.org','Mediana','http://fund5.org','Barranquilla',2008,2);
INSERT INTO Perfil VALUES ('fund6@org.org','Fundacion Seis','Colombia');
INSERT INTO Fundacion VALUES ('fund6@org.org','Grande','http://fund6.org','Bucaramanga',2000,3);

INSERT INTO Sector VALUES (1,'TECNO');
INSERT INTO Sector VALUES (2,'SALUD');
INSERT INTO Sector VALUES (3,'EDU');

INSERT INTO Competencia VALUES (10,'PROGRAM',1);
INSERT INTO Competencia VALUES (11,'REDES',1);
INSERT INTO Competencia VALUES (12,'BIOMED',2);
INSERT INTO Competencia VALUES (13,'LIDER',3);
INSERT INTO Competencia VALUES (14,'INVEST',2);
INSERT INTO Competencia VALUES (15,'UX',1);

INSERT INTO Logro VALUES (1,'Publicación','Artículo X',TO_DATE('2025-01-20','YYYY-MM-DD'),'Elsevier','ana@uni.edu');
INSERT INTO Logro VALUES (2,'Premio','Premio innovación',TO_DATE('2025-03-15','YYYY-MM-DD'),'Ministerio','juan@uni.edu');
INSERT INTO Logro VALUES (3,'Proyecto','Sistema validar',TO_DATE('2025-04-10','YYYY-MM-DD'),'Uni','maria@uni.edu');
INSERT INTO Logro VALUES (4,'Publicación','Paper Y',TO_DATE('2024-11-05','YYYY-MM-DD'),'ACM','carlos@uni.edu');
INSERT INTO Logro VALUES (5,'Premio','Reconocimiento Z',TO_DATE('2023-09-12','YYYY-MM-DD'),'Universidad','sofia@uni.edu');

INSERT INTO "Error" VALUES (1001,'Error de conexión',SYSTIMESTAMP,'Sistema','ALTA','SOFTWARE','ModuloA');
INSERT INTO "Error" VALUES (1002,'Validación fallida',SYSTIMESTAMP-1,'Usuario','MEDIA','USUARIO','FormularioX');
INSERT INTO "Error" VALUES (1003,'Dato inconsistente',SYSTIMESTAMP-2,'BaseDatos','BAJA','HARDWARE','Disco1');
INSERT INTO "Error" VALUES (1004,'Timeout en servidor',SYSTIMESTAMP,'soporte','ALTA','SOFTWARE','Srv1');
INSERT INTO "Error" VALUES (1005,'Datos incompletos',SYSTIMESTAMP,'usuario','MEDIA','USUARIO','Form1');
INSERT INTO "Error" VALUES (1006,'Error API',SYSTIMESTAMP,'sist','ALTA','SOFTWARE','API1');

INSERT INTO Evidencia VALUES (1001,'LOG','/evidencias/error1001.log',TO_DATE('2025-10-01','YYYY-MM-DD'));
INSERT INTO Evidencia VALUES (1002,'CAPTURA','/evidencias/err1002.png',TO_DATE('2025-10-02','YYYY-MM-DD'));
INSERT INTO Evidencia VALUES (1003,'DOCUMENTO','/evidencias/doc1003.pdf',TO_DATE('2025-10-03','YYYY-MM-DD'));
INSERT INTO Evidencia VALUES (1004,'LOG','/evidencias/error1004.log',TO_DATE('2025-10-04','YYYY-MM-DD'));
INSERT INTO Evidencia VALUES (1005,'CAPTURA','/evidencias/error1005.png',TO_DATE('2025-10-05','YYYY-MM-DD'));
INSERT INTO Evidencia VALUES (1006,'DOCUMENTO','/evidencias/error1006.pdf',TO_DATE('2025-10-06','YYYY-MM-DD'));

INSERT INTO ErrorCritico VALUES (1001,'<estado><nivel>critico</nivel></estado>');
INSERT INTO ErrorCritico VALUES (1004,'<estado><nivel>critico</nivel></estado>');

INSERT INTO Validacion VALUES (201,TO_DATE('2025-10-05','YYYY-MM-DD'),'Prueba inicial','1001','PENDIENTE',1001);
INSERT INTO Validacion VALUES (202,TO_DATE('2025-10-06','YYYY-MM-DD'),'Revision manual','1002','APROBADA',1002);
INSERT INTO Validacion VALUES (203,TO_DATE('2025-10-07','YYYY-MM-DD'),'Control calidad','1003','RECHAZADA',1003);
INSERT INTO Validacion VALUES (204,TO_DATE('2025-10-08','YYYY-MM-DD'),'Auditoria','1004','PENDIENTE',1004);
INSERT INTO Validacion VALUES (205,TO_DATE('2025-10-09','YYYY-MM-DD'),'Seguimiento','1005','APROBADA',1005);

INSERT INTO Actua VALUES (301,'fund1@org.org',1,5);
INSERT INTO Actua VALUES (302,'fund2@org.org',2,3);
INSERT INTO Actua VALUES (303,'fund3@org.org',3,7);
INSERT INTO Actua VALUES (304,'fund4@org.org',1,2);
INSERT INTO Actua VALUES (305,'fund5@org.org',2,4);
INSERT INTO Actua VALUES (306,'fund6@org.org',3,6);

/* ===========================================================
   CICLO 1: PoblarNoOK (que NO se permiten)
   =========================================================== */

-- INSERT INTO Evidencia VALUES (4001,'LOG',NULL,TO_DATE('2025-10-10','YYYY-MM-DD'));
-- INSERT INTO Profesional VALUES ('noexiste@uni.edu','Resumen X');
-- INSERT INTO Competencia VALUES (999,'NO_SECTOR',999);

/* ===========================================================
   CICLO 1: PoblarNoOK (que SÍ se permiten)
   =========================================================== */

-- INSERT INTO Logro VALUES (400,'EXTRA','Logro libre',TO_DATE('2025-09-01','YYYY-MM-DD'),'EdiX',NULL);
-- INSERT INTO Validacion VALUES (300,TO_DATE('2025-01-01','YYYY-MM-DD'),'X','100','EN PROCESO',NULL);
-- INSERT INTO Actua VALUES (400,'fund1@org.org',1,-5);

/* ===========================================================
   CICLO 1: XPoblar
   =========================================================== */

DELETE FROM Actua;
DELETE FROM Logro;
DELETE FROM Competencia;
DELETE FROM Sector;
DELETE FROM Fundacion;
DELETE FROM Profesional;
DELETE FROM Perfil;
DELETE FROM Validacion;
DELETE FROM Evidencia;
DELETE FROM "Error";
DELETE FROM Notificacion;

/* ===========================================================
   CICLO 1: PoblarNoOK (2)
   =========================================================== */

-- INSERT INTO Logro VALUES (9001,'X','SinProf',TO_DATE('2025-01-01','YYYY-MM-DD'),'Edi',NULL);
-- INSERT INTO Validacion VALUES (9002,TO_DATE('2025-01-02','YYYY-MM-DD'),'X','2001','EN_PROCESO',2001);
-- INSERT INTO Actua VALUES (9003,'f100@org.org',10,-10);

/* ===========================================================
   CICLO 1: Consultas
   =========================================================== */

SELECT e.identificador, e.mensaje, e.severidad, e.fechaHora, e.responsable
FROM "Error" e
WHERE UPPER(e.severidad) IN ('CRITICA','ALTA')
ORDER BY e.fechaHora DESC;

SELECT s.nombre AS sector, COUNT(f.correo) AS total_fundaciones, NVL(SUM(a.numProyectos),0) AS total_proyectos
FROM Sector s
LEFT JOIN Fundacion f ON f.id_sector = s.id_sector
LEFT JOIN Actua a ON a.correo_fundacion = f.correo
GROUP BY s.nombre
ORDER BY total_proyectos DESC;

SELECT pr.correo AS profesional_correo, pr.resumen, NVL(SUM(a.numProyectos),0) AS total_proyectos
FROM Profesional pr
LEFT JOIN Logro l ON l.correo_profesional = pr.correo
LEFT JOIN Actua a ON a.correo_fundacion IN (SELECT correo FROM Fundacion)
GROUP BY pr.correo, pr.resumen
ORDER BY total_proyectos DESC;

/* ===========================================================
   CICLO 1: Nuevamente poblando
   =========================================================== */

INSERT INTO Perfil VALUES ('u100@uni.edu','Usr 100','COL');
INSERT INTO Profesional VALUES ('u100@uni.edu','Resumen auto 100');
INSERT INTO Perfil VALUES ('u101@uni.edu','Usr 101','COL');
INSERT INTO Profesional VALUES ('u101@uni.edu','Resumen auto 101');
INSERT INTO Perfil VALUES ('u102@uni.edu','Usr 102','COL');
INSERT INTO Profesional VALUES ('u102@uni.edu','Resumen auto 102');
INSERT INTO Perfil VALUES ('u103@uni.edu','Usr 103','COL');
INSERT INTO Profesional VALUES ('u103@uni.edu','Resumen auto 103');
INSERT INTO Perfil VALUES ('u104@uni.edu','Usr 104','COL');
INSERT INTO Profesional VALUES ('u104@uni.edu','Resumen auto 104');
INSERT INTO Perfil VALUES ('u105@uni.edu','Usr 105','COL');
INSERT INTO Profesional VALUES ('u105@uni.edu','Resumen auto 105');
INSERT INTO Perfil VALUES ('u106@uni.edu','Usr 106','COL');
INSERT INTO Profesional VALUES ('u106@uni.edu','Resumen auto 106');
INSERT INTO Perfil VALUES ('u107@uni.edu','Usr 107','COL');
INSERT INTO Profesional VALUES ('u107@uni.edu','Resumen auto 107');
INSERT INTO Perfil VALUES ('u108@uni.edu','Usr 108','COL');
INSERT INTO Profesional VALUES ('u108@uni.edu','Resumen auto 108');
INSERT INTO Perfil VALUES ('u109@uni.edu','Usr 109','COL');
INSERT INTO Profesional VALUES ('u109@uni.edu','Resumen auto 109');

INSERT INTO Perfil VALUES ('f100@org.org','FundAuto100','COL');
INSERT INTO Fundacion VALUES ('f100@org.org','Pequeña','http://f100.org','Ciudad100',2001,10);
INSERT INTO Perfil VALUES ('f101@org.org','FundAuto101','COL');
INSERT INTO Fundacion VALUES ('f101@org.org','Mediana','http://f101.org','Ciudad101',2002,11);
INSERT INTO Perfil VALUES ('f102@org.org','FundAuto102','COL');
INSERT INTO Fundacion VALUES ('f102@org.org','Grande','http://f102.org','Ciudad102',2003,12);
INSERT INTO Perfil VALUES ('f103@org.org','FundAuto103','COL');
INSERT INTO Fundacion VALUES ('f103@org.org','Pequeña','http://f103.org','Ciudad103',2004,13);
INSERT INTO Perfil VALUES ('f104@org.org','FundAuto104','COL');
INSERT INTO Fundacion VALUES ('f104@org.org','Mediana','http://f104.org','Ciudad104',2005,14);
INSERT INTO Perfil VALUES ('f105@org.org','FundAuto105','COL');
INSERT INTO Fundacion VALUES ('f105@org.org','Grande','http://f105.org','Ciudad105',2006,15);
INSERT INTO Perfil VALUES ('f106@org.org','FundAuto106','COL');
INSERT INTO Fundacion VALUES ('f106@org.org','Pequeña','http://f106.org','Ciudad106',2007,16);
INSERT INTO Perfil VALUES ('f107@org.org','FundAuto107','COL');
INSERT INTO Fundacion VALUES ('f107@org.org','Mediana','http://f107.org','Ciudad107',2008,17);
INSERT INTO Perfil VALUES ('f108@org.org','FundAuto108','COL');
INSERT INTO Fundacion VALUES ('f108@org.org','Grande','http://f108.org','Ciudad108',2009,18);
INSERT INTO Perfil VALUES ('f109@org.org','FundAuto109','COL');
INSERT INTO Fundacion VALUES ('f109@org.org','Pequeña','http://f109.org','Ciudad109',2010,19);

INSERT INTO Sector VALUES (10,'Agricultura');
INSERT INTO Sector VALUES (11,'Ciencia');
INSERT INTO Sector VALUES (12,'Cultura');
INSERT INTO Sector VALUES (13,'Deporte');
INSERT INTO Sector VALUES (14,'Economia');
INSERT INTO Sector VALUES (15,'Energia');
INSERT INTO Sector VALUES (16,'Finanzas');
INSERT INTO Sector VALUES (17,'Infra');
INSERT INTO Sector VALUES (18,'Ambiente');
INSERT INTO Sector VALUES (19,'Turismo');

INSERT INTO Competencia VALUES (100,'COMUNICACION',10);
INSERT INTO Competencia VALUES (101,'RESOLUCION',10);
INSERT INTO Competencia VALUES (102,'EQUIPO',11);
INSERT INTO Competencia VALUES (103,'CRITICO',11);
INSERT INTO Competencia VALUES (104,'INNOVACION',12);
INSERT INTO Competencia VALUES (105,'TIEMPO',12);
INSERT INTO Competencia VALUES (106,'ADAPTABILIDAD',13);
INSERT INTO Competencia VALUES (107,'APRENDIZAJE',13);
INSERT INTO Competencia VALUES (108,'PLANIFICACION',14);
INSERT INTO Competencia VALUES (109,'ANALISIS',14);
INSERT INTO Competencia VALUES (110,'DATA',15);
INSERT INTO Competencia VALUES (111,'UX',15);
INSERT INTO Competencia VALUES (112,'ARCH',16);
INSERT INTO Competencia VALUES (113,'QA',16);
INSERT INTO Competencia VALUES (114,'DEVOPS',17);
INSERT INTO Competencia VALUES (115,'SEC',17);
INSERT INTO Competencia VALUES (116,'REDES',18);
INSERT INTO Competencia VALUES (117,'BIO',18);
INSERT INTO Competencia VALUES (118,'ANALITICA',19);
INSERT INTO Competencia VALUES (119,'GESTION',19);

INSERT INTO "Error" VALUES (2001,'Timeout en servidor',SYSTIMESTAMP,'soporte','ALTA','SOFTWARE','Srv1');
INSERT INTO "Error" VALUES (2002,'Datos incompletos',SYSTIMESTAMP,'usuario','MEDIA','USUARIO','Form1');
INSERT INTO "Error" VALUES (2003,'Error API',SYSTIMESTAMP,'sist','ALTA','SOFTWARE','API1');
INSERT INTO "Error" VALUES (2004,'Permiso denegado',SYSTIMESTAMP,'val','BAJA','USUARIO','Login');
INSERT INTO "Error" VALUES (2005,'Archivo corrupto',SYSTIMESTAMP,'soporte','MEDIA','HARDWARE','Disk2');
INSERT INTO "Error" VALUES (2006,'Validacion duplicada',SYSTIMESTAMP,'admin','BAJA','USUARIO','Form2');
INSERT INTO "Error" VALUES (2007,'Error crit BD',SYSTIMESTAMP,'soporte','ALTA','SOFTWARE','DB1');
INSERT INTO "Error" VALUES (2008,'Operacion invalida',SYSTIMESTAMP,'val','MEDIA','USUARIO','UI1');
INSERT INTO "Error" VALUES (2009,'Fallo backup',SYSTIMESTAMP,'admin','ALTA','HARDWARE','Backup1');
INSERT INTO "Error" VALUES (2010,'Desbordamiento memoria',SYSTIMESTAMP,'sist','ALTA','HARDWARE','ProcX');

INSERT INTO Evidencia VALUES (2001,'LOG','/evid/2001.log',SYSDATE);
INSERT INTO Evidencia VALUES (2002,'CAPTURA','/evid/2002.png',SYSDATE);
INSERT INTO Evidencia VALUES (2003,'DOCUMENTO','/evid/2003.pdf',SYSDATE);
INSERT INTO Evidencia VALUES (2004,'LOG','/evid/2004.log',SYSDATE);
INSERT INTO Evidencia VALUES (2005,'CAPTURA','/evid/2005.png',SYSDATE);
INSERT INTO Evidencia VALUES (2006,'DOCUMENTO','/evid/2006.pdf',SYSDATE);
INSERT INTO Evidencia VALUES (2007,'LOG','/evid/2007.log',SYSDATE);
INSERT INTO Evidencia VALUES (2008,'CAPTURA','/evid/2008.png',SYSDATE);
INSERT INTO Evidencia VALUES (2009,'DOCUMENTO','/evid/2009.pdf',SYSDATE);
INSERT INTO Evidencia VALUES (2010,'LOG','/evid/2010.log',SYSDATE);

INSERT INTO Validacion VALUES (4001,SYSDATE,'Auto 1','2001','PENDIENTE',2001);
INSERT INTO Validacion VALUES (4002,SYSDATE,'Auto 2','2002','APROBADA',2002);
INSERT INTO Validacion VALUES (4003,SYSDATE,'Auto 3','2003','RECHAZADA',2003);
INSERT INTO Validacion VALUES (4004,SYSDATE,'Auto 4','2004','PENDIENTE',2004);
INSERT INTO Validacion VALUES (4005,SYSDATE,'Auto 5','2005','APROBADA',2005);
INSERT INTO Validacion VALUES (4006,SYSDATE,'Auto 6','2006','RECHAZADA',2006);
INSERT INTO Validacion VALUES (4007,SYSDATE,'Auto 7','2007','PENDIENTE',2007);
INSERT INTO Validacion VALUES (4008,SYSDATE,'Auto 8','2008','APROBADA',2008);
INSERT INTO Validacion VALUES (4009,SYSDATE,'Auto 9','2009','RECHAZADA',2009);
INSERT INTO Validacion VALUES (4010,SYSDATE,'Auto 10','2010','PENDIENTE',2010);

INSERT INTO Actua VALUES (5001,'f100@org.org',10,2);
INSERT INTO Actua VALUES (5002,'f101@org.org',11,3);
INSERT INTO Actua VALUES (5003,'f102@org.org',12,4);
INSERT INTO Actua VALUES (5004,'f103@org.org',13,1);
INSERT INTO Actua VALUES (5005,'f104@org.org',14,5);
INSERT INTO Actua VALUES (5006,'f105@org.org',15,2);
INSERT INTO Actua VALUES (5007,'f106@org.org',16,7);
INSERT INTO Actua VALUES (5008,'f107@org.org',17,3);
INSERT INTO Actua VALUES (5009,'f108@org.org',18,4);
INSERT INTO Actua VALUES (5010,'f109@org.org',19,6);

COMMIT;

/* ===========================================================
   Tuplas
   =========================================================== */
-- Insertamos datos de apoyo necesarios: errores que serán validados.
--SYSTIMESTAMP se usa para tener una fecha actual en el momento de la inserción.

INSERT INTO "Error" VALUES (1001, 'Error de conexión', SYSTIMESTAMP, 'soporte', 'MEDIA', 'RED', 'ConexionTimeout');
INSERT INTO "Error" VALUES (1002, 'Falla de login', SYSTIMESTAMP, 'admin', 'ALTA', 'SEGURIDAD', 'LoginError');

/* ===========================================================
   TuplasOK
   =========================================================== */
-- Casos válidos de registro de validaciones

--Caso 1: Validación pendiente, sin justificación aún
INSERT INTO Validacion VALUES (2001, SYSDATE, NULL, 'VAL001', 'PENDIENTE', 1001);

--Caso 2: Validación aprobada con justificación
INSERT INTO Validacion VALUES (2002, SYSDATE, 'Cumple requisitos técnicos', 'VAL002', 'APROBADA', 1002);

/* ===========================================================
   TuplasNoOK
   =========================================================== */
-- Casos incorrectos (violaciones de reglas de negocio o restricciones)

-- Caso 1: Estado no permitido
INSERT INTO Validacion VALUES (2003, SYSDATE, 'Texto', 'VAL003', 'INVALIDO', 1001);

-- aso 2: Código nulo (obligatorio)
INSERT INTO Validacion VALUES (2004, SYSDATE, 'Texto', NULL, 'PENDIENTE', 1001);

/* ===========================================================
   Acciones
   =========================================================== */
-- Acción de referencia: si se elimina un Error, el campo id_error en Validacion pasa a NULL.

-- (Ya definida con ON DELETE SET NULL en la FK)

/* ===========================================================
   AccionesOK
   =========================================================== */
-- la acción ON DELETE SET NULL
DELETE FROM "Error" WHERE identificador = 1001;
-- Ahora, la validación 2001 debe tener id_error = NULL

/* ===========================================================
   Disparadores
   =========================================================== */
-- Reglas adicionales del negocio para “Registrar Validación”:
-- 1. No se puede registrar una validación con fecha futura, ya que esto no tiene nada de sentido.
-- 2. Si la validación es 'APROBADA', debe tener justificación, ya que el propio modelo logico nos lo exige.
-- 3. Para cada caso se debe lanzar un error con un mensaje adecuado si se viola alguna de estas reglas, usando como vimos en clase RAISE_APPLICATION_ERROR.

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

/* ===========================================================
   DisparadoresOK
   =========================================================== */
--Caso 3: Inserción válida con fecha actual y justificación
INSERT INTO Validacion VALUES (2005, SYSDATE, 'Verificación completada', 'VAL005', 'APROBADA', 1002);

--Caso 4: Validación pendiente sin justificación (permitido)
INSERT INTO Validacion VALUES (2006, SYSDATE, NULL, 'VAL006', 'PENDIENTE', 1002);

/* ===========================================================
   DisparadoresNoOK
   =========================================================== */
-- Caso 3: Validación con fecha futura (disparador la bloquea)
INSERT INTO Validacion VALUES (2007, SYSDATE + 5, 'Texto', 'VAL007', 'PENDIENTE', 1002);

-- Caso 4: Validación aprobada sin justificación (disparador la bloquea)
INSERT INTO Validacion VALUES (2008, SYSDATE, NULL, 'VAL008', 'APROBADA', 1002);

/* ===========================================================
   XDisparadores
   =========================================================== */
-- Eliminamos el disparador
DROP TRIGGER trg_registrar_validacion;
