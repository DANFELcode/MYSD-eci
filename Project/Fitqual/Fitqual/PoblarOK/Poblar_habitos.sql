-- POBLAR TABLA HABITOS (105 hábitos - 3 por plan en promedio)

-- Plan 1: Transformación Corporal (4 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (1, 1, 'Medición Semanal de Progreso', 'Registrar peso y medidas corporales cada semana para trackear progreso y hacer ajustes necesarios.', 'Una vez por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (2, 1, 'Hidratación Consistente', 'Beber al menos 2 litros de agua diarios para mantener metabolismo activo y mejorar recuperación.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (3, 1, 'Preparación de Comidas', 'Dedicar domingos a preparar comidas saludables para la semana, asegurando adherencia nutricional.', 'Una vez por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (4, 1, 'Sueño de Calidad', 'Dormir 7-8 horas diarias de calidad para óptima recuperación y regulación hormonal.', 'Diario');

-- Plan 2: Volumen Muscular (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (5, 2, 'Registro de Entrenamientos', 'Anotar pesos, repeticiones y series en cada sesión para asegurar progresión constante.', 'Cada sesión de entrenamiento');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (6, 2, 'Alimentación Cada 3 Horas', 'Consumir comida o snack proteico cada 3 horas para mantener positivo balance de nitrógeno.', 'Varias veces al día');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (7, 2, 'Enfoque Mental en Entrenamiento', 'Mantener concentración máxima durante entrenamientos, evitando distracciones con teléfono.', 'Cada sesión de entrenamiento');

-- Plan 3: Maratón Sub 4 Horas (5 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (8, 3, 'Estiramientos Diarios', 'Realizar rutina de estiramientos después de cada entrenamiento para prevenir lesiones.', 'Diario después de entrenar');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (9, 3, 'Hidratación Pre-Carrera', 'Beber 500ml de agua 2 horas antes de cada carrera larga para óptima hidratación.', 'Antes de sesiones largas');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (10, 3, 'Escucha Activa del Cuerpo', 'Prestar atención a señales de fatiga excesiva o dolor para prevenir sobreentrenamiento.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (11, 3, 'Nutrición Post-Entreno', 'Consumir proteína y carbohidratos dentro de los 45 minutos posteriores al entrenamiento.', 'Después de cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (12, 3, 'Descanso Activo', 'Incluir días de recuperación activa con caminatas o yoga suave entre sesiones intensas.', '2-3 veces por semana');

-- Plan 4: Yoga y Mindfulness (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (13, 4, 'Meditación Matutina', 'Practicar 10 minutos de meditación cada mañana para empezar el día con claridad mental.', 'Diario por la mañana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (14, 4, 'Respiración Consciente', 'Realizar 5 minutos de respiración profunda antes de cada comida para mejorar digestión.', 'Antes de cada comida');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (15, 4, 'Gratitud Diaria', 'Anotar 3 cosas por las que se está agradecido cada noche antes de dormir.', 'Diario antes de dormir');

-- Plan 5: Quema Grasa HIIT (4 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (16, 5, 'Ayuno Intermitente 16/8', 'Mantener ventana de alimentación de 8 horas y ayuno de 16 horas diarias.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (17, 5, 'Entrenamiento en Ayunas', 'Realizar cardio suave en estado de ayuno para optimizar quema de grasa.', '3-4 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (18, 5, 'Control de Porciones', 'Usar método del plato para controlar porciones: 50% vegetales, 25% proteína, 25% carbohidratos.', 'En cada comida');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (19, 5, 'Movimiento No Ejercicio', 'Aumentar actividad general: caminar más, usar escaleras, levantarse cada hora.', 'Varias veces al día');

-- Plan 6: Definición Muscular (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (20, 6, 'Pesaje Diario', 'Registrar peso cada mañana en las mismas condiciones para trackear tendencias.', 'Diario por la mañana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (21, 6, 'Fotos de Progreso', 'Tomar fotos frontales, laterales y posteriores cada 2 semanas para visualizar cambios.', 'Cada 2 semanas');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (22, 6, 'Suplementación Estricta', 'Tomar suplementos específicos (proteína, creatina, BCAA) en horarios establecidos.', 'Diario según horario');

-- Plan 7: Rehabilitación de Hombro (4 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (23, 7, 'Ejercicios de Movilidad', 'Realizar rutina de movilidad específica para hombro 2 veces al día.', 'Mañana y noche');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (24, 7, 'Hielo Post-Ejercicio', 'Aplicar hielo en el hombro después de cada sesión de rehabilitación para reducir inflamación.', 'Después de cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (25, 7, 'Evitar Movimientos Lesivos', 'Conscientemente evitar movimientos que puedan reagravar la lesión durante el día.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (26, 7, 'Descanso entre Sesiones', 'Respetar 48 horas de descanso entre sesiones de rehabilitación intensas.', 'Entre sesiones');

-- Plan 8: Fitness Funcional (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (27, 8, 'Integración de Movimientos', 'Practicar movimientos funcionales (sentadillas, empujes, tracciones) en vida diaria.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (28, 8, 'Entrenamiento Inestable', 'Incluir ejercicios en superficies inestables para mejorar equilibrio y propiocepción.', '2 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (29, 8, 'Variedad de Patrones', 'Rotar entre diferentes patrones de movimiento para desarrollar versatilidad física.', 'Semanalmente');

-- Plan 9: Competencia Bikini (6 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (30, 9, 'Poses Diarias', 'Practicar poses de competencia frente al espejo todos los días para perfeccionar técnica.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (31, 9, 'Control de Agua', 'Regular ingesta de agua según protocolo específico de la semana de competencia.', 'Diario controlado');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (32, 9, 'Visualización Mental', 'Visualizar éxito en competencia y ejecución perfecta de poses cada día.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (33, 9, 'Registro Exacto de Comidas', 'Anotar cada gramo de comida consumida para precisión extrema en dieta.', 'En cada comida');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (34, 9, 'Sueño Estricto', 'Dormir exactamente 8 horas cada noche con horarios fijos durante preparación.', 'Diario estricto');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (35, 9, 'Cardio Consistente', 'Realizar sesiones de cardio en horarios específicos sin saltarse ninguna.', 'Según plan semanal');

-- Plan 10: Powerlifting Básico (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (36, 10, 'Calentamiento Estructurado', 'Seguir protocolo específico de calentamiento antes de cada sesión de levantamiento.', 'Antes de cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (37, 10, 'Enfoque en Técnica', 'Priorizar técnica perfecta sobre peso en cada repetición de levantamientos principales.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (38, 10, 'Descanso entre Series', 'Usar temporizador para respetar tiempos exactos de descanso entre series.', 'En cada sesión');

-- Plan 11: Flexibilidad Profunda (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (39, 11, 'Respiración en Estiramientos', 'Coordinar respiración profunda con cada estiramiento para mayor efectividad.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (40, 11, 'Consistencia Diaria', 'Realizar rutina de flexibilidad todos los días sin excepción para progreso constante.', 'Diario');

-- Plan 12: Entrenamiento Militar (4 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (41, 12, 'Mentalidad de Guerrero', 'Comenzar cada entrenamiento con mentalidad de superación y resiliencia.', 'Antes de cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (42, 12, 'Improvisación con Equipo', 'Practicar ejercicios usando objetos cotidianos para simular condiciones de campo.', '2 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (43, 12, 'Entrenamiento en Fatiga', 'Realizar ejercicios técnicos cuando se está fatigado para simular condiciones reales.', '1 vez por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (44, 12, 'Autodisciplina Estricta', 'Cumplir horarios de entrenamiento y descanso con precisión militar.', 'Diario');

-- Plan 13: Embarazo Activo (5 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (45, 13, 'Escucha del Bebé', 'Prestar atención a movimientos del bebé durante y después del ejercicio.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (46, 13, 'Hidratación Extra', 'Beber agua adicional para mantenerse hidratada durante el embarazo.', 'Varias veces al día');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (47, 13, 'Modificación de Ejercicios', 'Ajustar ejercicios según trimestre y comodidad personal.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (48, 13, 'Descanso cuando Sea Necesario', 'Permitirse descansar cuando el cuerpo lo pida sin culpa.', 'Cuando sea necesario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (49, 13, 'Comunicación con Médico', 'Mantener comunicación abierta con médico sobre rutina de ejercicios.', 'Regularmente cada mes');

-- Plan 14: Mantenimiento Longevo (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (50, 14, 'Actividad Diaria Consistente', 'Manterse activo todos los días, aunque sea con caminatas suaves.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (51, 14, 'Socialización Activa', 'Combinar actividad física con socialización para bienestar integral.', '3-4 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (52, 14, 'Chequeos Regulares', 'Realizar chequeos médicos regulares para monitorizar salud.', 'Cada 6 meses');

-- Plan 15: Calistenia Principiante (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (53, 15, 'Práctica de Fundamentos', 'Dedicar tiempo extra a practicar ejercicios fundamentales como flexiones y sentadillas.', 'Diario adicional');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (54, 15, 'Grabación de Progreso', 'Grabar videos para analizar técnica y trackear progreso en habilidades.', 'Cada 2 semanas');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (55, 15, 'Entrenamiento en Parques', 'Utilizar parques y áreas públicas para variar entorno de entrenamiento.', '1-2 veces por semana');

-- Plan 16: Boxeo Fitness (4 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (56, 16, 'Shadow Boxing Diario', 'Practicar técnica de golpes frente al espejo sin equipo.', 'Diario 10 minutos');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (57, 16, 'Trabajo de Cuello', 'Fortalecer músculos del cuello para mejorar resistencia a golpes.', '3 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (58, 16, 'Salto de Cuerda', 'Incluir sesiones de salto de cuerda para mejorar coordinación y condición.', '4 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (59, 16, 'Visualización de Combate', 'Visualizar estrategias de combate y defensa durante entrenamiento.', 'En cada sesión');

-- Plan 17: Natación Principiantes (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (60, 17, 'Ejercicios de Respiración', 'Practicar técnicas de respiración específicas para natación fuera del agua.', 'Diario 5 minutos');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (61, 17, 'Visualización de Técnica', 'Visualizar movimientos de brazada y patada perfectos antes de nadar.', 'Antes de cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (62, 17, 'Hidratación Post-Natación', 'Beber agua extra después de nadar aunque no se sienta sed.', 'Después de cada sesión');

-- Plan 18: Cross-Training Básico (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (63, 18, 'Variedad Semanal', 'Cambiar tipo de entrenamiento cada semana para evitar adaptación.', 'Semanalmente');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (64, 18, 'Enfoque en Debilidades', 'Dedicar tiempo extra a trabajar puntos débiles o habilidades menos desarrolladas.', '2 veces por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (65, 18, 'Comunidad y Apoyo', 'Entrenar en grupo o buscar comunidad para mantener motivación.', '1-2 veces por semana');

-- Plan 19: Pilates Fortalecimiento (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (66, 19, 'Conciencia Postural', 'Mantener conciencia de postura durante todo el día, no solo en entrenamientos.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (67, 19, 'Respiración Pilates', 'Practicar respiración lateral costal característica del método Pilates.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (68, 19, 'Movimiento Controlado', 'Enfocarse en control y precisión sobre velocidad o intensidad.', 'En cada sesión');

-- Plan 20: Dance Fitness (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (69, 20, 'Práctica con Música', 'Siempre entrenar con música para mejorar ritmo y disfrute.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (70, 20, 'Grabación de Coreografías', 'Grabarse bailando para analizar y mejorar técnica de baile.', 'Cada 2 semanas');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (71, 20, 'Expresión Corporal', 'Enfocarse en expresión facial y corporal durante rutinas de baile.', 'En cada sesión');

-- Plan 21: Recuperación Postparto (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (72, 21, 'Paciencia Postparto', 'Mantener expectativas realistas sobre recuperación postparto.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (73, 21, 'Ejercicios de Suelo Pélvico', 'Incorporar ejercicios de Kegel en rutina diaria.', 'Varias veces al día');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (74, 21, 'Descanso cuando el Bebé Duerme', 'Aprovechar siestas del bebé para descansar o hacer ejercicio suave.', 'Diario cuando sea posible');

-- Plan 22: Fuerza para Adultos Mayores (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (75, 22, 'Seguridad Primero', 'Priorizar seguridad sobre intensidad en todos los ejercicios.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (76, 22, 'Movimiento Suave', 'Realizar movimientos controlados y sin impactos fuertes.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (77, 22, 'Hidratación Constante', 'Beber pequeños sorbos de agua frecuentemente durante el día.', 'Varias veces al día');

-- Plan 23: Preparación Triatlón Sprint (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (78, 23, 'Transiciones Eficientes', 'Practicar transiciones rápidas entre natación, ciclismo y carrera.', '1 vez por semana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (79, 23, 'Nutrición durante Carrera', 'Practicar estrategias de nutrición e hidratación durante entrenamientos largos.', 'En sesiones largas');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (80, 23, 'Mantenimiento de Bicicleta', 'Realizar mantenimiento básico de bicicleta regularmente.', 'Semanalmente');

-- Plan 24: Mobilidad Articular Completa (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (81, 24, 'Movilidad Matutina', 'Realizar rutina de movilidad cada mañana al despertar.', 'Diario por la mañana');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (82, 24, 'Pausas Activas', 'Incorporar pausas activas cada hora si se trabaja sentado.', 'Varias veces al día');

-- Plan 25: Entrenamiento en Ayunas (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (83, 25, 'Control de Horarios', 'Mantener horarios estrictos de alimentación según protocolo de ayuno.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (84, 25, 'Escucha de Hambre Real', 'Aprender a diferenciar entre hambre real y hambre emocional.', 'Diario');

-- Plan 26: Alta Intensidad para Quemar (3 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (85, 26, 'Intensidad Máxima', 'Dar 100% de esfuerzo durante intervalos de trabajo en HIIT.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (86, 26, 'Recuperación Activa', 'Mantenerse en movimiento durante periodos de recuperación.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (87, 26, 'Mentalidad de Quema', 'Enfocarse en sensación de quema calórica durante entrenamientos.', 'En cada sesión');

-- Plan 27: Yoga para Deportistas (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (88, 27, 'Conexión Mente-Cuerpo', 'Mantener conciencia de conexión entre respiración, mente y movimiento.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (89, 27, 'Alineación Perfecta', 'Priorizar alineación corporal correcta sobre profundidad en posturas.', 'En cada sesión');

-- Plan 28: Fuerza Explosiva (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (90, 28, 'Explosividad Controlada', 'Enfocarse en generar potencia máxima con técnica perfecta.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (91, 28, 'Descanso Completo', 'Respetar tiempos completos de recuperación entre series explosivas.', 'En cada sesión');

-- Plan 29: Resistencia Cardiaca (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (92, 29, 'Ritmo Constante', 'Mantener ritmo constante durante entrenamientos de resistencia.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (93, 29, 'Umbral de Esfuerzo', 'Aprender a reconocer y mantener umbral de esfuerzo óptimo.', 'En cada sesión');

-- Plan 30: Tonificación Femenina (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (94, 30, 'Enfoque en Forma', 'Priorizar forma y tonificación sobre peso levantado.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (95, 30, 'Celebración de Progreso', 'Celebrar pequeñas mejoras en tonificación y fuerza.', 'Semanalmente');

-- Plan 31: Volumen para Ectomorfos (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (96, 31, 'Consistencia Alimenticia', 'Mantener superávit calórico constante incluso sin hambre.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (97, 31, 'Entrenamiento con Volumen', 'Completar todas las series y repeticiones programadas.', 'En cada sesión');

-- Plan 32: Definición para Endomorfos (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (98, 32, 'Paciencia Metabólica', 'Mantener consistencia a pesar de metabolismo lento inicial.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (99, 32, 'Movimiento Extra', 'Incorporar actividad física adicional no programada.', 'Diario');

-- Plan 33: Entrenamiento Nocturno (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (100, 33, 'Adaptación Circadiana', 'Adaptar rutina a horarios nocturnos de manera consistente.', 'Diario');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (101, 33, 'Luz Controlada', 'Controlar exposición a luz artificial durante horarios nocturnos.', 'Diario');

-- Plan 34: Fitness para Viajeros (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (102, 34, 'Improvisación Creativa', 'Aprender a adaptar ejercicios según equipamiento disponible.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (103, 34, 'Minimalismo', 'Enfocarse en ejercicios que requieren mínimo o ningún equipo.', 'En cada sesión');

-- Plan 35: Preparación Física Militar (2 hábitos)
INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (104, 35, 'Mentalidad de Supervivencia', 'Enfocar entrenamientos como preparación para situaciones extremas.', 'En cada sesión');

INSERT INTO Habitos (id_habito, planfitness, nombre_habito, descripcion, frecuencia) 
VALUES (105, 35, 'Autosuficiencia', 'Desarrollar capacidad de entrenar sin dependencia de instalaciones.', 'En cada sesión');
commit;

