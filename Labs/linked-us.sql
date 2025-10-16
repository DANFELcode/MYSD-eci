/* ===========================
   CICLO 1: PoblarOK (inserciones válidas)
   =========================== */

-- Notificación
INSERT INTO Notificacion (id, descripcion, correoResponsable, fechaHora)
VALUES (1, 'Revisión inicial', 'admin@uni.edu', '2025-10-01 08:00:00');
INSERT INTO Notificacion (id, descripcion, correoResponsable, fechaHora)
VALUES (2, 'Alerta por error crítico', 'soporte@uni.edu', '2025-10-02 14:30:00');
INSERT INTO Notificacion (id, descripcion, correoResponsable, fechaHora)
VALUES (3, 'Seguimiento validación', 'validador@uni.edu', '2025-10-03 09:45:00');

-- Error
INSERT INTO Error (id, mensaje, fechaHora, causadoPor, severidad, origen, responsable, estadoSistema)
VALUES (1, 'Error de conexión', '2025-10-01 08:10:00', 'Sistema', 'Alta', 'Servidor', 'Soporte', 'Activo');
INSERT INTO Error (id, mensaje, fechaHora, causadoPor, severidad, origen, responsable, estadoSistema)
VALUES (2, 'Validación fallida', '2025-10-02 14:40:00', 'Usuario', 'Media', 'Formulario', 'Validador', 'EnProceso');
INSERT INTO Error (id, mensaje, fechaHora, causadoPor, severidad, origen, responsable, estadoSistema)
VALUES (3, 'Dato inconsistente', '2025-10-03 10:00:00', 'BaseDatos', 'Baja', 'Registro', 'Admin', 'Cerrado');

-- Evidencia
INSERT INTO Evidencia (id, tipo, ruta, fecha)
VALUES (1, 'Captura', '/evidencias/error1.png', '2025-10-01');
INSERT INTO Evidencia (id, tipo, ruta, fecha)
VALUES (2, 'Log', '/evidencias/logs2.txt', '2025-10-02');
INSERT INTO Evidencia (id, tipo, ruta, fecha)
VALUES (3, 'Documento', '/evidencias/doc3.pdf', '2025-10-03');

-- Validación
INSERT INTO Validacion (numero, fecha, justificacion, evidencias, estado)
VALUES (101, '2025-10-01', 'Prueba inicial', '1', 'Pendiente');
INSERT INTO Validacion (numero, fecha, justificacion, evidencias, estado)
VALUES (102, '2025-10-02', 'Revisión usuario', '2', 'Aprobada');
INSERT INTO Validacion (numero, fecha, justificacion, evidencias, estado)
VALUES (103, '2025-10-03', 'Control calidad', '3', 'Rechazada');

-- Profesional
INSERT INTO Profesional (id, resumen)
VALUES (1, 'Experto en gestión de proyectos');
INSERT INTO Profesional (id, resumen)
VALUES (2, 'Investigador en inteligencia artificial');
INSERT INTO Profesional (id, resumen)
VALUES (3, 'Desarrollador backend con experiencia en validaciones');

-- Perfil
INSERT INTO Perfil (correo, nombre, pais)
VALUES ('ana@uni.edu', 'Ana Torres', 'Colombia');
INSERT INTO Perfil (correo, nombre, pais)
VALUES ('juan@uni.edu', 'Juan Pérez', 'México');
INSERT INTO Perfil (correo, nombre, pais)
VALUES ('luis@uni.edu', 'Luis García', 'España');

-- Fundación
INSERT INTO Fundacion (id, tamaño, propuesta, ciudad)
VALUES (1, 'Grande', 'Proyectos educativos', 'Bogotá');
INSERT INTO Fundacion (id, tamaño, propuesta, ciudad)
VALUES (2, 'Mediana', 'Investigación médica', 'Madrid');
INSERT INTO Fundacion (id, tamaño, propuesta, ciudad)
VALUES (3, 'Pequeña', 'Innovación tecnológica', 'Ciudad de México');

-- Sector
INSERT INTO Sector (id, nombre)
VALUES (1, 'Educación');
INSERT INTO Sector (id, nombre)
VALUES (2, 'Salud');
INSERT INTO Sector (id, nombre)
VALUES (3, 'Tecnología');

