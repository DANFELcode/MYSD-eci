------------------------------------------------------------
-- TUPLAS
-- Restricciones que implican múltiples atributos
------------------------------------------------------------

-- TABLA USUARIOS: 
--Coherencia entre fechas de membresía
-- La fecha de fin de la membresia no puede ser mayor que la fecha de inicio

ALTER TABLE Usuarios ADD CONSTRAINT ck_usuario_membresia
CHECK (
    (TRIM(membresia_activa) = '1' AND 
     fecha_inicio_membresia IS NOT NULL AND 
     fecha_fin_membresia IS NOT NULL AND
     fecha_fin_membresia > fecha_inicio_membresia)
    OR 
    (TRIM(membresia_activa) = '0')
);



-- TABLA RUTINAS:
--Coherencia entre nivel de dificultad y días por semana
ALTER TABLE Rutinas
ADD CONSTRAINT ck_rutina_nivel_dias CHECK (
    (nivel_dificultad IN ('Básico', 'Intermedio', 'Avanzado') AND dias_semana IS NOT NULL) OR
    (nivel_dificultad IS NULL AND dias_semana IS NULL)
);

-- TABLA EJERCICIOS:
-- Coherencia entre series, repeticiones y duración
ALTER TABLE Ejercicios
ADD CONSTRAINT ck_ejercicio_series_rep_duracion CHECK (
    (series IS NOT NULL AND repeticiones IS NOT NULL AND duracion_min IS NULL) OR
    (series IS NULL AND repeticiones IS NULL AND duracion_min IS NOT NULL) OR
    (series IS NOT NULL AND repeticiones IS NULL AND duracion_min IS NOT NULL)
);


commit;

