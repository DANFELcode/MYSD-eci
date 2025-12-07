--Eliminación de indices y vistas
---Indices--    
DROP INDEX idx_usuarios_nivel
DROP INDEX idx_feedbacks_fecha
DROP INDEX idx_progresos_fecha
DROP INDEX idx_rutinas_nivel

---Vistas--
DROP VIEW v_planes_fitness_detallados
DROP VIEW v_especialistas_con_estadisticas
DROP VIEW v_objetivos_con_recomendaciones