-- Competencia
INSERT INTO Competencia (codigo, nombre)
VALUES (10, 'Liderazgo');
INSERT INTO Competencia (codigo, nombre)
VALUES (11, 'Investigación');
INSERT INTO Competencia (codigo, nombre)
VALUES (12, 'Desarrollo de software');

-- Logro
INSERT INTO Logro (id, categoria, nombre, fecha, editorial)
VALUES (1, 'Publicación', 'Artículo en revista Q1', '2025-01-20', 'Elsevier');
INSERT INTO Logro (id, categoria, nombre, fecha, editorial)
VALUES (2, 'Premio', 'Premio nacional de innovación', '2025-03-15', 'Ministerio de Ciencia');
INSERT INTO Logro (id, categoria, nombre, fecha, editorial)
VALUES (3, 'Proyecto', 'Sistema de gestión de validaciones', '2025-04-10', 'Universidad XYZ');

-- Actua
INSERT INTO Actua (id, numProyectos)
VALUES (1, 5);
INSERT INTO Actua (id, numProyectos)
VALUES (2, 3);
INSERT INTO Actua (id, numProyectos)
VALUES (3, 7);

/* ===========================
   CICLO 1: PoblarNoOK (inserciones inválidas que NO se permiten)
   =========================== */

-- Notificación sin id
INSERT INTO Notificacion (id, descripcion, correoResponsable, fechaHora)
VALUES (NULL, 'Notificación inválida', 'soporte@uni.edu', '2025-10-05 11:00:00');

-- Profesional con id repetido
INSERT INTO Profesional (id, resumen)
VALUES (1, 'Duplicado de experto en proyectos');

-- Validación con evidencia inexistente
INSERT INTO Validacion (numero, fecha, justificacion, evidencias, estado)
VALUES (104, '2025-10-05', 'Validación incorrecta', '999', 'Pendiente');

/* ===========================
   CICLO 1: PoblarNoOK (inserciones inválidas que SÍ se permiten)
   =========================== */

-- Evidencia con ruta vacía
INSERT INTO Evidencia (id, tipo, ruta, fecha)
VALUES (4, 'Captura', '', '2025-10-05');

-- Fundación con tamaño negativo (si fuera numérico)
INSERT INTO Fundacion (id, tamaño, propuesta, ciudad)
VALUES (4, '-10', 'Dato inválido', 'Desconocida');

-- Actua con numProyectos negativo
INSERT INTO Actua (id, numProyectos)
VALUES (4, -5);

/* ===========================
   CICLO 1: XPoblar (borrado ordenado)
   =========================== */

DELETE FROM Actua;
DELETE FROM Logro;
DELETE FROM Competencia;
DELETE FROM Sector;
DELETE FROM Fundacion;
DELETE FROM Perfil;
DELETE FROM Profesional;
DELETE FROM Validacion;
DELETE FROM Evidencia;
DELETE FROM Error;
DELETE FROM Notificacion;

-------------------------------------------------
-- CICLO 1: Atributos
-------------------------------------------------
-- Restricciones para validar rangos, formatos y valores lógicos

-- Atributo: numProyectos no puede ser negativo
ALTER TABLE Actua
ADD CONSTRAINT chk_actua_numProyectos CHECK (numProyectos >= 0);

-- Atributo: correo debe contener un '@'
ALTER TABLE Perfil
ADD CONSTRAINT chk_perfil_correo CHECK (correo LIKE '%@%');

-- Atributo: tamaño de fundación solo puede ser 'Pequeña', 'Mediana', 'Grande'
ALTER TABLE Fundacion
ADD CONSTRAINT chk_fundacion_tamano CHECK (tamano IN ('Pequeña', 'Mediana', 'Grande'));

