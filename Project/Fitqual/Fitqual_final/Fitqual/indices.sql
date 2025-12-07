CREATE INDEX idx_usuarios_nivel ON Usuarios(nivel);

-- Índice para ordenar feedbacks por fecha
CREATE INDEX idx_feedbacks_fecha ON Feedbacks(fecha);

-- Índice para consultar historial de progreso por fecha
CREATE INDEX idx_progresos_fecha ON Progresos(fecha_registro);

-- Índice para filtrar rutinas de ejemplo por nivel de dificultad
CREATE INDEX idx_rutinas_nivel ON RutinasDeEjemplo(nivel_dificultad);

commit;