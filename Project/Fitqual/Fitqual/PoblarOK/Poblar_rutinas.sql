-- POBLAR TABLA RUTINAS (70 rutinas - 2 por cada plan en promedio)

-- Plan 1: Transformación Corporal (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (1, 1, 'Rutina Full Body Principiante', 'Rutina completa para principiantes que trabaja todos los grupos musculares en una sesión. Ideal para empezar en el gym.', 'Lunes, Miércoles, Viernes', 60, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (2, 1, 'Cardio Quema Grasa', 'Sesión de cardio en estado estable para acelerar la quema de grasa y mejorar condición cardiovascular.', 'Martes, Jueves', 45, 'Básico', 'Cardio');

-- Plan 2: Volumen Muscular (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (3, 2, 'Rutina Push-Pull-Legs', 'División clásica de entrenamiento para máximo volumen muscular. Días de empuje, tracción y piernas.', 'Lunes, Martes, Jueves, Viernes', 75, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (4, 2, 'Cardio Ligero Volumen', 'Cardio de baja intensidad para no interferir con la ganancia muscular durante fase de volumen.', 'Miércoles, Sábado', 30, 'Básico', 'Cardio');

-- Plan 3: Maratón Sub 4 Horas (3 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (5, 3, 'Carrera Larga Progresiva', 'Entrenamiento de resistencia para aumentar distancia gradualmente. Base fundamental para maratón.', 'Domingo', 120, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (6, 3, 'Entrenamiento de Velocidad', 'Series cortas a alta intensidad para mejorar ritmo de carrera y economía de movimiento.', 'Miércoles', 60, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (7, 3, 'Carrera Recuperación', 'Trote suave para promover recuperación activa entre sesiones intensas.', 'Viernes', 45, 'Básico', 'Cardio');

-- Plan 4: Yoga y Mindfulness (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (8, 4, 'Yoga Matutino Energizante', 'Secuencia de yoga para empezar el día con energía y claridad mental. Enfocado en abrir el cuerpo.', 'Lunes a Viernes', 30, 'Básico', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (9, 4, 'Yoga Nocturno Relajante', 'Rutina suave de yoga para liberar tensiones del día y preparar el cuerpo para el descanso.', 'Lunes a Viernes', 25, 'Básico', 'Cardio');

-- Plan 5: Quema Grasa HIIT (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (10, 5, 'HIIT Full Body', 'Entrenamiento de alta intensidad que trabaja todo el cuerpo en circuito. Máxima quema calórica.', 'Lunes, Miércoles, Viernes', 35, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (11, 5, 'HIIT Cardio Extremo', 'Sesión pura de cardio de alta intensidad para acelerar metabolismo y quema de grasa.', 'Martes, Jueves', 25, 'Avanzado', 'Cardio');

-- Plan 6: Definición Muscular (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (12, 6, 'Rutina de Definición Superior', 'Enfoque en torso, brazos y espalda para máxima definición muscular. Alto volumen, corto descanso.', 'Lunes, Jueves', 70, 'Avanzado', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (13, 6, 'Rutina de Definición Inferior', 'Trabajo intenso de piernas y glúteos para lograr definición y separación muscular.', 'Martes, Viernes', 65, 'Avanzado', 'Fuerza');

-- Plan 7: Rehabilitación de Hombro (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (14, 7, 'Movilidad Hombro Inicial', 'Ejercicios suaves para recuperar rango de movimiento sin carga. Fase inicial de rehabilitación.', 'Lunes, Miércoles, Viernes', 25, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (15, 7, 'Fortalecimiento Progresivo', 'Ejercicios con resistencia gradual para reconstruir fuerza en el hombro afectado.', 'Martes, Jueves', 30, 'Básico', 'Fuerza');

-- Plan 8: Fitness Funcional (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (16, 8, 'Entrenamiento Funcional Básico', 'Ejercicios que imitan movimientos de la vida diaria para mejorar funcionalidad.', 'Lunes, Miércoles, Viernes', 50, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (17, 8, 'Core y Estabilidad', 'Rutina específica para fortalecer core y mejorar equilibrio y estabilidad corporal.', 'Martes, Jueves', 40, 'Intermedio', 'Fuerza');

-- Plan 9: Competencia Bikini (3 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (18, 9, 'Rutina Simetría Superior', 'Enfoque en desarrollar simetría y proporción en torso, hombros y espalda para poses.', 'Lunes, Jueves', 80, 'Avanzado', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (19, 9, 'Rutina Glúteos y Piernas', 'Desarrollo específico de glúteos y piernas para poses de espalda en competencia.', 'Martes, Viernes', 75, 'Avanzado', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (20, 9, 'Cardio de Definición', 'Sesiones de cardio para reducir grasa corporal y lograr máxima definición pre-competencia.', 'Miércoles, Sábado', 45, 'Intermedio', 'Cardio');

-- Plan 10: Powerlifting Básico (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (21, 10, 'Día Sentadilla y Accesorios', 'Enfoque en sentadilla pesada seguido de ejercicios accesorios para piernas y core.', 'Lunes', 90, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (22, 10, 'Día Press Banca y Peso Muerto', 'Sesión combinada de press banca y peso muerto con ejercicios complementarios.', 'Jueves', 95, 'Intermedio', 'Fuerza');

-- Plan 11: Flexibilidad Profunda (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (23, 11, 'Estiramientos Pasivos', 'Rutina de estiramientos mantenidos para mejorar flexibilidad estática.', 'Lunes a Viernes', 20, 'Básico', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (24, 11, 'Movilidad Dinámica', 'Ejercicios de movilidad activa para mejorar rango de movimiento funcional.', 'Lunes a Viernes', 25, 'Intermedio', 'Cardio');

-- Plan 12: Entrenamiento Militar (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (25, 12, 'Circuito Militar Básico', 'Circuito con ejercicios de peso corporal inspirados en entrenamiento militar.', 'Lunes, Miércoles, Viernes', 60, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (26, 12, 'Entrenamiento de Resistencia', 'Rutina de alta resistencia con poco descanso para preparación física militar.', 'Martes, Jueves', 45, 'Avanzado', 'Cardio');

-- Plan 13: Embarazo Activo (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (27, 13, 'Ejercicios Primer Trimestre', 'Rutina segura para primer trimestre, enfocada en mantenimiento de fuerza.', 'Lunes, Miércoles, Viernes', 35, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (28, 13, 'Ejercicios Segundo Trimestre', 'Adaptación para segundo trimestre con enfoque en preparación al parto.', 'Martes, Jueves', 30, 'Básico', 'Fuerza');

-- Plan 14: Mantenimiento Longevo (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (29, 14, 'Fuerza para Adultos', 'Rutina de fuerza adaptada para adultos mayores, enfocada en funcionalidad.', 'Lunes, Jueves', 45, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (30, 14, 'Cardio Saludable', 'Ejercicio cardiovascular suave para mantenimiento de salud cardiaca.', 'Martes, Viernes', 40, 'Básico', 'Cardio');

-- Plan 15: Calistenia Principiante (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (31, 15, 'Rutina Básica Peso Corporal', 'Ejercicios fundamentales de calistenia para construir fuerza base.', 'Lunes, Miércoles, Viernes', 50, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (32, 15, 'Progresiones Iniciales', 'Ejercicios progresivos para avanzar en habilidades de calistenia.', 'Martes, Jueves', 45, 'Intermedio', 'Fuerza');

-- Plan 16: Boxeo Fitness (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (33, 16, 'Técnica de Golpes', 'Rutina enfocada en aprendizaje y práctica de técnica de golpes de boxeo.', 'Lunes, Miércoles', 60, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (34, 16, 'Condición Boxística', 'Entrenamiento de condición física específica para boxeo con trabajo de saco.', 'Martes, Jueves', 55, 'Intermedio', 'Cardio');

-- Plan 17: Natación Principiantes (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (35, 17, 'Técnica de Crol', 'Enfoque en aprendizaje y perfeccionamiento de técnica de crol para principiantes.', 'Lunes, Miércoles, Viernes', 45, 'Básico', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (36, 17, 'Resistencia en Agua', 'Rutina para construir resistencia y capacidad pulmonar en natación.', 'Martes, Jueves', 50, 'Intermedio', 'Cardio');

-- Plan 18: Cross-Training Básico (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (37, 18, 'WOD Principiante', 'Workout of the Day adaptado para principiantes en cross-training.', 'Lunes, Miércoles, Viernes', 40, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (38, 18, 'Entrenamiento por Intervalos', 'Rutina de intervalos para mejorar condición física general.', 'Martes, Jueves', 35, 'Intermedio', 'Cardio');

-- Plan 19: Pilates Fortalecimiento (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (39, 19, 'Pilates Mat Básico', 'Rutina de pilates en colchoneta para fortalecimiento de core y flexibilidad.', 'Lunes, Miércoles, Viernes', 40, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (40, 19, 'Pilates Avanzado', 'Secuencia más desafiante de pilates para desarrollo de fuerza y control.', 'Martes, Jueves', 45, 'Intermedio', 'Fuerza');

-- Plan 20: Dance Fitness (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (41, 20, 'Coreografía Básica', 'Rutina de baile con coreografía simple para condición cardiovascular.', 'Lunes, Miércoles, Viernes', 50, 'Básico', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (42, 20, 'Dance Cardio Intenso', 'Sesión de baile de alta intensidad para quema calórica máxima.', 'Martes, Jueves', 45, 'Intermedio', 'Cardio');

-- Plan 21: Recuperación Postparto (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (43, 21, 'Recuperación Postparto Inicial', 'Ejercicios suaves para primeras semanas postparto.', 'Lunes, Miércoles, Viernes', 25, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (44, 21, 'Fortalecimiento Postparto', 'Rutina para recuperar fuerza y tono muscular después del parto.', 'Martes, Jueves', 35, 'Básico', 'Fuerza');

-- Plan 22: Fuerza para Adultos Mayores (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (45, 22, 'Fuerza Senior Adaptada', 'Ejercicios de fuerza seguros para adultos mayores.', 'Lunes, Jueves', 40, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (46, 22, 'Equilibrio y Movilidad', 'Rutina para mejorar equilibrio y prevenir caídas en adultos mayores.', 'Martes, Viernes', 35, 'Básico', 'Fuerza');

-- Plan 23: Preparación Triatlón Sprint (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (47, 23, 'Natación Triatlón', 'Entrenamiento de natación específico para triatlón sprint.', 'Lunes, Miércoles', 50, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (48, 23, 'Transiciones y Brick', 'Práctica de transiciones y entrenamiento combinado bici-correr.', 'Sábado', 75, 'Intermedio', 'Cardio');

-- Plan 24: Mobilidad Articular Completa (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (49, 24, 'Movilidad Completa', 'Rutina para mejorar movilidad en todas las articulaciones principales.', 'Lunes a Viernes', 20, 'Básico', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (50, 24, 'Flexibilidad Avanzada', 'Estiramientos profundos para aumentar rango de movimiento máximo.', 'Lunes a Viernes', 25, 'Intermedio', 'Cardio');

-- Plan 25: Entrenamiento en Ayunas (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (51, 25, 'Cardio en Ayunas', 'Protocolo de cardio suave en estado de ayuno para optimización metabólica.', 'Lunes, Miércoles, Viernes', 30, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (52, 25, 'Fuerza en Ayunas', 'Entrenamiento de fuerza adaptado para realizar en estado de ayuno.', 'Martes, Jueves', 45, 'Intermedio', 'Fuerza');

-- Plan 26: Alta Intensidad para Quemar (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (53, 26, 'HIIT Quema Extrema', 'Sesión de alta intensidad para máxima quema calórica post-entreno.', 'Lunes, Miércoles, Viernes', 28, 'Avanzado', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (54, 26, 'Tabata Protocol', 'Entrenamiento Tabata 20/10 para mejora de capacidad anaeróbica.', 'Martes, Jueves', 20, 'Avanzado', 'Cardio');

-- Plan 27: Yoga para Deportistas (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (55, 27, 'Yoga para Fuerza', 'Secuencia de yoga enfocada en desarrollo de fuerza y estabilidad.', 'Lunes, Miércoles, Viernes', 50, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (56, 27, 'Yoga para Flexibilidad', 'Rutina de yoga para aumento de flexibilidad y movilidad.', 'Martes, Jueves', 45, 'Intermedio', 'Cardio');

-- Plan 28: Fuerza Explosiva (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (57, 28, 'Entrenamiento Explosivo', 'Ejercicios pliométricos y de potencia para desarrollo de fuerza explosiva.', 'Lunes, Jueves', 55, 'Avanzado', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (58, 28, 'Potencia Máxima', 'Rutina para desarrollo de potencia pura en movimientos atléticos.', 'Martes, Viernes', 60, 'Avanzado', 'Fuerza');

-- Plan 29: Resistencia Cardiaca (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (59, 29, 'Cardio de Resistencia', 'Entrenamiento prolongado para mejorar resistencia cardiovascular.', 'Lunes, Miércoles, Viernes', 60, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (60, 29, 'Umbral Lactato', 'Trabajo en umbral lactato para mejorar eficiencia aeróbica.', 'Martes, Jueves', 45, 'Avanzado', 'Cardio');

-- Plan 30: Tonificación Femenina (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (61, 30, 'Tonificación Superior Femenina', 'Rutina específica para tonificación de brazos, espalda y hombros en mujeres.', 'Lunes, Jueves', 50, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (62, 30, 'Tonificación Inferior Femenina', 'Enfoque en piernas, glúteos y core para figura femenina tonificada.', 'Martes, Viernes', 55, 'Intermedio', 'Fuerza');

-- Plan 31: Volumen para Ectomorfos (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (63, 31, 'Volumen para Delgados', 'Rutina de alto volumen y calorías para ganancia muscular en ectomorfos.', 'Lunes, Martes, Jueves, Viernes', 70, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (64, 31, 'Nutrición y Descanso', 'Protocolo complementario de nutrición y recuperación para ganancia.', 'Diario', NULL, 'Básico', NULL);

-- Plan 32: Definición para Endomorfos (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (65, 32, 'Quema Grasa Endomorfo', 'Rutina específica para metabolismo lento y pérdida de grasa persistente.', 'Lunes a Sábado', 55, 'Intermedio', 'Cardio');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (66, 32, 'Fuerza Metabólica', 'Entrenamiento de fuerza que acelera metabolismo en cuerpos endomorfos.', 'Lunes, Miércoles, Viernes', 60, 'Intermedio', 'Fuerza');

-- Plan 33: Entrenamiento Nocturno (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (67, 33, 'Rutina Nocturna Energía', 'Entrenamiento adaptado para horario nocturno sin afectar sueño.', 'Nocturno', 45, 'Intermedio', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (68, 33, 'Recuperación Nocturna', 'Protocolo de recuperación y sueño para entrenamientos nocturnos.', 'Diario', NULL, 'Básico', NULL);

-- Plan 34: Fitness para Viajeros (2 rutinas)
INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (69, 34, 'Fitness Sin Equipo', 'Rutina completa usando solo peso corporal, ideal para viajeros.', 'Lunes, Miércoles, Viernes', 35, 'Básico', 'Fuerza');

INSERT INTO Rutinas (id_rutina, planfitness, nombre_rutina, descripcion, dias_semana, duracion_rutina_min, nivel_dificultad, tipo_entrenamiento) 
VALUES (70, 34, 'Cardio de Viaje', 'Ejercicios cardiovasculares que se pueden hacer en cualquier lugar.', 'Martes, Jueves', 30, 'Básico', 'Cardio');
commit;