-------------------------------------------------
-- CICLO 1: Primarias
-------------------------------------------------
-- Ya fueron definidas al crear las tablas, pero se explicitan aquí
ALTER TABLE Notificacion ADD CONSTRAINT pk_notificacion PRIMARY KEY (id);
ALTER TABLE Error ADD CONSTRAINT pk_error PRIMARY KEY (id);
ALTER TABLE Evidencia ADD CONSTRAINT pk_evidencia PRIMARY KEY (id);
ALTER TABLE Validacion ADD CONSTRAINT pk_validacion PRIMARY KEY (numero);
ALTER TABLE Perfil ADD CONSTRAINT pk_perfil PRIMARY KEY (correo);
ALTER TABLE Profesional ADD CONSTRAINT pk_profesional PRIMARY KEY (id_profesional);
ALTER TABLE Fundacion ADD CONSTRAINT pk_fundacion PRIMARY KEY (id_fundacion);
ALTER TABLE Sector ADD CONSTRAINT pk_sector PRIMARY KEY (id_sector);
ALTER TABLE Competencia ADD CONSTRAINT pk_competencia PRIMARY KEY (codigo);
ALTER TABLE Logro ADD CONSTRAINT pk_logro PRIMARY KEY (id_logro);
ALTER TABLE Actua ADD CONSTRAINT pk_actua PRIMARY KEY (id_actua);

-------------------------------------------------
-- CICLO 1: Únicas
-------------------------------------------------
-- Cada sector tiene un nombre único
ALTER TABLE Sector
ADD CONSTRAINT uq_sector_nombre UNIQUE (nombre);

-- Cada competencia tiene un nombre único
ALTER TABLE Competencia
ADD CONSTRAINT uq_competencia_nombre UNIQUE (nombre);

-- El correo del perfil ya es PK, pero reforzamos unicidad explícita
ALTER TABLE Perfil
ADD CONSTRAINT uq_perfil_correo UNIQUE (correo);

-------------------------------------------------
-- CICLO 1: Foráneas
-------------------------------------------------
-- Error -> Notificación
ALTER TABLE Error
ADD CONSTRAINT fk_error_notificacion FOREIGN KEY (id_notificacion) REFERENCES Notificacion(id);

-- Evidencia -> Error
ALTER TABLE Evidencia
ADD CONSTRAINT fk_evidencia_error FOREIGN KEY (id_error) REFERENCES Error(id);

-- Validacion -> Error
ALTER TABLE Validacion
ADD CONSTRAINT fk_validacion_error FOREIGN KEY (id_error) REFERENCES Error(id);

-- Validacion -> Evidencia
ALTER TABLE Validacion
ADD CONSTRAINT fk_validacion_evidencia FOREIGN KEY (id_evidencia) REFERENCES Evidencia(id);

-- Logro -> Profesional
ALTER TABLE Logro
ADD CONSTRAINT fk_logro_profesional FOREIGN KEY (id_profesional) REFERENCES Profesional(id_profesional);

-- Profesional -> Perfil
ALTER TABLE Profesional
ADD CONSTRAINT fk_profesional_perfil FOREIGN KEY (correo) REFERENCES Perfil(correo);

-- Fundacion -> Sector
ALTER TABLE Fundacion
ADD CONSTRAINT fk_fundacion_sector FOREIGN KEY (id_sector) REFERENCES Sector(id_sector);

-- Profesional -> Competencia
ALTER TABLE Profesional
ADD CONSTRAINT fk_profesional_competencia FOREIGN KEY (id_competencia) REFERENCES Competencia(codigo);

-- Actua -> Fundacion
ALTER TABLE Actua
ADD CONSTRAINT fk_actua_fundacion FOREIGN KEY (id_fundacion) REFERENCES Fundacion(id_fundacion);

-------------------------------------------------
-- CICLO 1: PoblarNoOK (2)
-------------------------------------------------
-- Casos del punto anterior (3 inválidos que SÍ se permitían)
-- Ahora con las nuevas restricciones se BLOQUEAN:

-- Caso 1: Insertar evidencia con ruta vacía -> protegido por NOT NULL en ruta
INSERT INTO Evidencia(id, tipo, ruta, fecha) VALUES (100, 'Imagen', '', '2025-01-01');
-- Falla: protegido por NOT NULL + CHECK de longitud mínima

-- Caso 2: Insertar fundación con tamaño inválido
INSERT INTO Fundacion(id_fundacion, tamano, propuesta, ciudad) VALUES (200, 'Gigante', 'Plan X', 'Bogotá');
--  Falla: protegido por chk_fundacion_tamano

