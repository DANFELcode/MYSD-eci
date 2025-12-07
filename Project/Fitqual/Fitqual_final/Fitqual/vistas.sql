--vistas--

-- JOIN complejo: Plan + Rutinas + Comidas + Hábitos
CREATE VIEW v_planes_fitness_detallados AS
SELECT 
    pf.id_plan,
    pf.nombre AS nombre_plan,
    pf.duracion,
    pf.descripcion,
    COUNT(DISTINCT r.id_rutina) AS total_rutinas,
    COUNT(DISTINCT c.id_comida) AS total_comidas,
    COUNT(DISTINCT h.id_habito) AS total_habitos
FROM PlanesFitness pf
LEFT JOIN Rutinas r ON pf.id_plan = r.planfitness
LEFT JOIN Comidas c ON pf.id_plan = c.planfitness
LEFT JOIN Habitos h ON pf.id_plan = h.planfitness
GROUP BY pf.id_plan, pf.nombre, pf.duracion, pf.descripcion;

-- Perfil completo de especialistas con métricas
CREATE VIEW v_especialistas_con_estadisticas AS
SELECT 
    p.id_persona,
    p.nombre,
    p.correo,
    ef.especialidad,
    ef.descripcion_perfil,
    ef.trayectoria_profesional,
    ef.consejos_publicados,
    COUNT(DISTINCT re.id_rutina_ejemplo) AS total_rutinas_ejemplo
FROM Personas p
JOIN EspecialistasFitness ef ON p.id_persona = ef.id_persona
LEFT JOIN RutinasDeEjemplo re ON ef.id_persona = re.especialista_fitness
GROUP BY p.id_persona, p.nombre, p.correo, ef.especialidad, ef.descripcion_perfil, 
         ef.trayectoria_profesional, ef.consejos_publicados;

-- Objetivos + sus recomendaciones asociadas (JOIN complejo)
CREATE VIEW v_objetivos_con_recomendaciones AS
SELECT 
    o.id_objetivo,
    o.usuario,
    p.nombre AS nombre_usuario,
    o.nombre AS nombre_objetivo,
    o.contenido AS contenido_objetivo,
    o.fecha_creacion,
    r.id_recomendacion,
    r.contenido AS contenido_recomendacion,
    r.tipo_enfoque,
    pe.nombre AS nombre_especialista
FROM Objetivos o
LEFT JOIN ObjetivosRecomendaciones ore ON o.id_objetivo = ore.id_objetivo
LEFT JOIN Recomendaciones r ON ore.id_recomendacion = r.id_recomendacion
LEFT JOIN Personas pe ON r.especialista_fitness = pe.id_persona
JOIN Personas p ON o.usuario = p.id_persona;

commit;