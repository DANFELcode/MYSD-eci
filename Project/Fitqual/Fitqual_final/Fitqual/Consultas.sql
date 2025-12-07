-- CONSULTA 1: USUARIOS CON MÁS PROGRESO EN PÉRDIDA DE PESO
SELECT 
    u.id_persona,
    p.nombre,
    u.peso AS peso_inicial,
    pr.peso_actual AS peso_actual,
    (u.peso - pr.peso_actual) AS peso_perdido
FROM Usuarios u
JOIN Personas p ON u.id_persona = p.id_persona
JOIN Progresos pr ON u.id_persona = pr.usuario
WHERE LOWER(u.meta) LIKE '%perder%peso%'
   OR LOWER(u.meta) LIKE '%bajar%peso%'
   OR LOWER(u.meta) LIKE '%reducir%peso%'
   OR LOWER(u.meta) LIKE '%disminuir%peso%'
   OR LOWER(u.meta) LIKE '%adelgazar%'
   OR LOWER(u.meta) LIKE '%bajar de peso%'
ORDER BY peso_perdido DESC;

-- CONSULTA 2: FEEDBACK POR TIPO Y CALIFICACIÓN
SELECT 
    tipo_feedback,
    COUNT(*) AS total_feedbacks,
    ROUND(AVG(calificacion), 2) AS calificacion_promedio
FROM Feedbacks
GROUP BY tipo_feedback
ORDER BY calificacion_promedio DESC;

-- CONSULTA 3: USUARIOS POR NIVEL Y FRECUENCIA DE ENTRENO
SELECT 
    nivel,
    frecuencia_entreno_semanal,
    COUNT(*) AS total_usuarios,
    ROUND(AVG(edad)) AS edad_promedio
FROM Usuarios
GROUP BY nivel, frecuencia_entreno_semanal
ORDER BY nivel, frecuencia_entreno_semanal;

-- CONSULTA 4: EJERCICIOS MÁS UTILIZADOS EN RUTINAS
SELECT 
    e.nombre_ejercicio,
    COUNT(DISTINCT e.id_rutina) AS veces_utilizado,
    COUNT(DISTINCT r.planfitness) AS planes_diferentes,
    ROUND(AVG(e.series), 1) AS promedio_series,
    ROUND(AVG(e.repeticiones), 1) AS promedio_repeticiones,
    ROUND(AVG(e.duracion_min), 1) AS promedio_duracion_min
FROM Ejercicios e
JOIN Rutinas r ON e.id_rutina = r.id_rutina
GROUP BY e.nombre_ejercicio
HAVING COUNT(DISTINCT e.id_rutina) > 1
ORDER BY veces_utilizado DESC, planes_diferentes DESC;