-- Caso 3: Insertar Actua con numProyectos negativo
INSERT INTO Actua(id_actua, id_fundacion, numProyectos) VALUES (300, 1, -5);
-- Falla: protegido por chk_actua_numProyectos

-- CICLO 1: Consultar productos más vendidos
SELECT 
    p.id_producto,
    p.nombre,
    SUM(dv.cantidad) AS total_vendido
FROM DetalleVenta dv
INNER JOIN Producto p ON dv.id_producto = p.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY total_vendido DESC;

-- CICLO 1: Consultar clientes con mayor cantidad de compras
SELECT 
    c.id_cliente,
    c.nombre,
    COUNT(v.id_venta) AS numero_compras
FROM Cliente c
INNER JOIN Venta v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY numero_compras DESC;

/* ====================================================
   CICLO 1: Consultar errores más graves
   ==================================================== */
SELECT 
    id,
    mensaje,
    severidad,
    fechaHora,
    responsable
FROM Error
WHERE severidad = 'Alta'
ORDER BY fechaHora DESC;

/* ===========================================================
   CICLO 1: CONSULTANDO
   =========================================================== */

-- CICLO 1: Consultar errores más graves
-- Muestra los errores con severidad 'Alta', priorizando los más recientes.
SELECT 
    id,
    mensaje,
    severidad,
    fechaHora,
    responsable
FROM Error
WHERE severidad = 'Alta'
ORDER BY fechaHora DESC;

-- CICLO 1: Consultar profesionales con más proyectos (Actua)
-- Permite ver qué profesionales están más activos.
SELECT 
    pr.id,
    pf.nombre AS nombre_perfil,
    a.numProyectos,
    f.ciudad
FROM Profesional pr
INNER JOIN Perfil pf ON pr.correo = pf.correo
INNER JOIN Actua a ON a.id = pr.id
INNER JOIN Fundacion f ON a.id = f.id
ORDER BY a.numProyectos DESC;

-- CICLO 1: Consultar fundaciones por sector
-- Indica cuántas fundaciones hay registradas por cada sector.
SELECT 
    s.nombre AS sector,
    COUNT(f.id) AS total_fundaciones
FROM Sector s
LEFT JOIN Fundacion f ON s.id = f.id
GROUP BY s.nombre
ORDER BY total_fundaciones DESC;

/* ===========================================================
   CICLO 1: NUEVAMENTE POBLANDO
   =========================================================== */

-- Inserta 10 nuevos registros por cada gran concepto.
-- Simula la automatización con Mokarro2, validando la integridad de datos.

-- NOTIFICACION
INSERT INTO Notificacion (id, descripcion, correoResponsable, fechaHora)
VALUES 
(10, 'Aviso mantenimiento', 'admin@uni.edu', '2025-10-05 09:00:00'),
(11, 'Validación completada', 'validador@uni.edu', '2025-10-06 10:15:00'),
(12, 'Error menor detectado', 'soporte@uni.edu', '2025-10-06 14:30:00'),
(13, 'Informe diario', 'reportes@uni.edu', '2025-10-07 08:00:00'),
(14, 'Control periódico', 'control@uni.edu', '2025-10-07 12:00:00'),
(15, 'Revisión técnica', 'tecnico@uni.edu', '2025-10-07 13:30:00'),
(16, 'Actualización completada', 'soporte@uni.edu', '2025-10-08 11:45:00'),
(17, 'Recordatorio reunión', 'admin@uni.edu', '2025-10-08 15:20:00'),
(18, 'Error en validación', 'validador@uni.edu', '2025-10-09 08:00:00'),
(19, 'Tarea asignada', 'admin@uni.edu', '2025-10-09 09:30:00');

-- ERROR
INSERT INTO Error (id, mensaje, fechaHora, causadoPor, severidad, origen, responsable, estadoSistema)
VALUES
(10, 'Timeout en servidor', '2025-10-05 09:10:00', 'Sistema', 'Alta', 'Servidor', 'Soporte', 'Activo'),
(11, 'Datos incompletos', '2025-10-06 11:00:00', 'Usuario', 'Media', 'Formulario', 'Validador', 'EnProceso'),
(12, 'Error en conexión API', '2025-10-06 14:50:00', 'Sistema', 'Alta', 'Integración', 'Soporte', 'Activo'),
(13, 'Desbordamiento de memoria', '2025-10-07 09:20:00', 'Sistema', 'Alta', 'Backend', 'Admin', 'Cerrado'),
(14, 'Permiso denegado', '2025-10-07 10:15:00', 'Usuario', 'Baja', 'Seguridad', 'Validador', 'Cerrado'),
(15, 'Archivo corrupto', '2025-10-07 13:00:00', 'Sistema', 'Media', 'Disco', 'Soporte', 'EnProceso'),
(16, 'Validación duplicada', '2025-10-08 08:00:00', 'Usuario', 'Baja', 'Formulario', 'Admin', 'Cerrado'),
(17, 'Error crítico en base de datos', '2025-10-08 09:15:00', 'Sistema', 'Alta', 'BD', 'Soporte', 'Activo'),
(18, 'Operación inválida', '2025-10-09 08:10:00', 'Usuario', 'Media', 'Interfaz', 'Validador', 'EnProceso'),
(19, 'Fallo en backup', '2025-10-09 09:00:00', 'Sistema', 'Alta', 'Servidor', 'Admin', 'Cerrado');

-- EVIDENCIA
INSERT INTO Evidencia (id, tipo, ruta, fecha)
VALUES
(10, 'Captura', '/evidencias/e1.png', '2025-10-05'),
(11, 'Log', '/evidencias/e2.txt', '2025-10-06'),
(12, 'Documento', '/evidencias/e3.pdf', '2025-10-06'),
(13, 'Captura', '/evidencias/e4.png', '2025-10-07'),
(14, 'Log', '/evidencias/e5.txt', '2025-10-07'),
(15, 'Documento', '/evidencias/e6.pdf', '2025-10-07'),
(16, 'Captura', '/evidencias/e7.png', '2025-10-08'),
(17, 'Log', '/evidencias/e8.txt', '2025-10-08'),
(18, 'Documento', '/evidencias/e9.pdf', '2025-10-09'),
(19, 'Captura', '/evidencias/e10.png', '2025-10-09');

-- VALIDACION
INSERT INTO Validacion (numero, fecha, justificacion, evidencias, estado)
VALUES
(110, '2025-10-05', 'Validación inicial', '10', 'Pendiente'),
(111, '2025-10-06', 'Validación de revisión', '11', 'Aprobada'),
(112, '2025-10-06', 'Validación de usuario', '12', 'Rechazada'),
(113, '2025-10-07', 'Prueba técnica', '13', 'Pendiente'),
(114, '2025-10-07', 'Seguimiento interno', '14', 'Aprobada'),
(115, '2025-10-07', 'Control adicional', '15', 'Pendiente'),
(116, '2025-10-08', 'Auditoría interna', '16', 'Aprobada'),
(117, '2025-10-08', 'Verificación final', '17', 'Rechazada'),
(118, '2025-10-09', 'Control calidad', '18', 'Pendiente'),
(119, '2025-10-09', 'Verificación post error', '19', 'Aprobada');

-- PROFESIONAL
INSERT INTO Profesional (id, resumen)
VALUES
(10, 'Analista de datos'),
(11, 'Ingeniero de software'),
(12, 'Gestor de proyectos'),
(13, 'Consultor técnico'),
(14, 'Administrador de sistemas'),
(15, 'Diseñador UX'),
(16, 'Arquitecto de software'),
(17, 'Científico de datos'),
(18, 'QA tester'),
(19, 'DevOps engineer');

-- PERFIL
INSERT INTO Perfil (correo, nombre, pais)
VALUES
('carlos@uni.edu', 'Carlos Díaz', 'Colombia'),
('maria@uni.edu', 'María López', 'México'),
('sofia@uni.edu', 'Sofía Rojas', 'Chile'),
('pedro@uni.edu', 'Pedro Sánchez', 'Argentina'),
('laura@uni.edu', 'Laura Gómez', 'Perú'),
('andres@uni.edu', 'Andrés Castro', 'Ecuador'),
('valentina@uni.edu', 'Valentina Ruiz', 'Colombia'),
('felipe@uni.edu', 'Felipe Morales', 'Uruguay'),
('camila@uni.edu', 'Camila Torres', 'Bolivia'),
('mateo@uni.edu', 'Mateo Herrera', 'España');

-- FUNDACION
INSERT INTO Fundacion (id, tamaño, propuesta, ciudad)
VALUES
(10, 'Pequeña', 'Apoyo educativo', 'Bogotá'),
(11, 'Mediana', 'Salud infantil', 'Lima'),
(12, 'Grande', 'Innovación tecnológica', 'Ciudad de México'),
(13, 'Mediana', 'Protección ambiental', 'Buenos Aires'),
(14, 'Pequeña', 'Cultura local', 'Quito'),
(15, 'Grande', 'Investigación médica', 'Madrid'),
(16, 'Mediana', 'Inclusión social', 'Santiago'),
(17, 'Pequeña', 'Transporte sostenible', 'Montevideo'),
(18, 'Grande', 'Desarrollo rural', 'Caracas'),
(19, 'Mediana', 'Apoyo digital', 'Asunción');

-- SECTOR
INSERT INTO Sector (id, nombre)
VALUES
(10, 'Agricultura'),
(11, 'Ciencia'),
(12, 'Cultura'),
(13, 'Deporte'),
(14, 'Economía'),
(15, 'Energía'),
(16, 'Finanzas'),
(17, 'Infraestructura'),
(18, 'Medio Ambiente'),
(19, 'Turismo');

-- COMPETENCIA
INSERT INTO Competencia (codigo, nombre)
VALUES
(20, 'Comunicación'),
(21, 'Resolución de problemas'),
(22, 'Trabajo en equipo'),
(23, 'Pensamiento crítico'),
(24, 'Innovación'),
(25, 'Gestión del tiempo'),
(26, 'Adaptabilidad'),
(27, 'Aprendizaje continuo'),
(28, 'Planificación'),
(29, 'Análisis de datos');

-- LOGRO
INSERT INTO Logro (id, categoria, nombre, fecha, editorial)
VALUES
(10, 'Publicación', 'Artículo científico', '2025-05-10', 'IEEE'),
(11, 'Premio', 'Premio de innovación', '2025-06-12', 'ACM'),
(12, 'Proyecto', 'Sistema de monitoreo', '2025-07-18', 'UNESCO'),
(13, 'Publicación', 'Libro técnico', '2025-08-01', 'Springer'),
(14, 'Premio', 'Reconocimiento académico', '2025-08-15', 'Universidad ABC'),
(15, 'Proyecto', 'Red de validaciones', '2025-09-05', 'Ministerio de Ciencia'),
(16, 'Publicación', 'Reporte de investigación', '2025-09-10', 'Elsevier'),
(17, 'Premio', 'Beca de excelencia', '2025-09-20', 'Colciencias'),
(18, 'Proyecto', 'Software de auditoría', '2025-09-25', 'UniSoft'),
(19, 'Publicación', 'Artículo Q1', '2025-09-30', 'Nature');

-- ACTUA
INSERT INTO Actua (id, numProyectos)
VALUES
(10, 3),
(11, 6),
(12, 2),
(13, 8),
(14, 5),
(15, 9),
(16, 1),
(17, 7),
(18, 4),
(19, 10);

-- Validación final de cantidad
SELECT 
    'Notificación' AS Tabla, COUNT(*) AS Total FROM Notificacion
UNION ALL
SELECT 'Error', COUNT(*) FROM Error
UNION ALL
SELECT 'Evidencia', COUNT(*) FROM Evidencia
UNION ALL
SELECT 'Validacion', COUNT(*) FROM Validacion
UNION ALL
SELECT 'Profesional', COUNT(*) FROM Profesional
UNION ALL
SELECT 'Perfil', COUNT(*) FROM Perfil
UNION ALL
SELECT 'Fundacion', COUNT(*) FROM Fundacion
UNION ALL
SELECT 'Sector', COUNT(*) FROM Sector
UNION ALL
SELECT 'Competencia', COUNT(*) FROM Competencia
UNION ALL
SELECT 'Logro', COUNT(*) FROM Logro
UNION ALL
SELECT 'Actua', COUNT(*) FROM Actua;