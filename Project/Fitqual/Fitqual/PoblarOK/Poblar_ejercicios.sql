-- POBLAR TABLA EJERCICIOS (350 ejercicios - 5 por rutina en promedio)

-- Rutina 1: Full Body Principiante (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (1, 1, 'Sentadillas con Peso Corporal', 3, 15, 'Ejercicio fundamental para piernas y glúteos. Mantener espalda recta y bajar hasta que muslos estén paralelos al suelo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (2, 1, 'Flexiones de Rodillas', 3, 12, 'Variación de flexiones para principiantes. Mantener core activo y bajar pecho hasta casi tocar el suelo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (3, 1, 'Remo con Mancuernas', 3, 12, 'Trabajo de espalda. Mantener espalda recta y llevar mancuernas hacia el torso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (4, 1, 'Press de Hombros', 3, 12, 'Desarrollo de hombros. Empujar peso hacia arriba con control completo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (5, 1, 'Plancha Frontal', 3, NULL, 'Fortalecimiento de core. Mantener posición de plancha con cuerpo recto como tabla.', 60);

-- Rutina 2: Cardio Quema Grasa (3 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (6, 2, 'Cinta de Correr', 1, NULL, 'Cardio en estado estable. Mantener ritmo constante que permita hablar pero con dificultad.', 30);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (7, 2, 'Elíptica', 1, NULL, 'Ejercicio de bajo impacto. Mantener postura erguida y usar brazos para mayor intensidad.', 10);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (8, 2, 'Bicicleta Estática', 1, NULL, 'Cardio para piernas. Mantener cadencia constante de 80-90 RPM.', 5);

-- Rutina 3: Push-Pull-Legs (8 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (9, 3, 'Press de Banca', 4, 8, 'Ejercicio rey para pecho. Bajar barra controladamente hasta el pecho y empujar explosivamente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (10, 3, 'Fondos en Paralelas', 3, 10, 'Desarrollo de pecho y tríceps. Mantener torso inclinado ligeramente hacia adelante.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (11, 3, 'Press Militar', 4, 8, 'Desarrollo de hombros. Empujar peso por encima de la cabeza con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (12, 3, 'Extensiones de Tríceps', 3, 12, 'Aislamiento de tríceps. Mantener codos fijos y extender antebrazos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (13, 3, 'Elevaciones Laterales', 3, 15, 'Desarrollo de hombros laterales. Elevar pesos hasta altura de hombros.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (14, 3, 'Cruce de Poleas', 3, 15, 'Aislamiento de pecho. Mantener ligera flexión de codos y juntar manos frente al pecho.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (15, 3, 'Press Francés', 3, 12, 'Tríceps con barra. Bajar barra controladamente hacia la frente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (16, 3, 'Flexiones Diamante', 3, 15, 'Enfoque en tríceps. Manos juntas formando diamante bajo el pecho.', NULL);

-- Rutina 4: Cardio Ligero Volumen (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (17, 4, 'Caminata Rápida', 1, NULL, 'Cardio de baja intensidad. Mantener ritmo que permita conversación cómoda.', 20);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (18, 4, 'Bicicleta Recreativa', 1, NULL, 'Cardio suave para recuperación. Resistencia mínima, cadencia constante.', 10);

-- Rutina 5: Carrera Larga Progresiva (1 ejercicio)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (19, 5, 'Carrera de Fondo', 1, NULL, 'Entrenamiento de resistencia para maratón. Incrementar distancia gradualmente cada semana.', 120);

-- Rutina 6: Entrenamiento de Velocidad (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (20, 6, 'Series de 400m', 8, NULL, 'Desarrollo de velocidad. Correr 400m a ritmo rápido, recuperar 90 segundos caminando.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (21, 6, 'Series de 200m', 10, NULL, 'Mejora de aceleración. Correr 200m máximo esfuerzo, recuperar 60 segundos.', 1);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (22, 6, 'Cuestas', 6, NULL, 'Desarrollo de potencia. Correr en pendiente, recuperar bajando caminando.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (23, 6, 'Trote de Recuperación', 1, NULL, 'Recuperación activa entre series. Mantener ritmo muy suave.', 10);

-- Rutina 7: Carrera Recuperación (1 ejercicio)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (24, 7, 'Trote Suave', 1, NULL, 'Recuperación activa. Ritmo cómodo que permita respirar con facilidad.', 45);

-- Rutina 8: Yoga Matutino Energizante (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (25, 8, 'Saludo al Sol', 3, NULL, 'Secuencia completa de yoga para calentar y energizar todo el cuerpo.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (26, 8, 'Postura del Guerrero II', 3, NULL, 'Fortalecimiento de piernas y apertura de caderas. Mantener 5 respiraciones profundas.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (27, 8, 'Postura del Árbol', 3, NULL, 'Equilibrio y concentración. Mantener posición sobre una pierna.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (28, 8, 'Postura del Perro Boca Abajo', 3, NULL, 'Estiramiento completo posterior. Mantener 8-10 respiraciones.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (29, 8, 'Postura de la Cobra', 3, NULL, 'Fortalece espalda y abre pecho. Elevar torso usando fuerza de espalda.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (30, 8, 'Meditación Sentada', 1, NULL, 'Calma mental y enfoque. Concentrarse en respiración.', 10);

-- Rutina 9: Yoga Nocturno Relajante (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (31, 9, 'Postura del Niño', 3, NULL, 'Relajación y estiramiento suave de espalda. Mantener 10 respiraciones profundas.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (32, 9, 'Postura de la Mariposa', 3, NULL, 'Apertura de caderas y relajación. Balancear suavemente las piernas.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (33, 9, 'Torsión Sentada', 3, NULL, 'Descompresión vertebral y masaje órganos internos.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (34, 9, 'Postura de las Piernas en la Pared', 1, NULL, 'Relajación profunda y mejora circulación. Mantener 5-10 minutos.', 8);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (35, 9, 'Relajación Final', 1, NULL, 'Relajación consciente de todo el cuerpo. Escanear cuerpo de pies a cabeza.', 6);

-- Rutina 10: HIIT Full Body (8 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (36, 10, 'Burpees', 5, 12, 'Ejercicio completo de cuerpo entero. Combinación de flexión, salto y plancha.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (37, 10, 'Mountain Climbers', 5, 20, 'Core y cardio. Alternar rodillas hacia pecho rápidamente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (38, 10, 'Saltos de Tijera', 5, 30, 'Cardio y coordinación. Saltar abriendo piernas y brazos simultáneamente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (39, 10, 'Flexiones Explosivas', 5, 15, 'Fuerza superior y potencia. Empujar con fuerza para que manos dejen el suelo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (40, 10, 'Sentadillas con Salto', 5, 15, 'Potencia de piernas. Descender en sentadilla y explotar hacia arriba.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (41, 10, 'Plancha con Toques de Hombro', 5, 20, 'Core y estabilidad. Mantener cadera fija mientras se tocan hombros.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (42, 10, 'Escaladores en Cruz', 5, 20, 'Core rotacional. Llevar rodilla hacia codo contrario.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (43, 10, 'Saltos de Caja', 5, 12, 'Potencia y explosividad. Saltar sobre caja con aterrizaje suave.', NULL);

-- Rutina 11: HIIT Cardio Extremo (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (44, 11, 'Sprints en Sitio', 8, NULL, 'Máxima intensidad cardiovascular. Correr en sitio a máxima velocidad.', 30);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (45, 11, 'Saltos de Rodillas al Pecho', 8, 15, 'Cardio y core. Saltar elevando rodillas lo más alto posible.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (46, 11, 'Skater Jumps', 8, 20, 'Cardio y equilibrio. Saltar lateralmente imitando patinador.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (47, 11, 'High Knees', 8, 30, 'Cardio y coordinación. Correr en sitio elevando rodillas alto.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (48, 11, 'Butt Kicks', 8, 30, 'Cardio y movilidad. Correr en sitio tocando glúteos con talones.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (49, 11, 'Jumping Jacks', 8, 25, 'Cardio completo. Saltos continuos abriendo piernas y brazos.', NULL);

-- Rutina 12: Definición Superior (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (50, 12, 'Press Inclinado con Mancuernas', 4, 10, 'Parte superior de pecho. Bajar mancuernas hacia clavículas.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (51, 12, 'Dominadas Asistidas', 4, 8, 'Espalda ancha. Usar asistencia necesaria para mantener técnica perfecta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (52, 12, 'Elevaciones Frontales', 3, 15, 'Hombros frontales. Elevar peso frente al cuerpo con brazos rectos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (53, 12, 'Curl de Bíceps con Barra', 4, 12, 'Bíceps completo. Mantener codos pegados al cuerpo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (54, 12, 'Extensiones de Tríceps con Cuerda', 4, 15, 'Definición de tríceps. Separar manos al final del movimiento.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (55, 12, 'Encogimientos de Hombros', 3, 20, 'Trapecios. Elevar hombros hacia orejas con peso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (56, 12, 'Face Pulls', 3, 15, 'Hombros posteriores. Jalar cuerda hacia cara separando manos.', NULL);

-- Rutina 13: Definición Inferior (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (57, 13, 'Sentadillas Búlgaras', 4, 12, 'Piernas unilaterales. Pierna trasera elevada, profundidad controlada.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (58, 13, 'Peso Muerto Rumano', 4, 10, 'Isquiotibiales y glúteos. Mantener piernas casi rectas, cadera atrás.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (59, 13, 'Hip Thrust', 4, 15, 'Glúteos máximo. Elevar cadera hasta paralelo con torso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (60, 13, 'Extensiones de Cuádriceps', 3, 15, 'Aislamiento de cuádriceps. Extender piernas con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (61, 13, 'Curl de Femoral', 3, 15, 'Aislamiento de isquiotibiales. Flexionar piernas contra resistencia.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (62, 13, 'Elevaciones de Pantorrillas', 4, 20, 'Gemelos. Elevar talones máximo, bajar controladamente.', NULL);

-- Rutina 14: Movilidad Hombro Inicial (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (63, 14, 'Péndulos de Hombro', 3, NULL, 'Movilidad pasiva. Balancear arm suavemente en círculos.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (64, 14, 'Estiramiento de Pectoral en Puerta', 3, NULL, 'Apertura pectoral. Mantener 30 segundos por lado.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (65, 14, 'Deslizamientos en Pared', 3, 15, 'Movilidad escapular. Deslizar brazos por pared arriba y abajo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (66, 14, 'Rotaciones Externas con Banda', 3, 15, 'Manguito rotador. Mantener codo pegado al costado.', NULL);

-- Rutina 15: Fortalecimiento Progresivo (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (67, 15, 'Press de Hombro con Banda', 3, 12, 'Fuerza progresiva hombros. Usar banda de resistencia.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (68, 15, 'Remo Alto con Banda', 3, 15, 'Trapecios y deltoides. Elevar codos alto.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (69, 15, 'Rotaciones Internas', 3, 15, 'Fuerza rotadora interna. Usar banda o peso ligero.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (70, 15, 'Flexiones en Pared', 3, 15, 'Fuerza progresiva pecho. Inclinación según tolerancia.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (71, 15, 'Elevaciones Laterales Ligeras', 3, 15, 'Deltoides laterales. Peso muy ligero, técnica perfecta.', NULL);

-- Rutina 16: Entrenamiento Funcional Básico (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (72, 16, 'Sentadillas con Peso Corporal', 4, 15, 'Patrón fundamental. Simula sentarse y levantarse.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (73, 16, 'Zancadas Alternas', 3, 12, 'Movimiento unipodal. Alternar piernas con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (74, 16, 'Empuje de Pared', 3, 15, 'Patrón de empuje. Simula empujar objetos pesados.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (75, 16, 'Tracción con Banda', 3, 15, 'Patrón de tracción. Simula jalar objetos hacia uno.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (76, 16, 'Elevación de Cadera', 3, 15, 'Patrón de cadera. Fortalece cadena posterior.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (77, 16, 'Rotación de Torso', 3, 12, 'Estabilidad rotacional. Rotar torso con control.', NULL);

-- Rutina 17: Core y Estabilidad (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (78, 17, 'Plancha Frontal', 3, NULL, 'Estabilidad core completa. Mantener alineación perfecta.', 60);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (79, 17, 'Plancha Lateral', 3, NULL, 'Estabilidad lateral. Cadera elevada, cuerpo recto.', 45);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (80, 17, 'Bird Dog', 3, 12, 'Coordinación y estabilidad. Extender brazo y pierna opuesta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (81, 17, 'Puente de Glúteos', 3, 15, 'Cadena posterior. Elevar cadera con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (82, 17, 'Dead Bug', 3, 15, 'Core y coordinación. Mover extremidades opuestas manteniendo espalda plana.', NULL);

-- Rutina 18: Simetría Superior (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (83, 18, 'Press Inclinado con Barra', 4, 8, 'Desarrollo parte superior pectoral. Ángulo 30-45 grados.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (84, 18, 'Remo con Barra', 4, 8, 'Espesor de espalda. Mantener torso paralelo al suelo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (85, 18, 'Elevaciones Laterales con Mancuerna', 4, 12, 'Anchura de hombros. Elevar hasta altura hombros.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (86, 18, 'Curl Martillo', 3, 12, 'Bíceps braquial y antebrazos. Mantener palmas enfrentadas.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (87, 18, 'Extensiones de Tríceps en Polea Alta', 4, 15, 'Definición tríceps. Mantener codos fijos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (88, 18, 'Encogimientos con Barra', 3, 15, 'Trapecios superiores. Elevar hombros con peso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (89, 18, 'Cruces en Polea Alta', 3, 15, 'Detalles pectorales. Cruzar manos frente al pecho.', NULL);

-- Rutina 19: Glúteos y Piernas (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (90, 19, 'Sentadillas Profundas', 4, 10, 'Rango completo piernas. Bajar más allá del paralelo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (91, 19, 'Peso Muerto Sumo', 4, 8, 'Glúteos e isquiotibiales. Posición amplia, espalda recta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (92, 19, 'Hip Thrust con Barra', 4, 12, 'Activación máxima glúteos. Elevar cadera hasta hiperextensión.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (93, 19, 'Abducciones de Cadera', 3, 20, 'Glúteos medios. Abrir piernas contra resistencia.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (94, 19, 'Patadas de Glúteo', 3, 15, 'Glúteos máximos. Patada hacia atrás con pierna recta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (95, 19, 'Sentadillas Búlgaras', 3, 12, 'Piernas unilaterales. Enfoque en equilibrio y fuerza.', NULL);

-- Rutina 20: Cardio de Definición (3 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (96, 20, 'Cinta de Correr en Pendiente', 1, NULL, 'Cardio intenso para definición. Inclinación 5-8%, ritmo constante.', 25);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (97, 20, 'Escaladora', 1, NULL, 'Cardio completo cuerpo. Mantener ritmo constante y controlado.', 15);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (98, 20, 'Bicicleta de Spinning', 1, NULL, 'Cardio de alta resistencia. Simular subidas con alta resistencia.', 5);

-- Rutina 21: Día Sentadilla (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (99, 21, 'Sentadillas con Barra', 5, 5, 'Levantamiento principal. Profundidad competencia, espalda recta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (100, 21, 'Sentadillas Frontales', 3, 8, 'Enfoque en cuádriceps. Barra frente, torso erguido.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (101, 21, 'Extensiones de Pierna', 3, 12, 'Aislamiento cuádriceps. Rango completo de movimiento.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (102, 21, 'Peso Muerto Rumano', 3, 10, 'Cadena posterior. Enfoque en isquiotibiales y glúteos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (103, 21, 'Elevaciones de Gemelos Sentado', 4, 15, 'Sóleos. Gemelos inferiores con rodillas flexionadas.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (104, 21, 'Abdominales en Rueda', 3, 10, 'Core fuerte. Extender y retraer con control.', NULL);

-- Rutina 22: Día Press Banca y Peso Muerto (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (105, 22, 'Press de Banca', 5, 5, 'Levantamiento principal. Técnica competencia, contacto pecho.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (106, 22, 'Peso Muerto Convencional', 5, 5, 'Levantamiento principal. Espalda recta, cadera adecuada.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (107, 22, 'Press Cerrado', 3, 8, 'Tríceps y pecho. Manos separadas al ancho de hombros.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (108, 22, 'Remo con Barra', 3, 8, 'Espalda para peso muerto. Torso paralelo al suelo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (109, 22, 'Curl de Bíceps con Barra', 3, 10, 'Bíceps para estabilidad. Mantener codos fijos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (110, 22, 'Encogimientos', 3, 12, 'Trapecios para estabilidad. Elevar hombros con peso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (111, 22, 'Hiperextensiones', 3, 12, 'Espalda baja. Fortalecimiento para peso muerto.', NULL);

-- Rutina 23: Estiramientos Básicos (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (112, 23, 'Estiramiento de Isquiotibiales Sentado', 3, NULL, 'Flexibilidad posterior. Mantener 30 segundos por pierna.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (113, 23, 'Estiramiento de Cuádriceps', 3, NULL, 'Flexibilidad anterior. Mantener 30 segundos por pierna.', 2);

-- Rutina 24: Movilidad General (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (114, 24, 'Círculos de Brazos', 3, 15, 'Movilidad hombros. Círculos grandes hacia adelante y atrás.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (115, 24, 'Giros de Torso', 3, 12, 'Movilidad columna. Rotar torso suavemente de lado a lado.', NULL);

-- Rutina 25: Calistenia Militar (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (116, 25, 'Flexiones Militares', 4, 15, 'Fuerza superior cuerpo. Manos al ancho de hombros.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (117, 25, 'Sentadillas con Salto', 4, 12, 'Potencia inferior. Explosividad y condición.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (118, 25, 'Dominadas', 4, 8, 'Fuerza espalda. Máximo rango de movimiento.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (119, 25, 'Fondos en Banco', 4, 15, 'Tríceps y pecho. Descender hasta 90 grados codos.', NULL);

-- Rutina 26: Entrenamiento Táctico (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (120, 26, 'Correr con Chaleco', 1, NULL, 'Cardio con carga adicional. Simular condiciones de campo.', 20);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (121, 26, 'Circuito de Obstáculos', 3, NULL, 'Condición completa. Combinar diferentes ejercicios funcionales.', 15);

-- Rutina 27: Prenatal Segundo Trimestre (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (122, 27, 'Sentadillas de Sumo', 3, 12, 'Seguro para embarazo. Posición amplia para espacio bebé.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (123, 27, 'Press de Hombros Sentado', 3, 12, 'Fuerza superior segura. Evitar sobrecarga lumbar.', NULL);

-- Rutina 28: Preparación Parto (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (124, 28, 'Puente de Glúteos', 3, 15, 'Preparación para parto. Fortalecimiento cadera segura.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (125, 28, 'Estiramiento de Caderas', 3, NULL, 'Flexibilidad para parto. Mantener 30 segundos por lado.', 2);

-- Rutina 29: Fuerza para Adultos (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (126, 29, 'Levantarse de Silla', 3, 10, 'Fuerza funcional. Levantarse sin usar manos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (127, 29, 'Step Ups Bajos', 3, 12, 'Movilidad escaleras. Paso arriba y abajo con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (128, 29, 'Press de Hombros Sentado', 3, 12, 'Fuerza superior. Peso ligero, rango completo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (129, 29, 'Remo con Bandas Sentado', 3, 15, 'Espalda y postura. Tracción hacia atrás con bandas.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (130, 29, 'Elevaciones de Talones', 3, 20, 'Equilibrio y pantorrillas. Usar soporte para equilibrio.', NULL);

-- Rutina 30: Cardio Saludable (3 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (131, 30, 'Caminata en Cinta', 1, NULL, 'Cardio seguro. Ritmo que permita conversación cómoda.', 25);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (132, 30, 'Bicicleta Reclinada', 1, NULL, 'Cardio sin impacto. Posición reclinada para espalda.', 10);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (133, 30, 'Elíptica Suave', 1, NULL, 'Cardio completo. Baja resistencia, movimiento fluido.', 5);

-- Rutina 31: Calistenia Básica (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (134, 31, 'Flexiones Inclinadas', 4, 12, 'Progresión flexiones. Menos intensidad, misma técnica.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (135, 31, 'Sentadillas con Salto Suave', 3, 15, 'Potencia controlada. Saltos bajos con aterrizaje suave.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (136, 31, 'Fondos en Banco', 3, 10, 'Tríceps y pecho. Usar silla o banco estable.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (137, 31, 'Plancha Modificada', 3, NULL, 'Core progresivo. Rodillas en suelo si es necesario.', 45);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (138, 31, 'Elevaciones de Piernas Acostado', 3, 15, 'Core inferior. Piernas rectas, control completo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (139, 31, 'Puente de Glúteos', 3, 15, 'Cadena posterior. Elevar cadera con control.', NULL);

-- Rutina 32: Progresiones Calistenia (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (140, 32, 'Flexiones Negativas', 3, 8, 'Fuerza excéntrica. Bajar lentamente, subir con ayuda.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (141, 32, 'Sentadillas Pistol Asistidas', 3, 6, 'Fuerza unipodal. Usar apoyo para equilibrio.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (142, 32, 'Dominadas Negativas', 3, 5, 'Progresión dominadas. Saltar arriba, bajar lentamente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (143, 32, 'Plancha con Elevación de Brazo', 3, 10, 'Estabilidad core. Alternar elevación de brazos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (144, 32, 'L-Sit en Silla', 3, NULL, 'Fuerza core y cadera. Mantener piernas extendidas.', 20);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (145, 32, 'Flexiones en Pica', 3, 8, 'Fuerza hombros. Cadera elevada, cuerpo en V.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (146, 32, 'Shrimp Squats', 3, 8, 'Sentadilla unilateral. Pierna trasera agarrada.', NULL);

-- Rutina 33: Técnica de Golpes Boxeo (8 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (147, 33, 'Jab de Fondo', 4, 20, 'Golpe fundamental. Extensión completa, retracción rápida.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (148, 33, 'Directo de Derecha', 4, 15, 'Golpe de poder. Rotación cadera y hombros.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (149, 33, 'Gancho de Izquierda', 4, 12, 'Golpe curvo. Codo a 90 grados, rotación corporal.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (150, 33, 'Gancho de Derecha', 4, 12, 'Golpe lateral. Proteger mandíbula con mano libre.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (151, 33, 'Uppercut de Izquierda', 4, 10, 'Golpe ascendente. Desde abajo hacia arriba.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (152, 33, 'Uppercut de Derecha', 4, 10, 'Poder ascendente. Rodillas flexionadas, explosividad.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (153, 33, 'Defensa de Cabeza', 4, 15, 'Esquivas. Movimiento cintura, mantener equilibrio.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (154, 33, 'Bloqueos con Manoplas', 4, 20, 'Defensa y precisión. Coordinación con compañero.', NULL);

-- Rutina 34: Condición Boxística (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (155, 34, 'Sombra con Pesas Ligeras', 3, NULL, 'Resistencia y técnica. Combinar todos los golpes.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (156, 34, 'Saco Pesado Combinaciones', 4, NULL, 'Potencia y resistencia. Series de 3 minutos.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (157, 34, 'Saco de Velocidad', 4, NULL, 'Rapidez y precisión. Golpes rápidos y técnicos.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (158, 34, 'Cuerda para Saltar', 4, NULL, 'Coordinación y condición. Variar patrones de salto.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (159, 34, 'Sparring Controlado', 3, NULL, 'Aplicación práctica. Técnica con compañero.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (160, 34, 'Ejercicios de Cuello', 3, 15, 'Resistencia a golpes. Fortalecimiento muscular cervical.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (161, 34, 'Footwork en Escalera', 4, NULL, 'Movilidad y agilidad. Patrones complejos de pies.', 2);

-- Rutina 35: Técnica de Crol (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (162, 35, 'Patada de Crol con Tabla', 4, NULL, 'Propulsión piernas. Cadera como eje, pies flexibles.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (163, 35, 'Brazada de Crol con Pullbuoy', 4, NULL, 'Aislamiento brazos. Enfoque en técnica de brazada.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (164, 35, 'Respiración Bilateral', 4, NULL, 'Equilibrio respiratorio. Respirar cada 3 brazadas.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (165, 35, 'Crol Completo Lento', 4, NULL, 'Coordinación total. Enfoque en técnica sobre velocidad.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (166, 35, 'Ejercicios de Rotación', 4, NULL, 'Rotación corporal. Hombros-cadera alineados.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (167, 35, 'Salidas desde Borde', 3, 8, 'Técnica de salida. Entrada limpia y streamline.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (341, 35, 'Nado con Patada de Crol', 4, NULL, 'Técnica piernas. Aislamiento de patada con tabla.', 3);

-- Rutina 36: Resistencia en Agua (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (168, 36, 'Nado Continuo Crol', 1, NULL, 'Resistencia base. Mantener ritmo constante.', 15);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (169, 36, 'Series de 100m', 8, NULL, 'Resistencia velocidad. Recuperación 30 segundos.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (170, 36, 'Nado con Palas', 4, NULL, 'Fuerza brazos. Mayor resistencia, técnica perfecta.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (171, 36, 'Nado con Aletas', 4, NULL, 'Propulsión y técnica. Enfoque en posición corporal.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (172, 36, 'Nado de Recuperación', 1, NULL, 'Vuelta a la calma. Estilo suave, técnica consciente.', 5);

-- Rutina 37: WOD Principiante (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (173, 37, 'Air Squats', 3, 15, 'Sentadillas aire. Técnica perfecta, profundidad completa.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (174, 37, 'Push Press', 3, 10, 'Empuje potencia. Usar piernas para impulsar peso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (175, 37, 'Kettlebell Swing', 3, 12, 'Cadena posterior. Balanceo controlado con cadera.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (176, 37, 'Box Jumps', 3, 10, 'Salto caja. Altura segura, aterrizaje controlado.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (177, 37, 'Wall Balls', 3, 12, 'Fuerza y coordinación. Sentadilla y lanzamiento.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (178, 37, 'Burpees Modificados', 3, 8, 'Ejercicio completo. Sin push-up si es necesario.', NULL);

-- Rutina 38: Entrenamiento por Intervalos (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (179, 38, 'Sprints en Cinta', 8, NULL, 'Intervalos alta intensidad. 30 segundos sprint, 60 recuperación.', 1);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (180, 38, 'Burpees', 8, 10, 'Ejercicio metabólico. Máxima intensidad durante intervalos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (181, 38, 'Mountain Climbers', 8, 20, 'Core y cardio. Ritmo rápido durante intervalos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (182, 38, 'Jump Squats', 8, 15, 'Potencia inferior. Explosividad en cada intervalo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (183, 38, 'Plank Jacks', 8, 20, 'Core y cardio. Mantener posición de plancha.', NULL);

-- Rutina 39: Pilates Mat Básico (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (184, 39, 'The Hundred', 1, NULL, 'Calentamiento y respiración. 100 pulsaciones con piernas elevadas.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (185, 39, 'Roll Up', 3, 8, 'Flexión vertebral. Desenrollar y enrollar con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (186, 39, 'Single Leg Circles', 3, 10, 'Movilidad cadera. Círculos controlados con pierna recta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (187, 39, 'Rolling Like a Ball', 3, 8, 'Masaje espalda y equilibrio. Balanceo controlado.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (188, 39, 'Single Leg Stretch', 3, 10, 'Coordinación y core. Alternar piernas con estabilidad.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (189, 39, 'Spine Stretch Forward', 3, 8, 'Flexibilidad espalda. Flexión hacia adelante vértebra por vértebra.', NULL);

-- Rutina 40: Pilates Avanzado (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (190, 40, 'Teaser', 3, 6, 'Fuerza core y equilibrio. Transición V-sit controlada.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (191, 40, 'Swan Dive', 3, 8, 'Extensión espalda. Elevación controlada del torso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (192, 40, 'Jackknife', 3, 6, 'Fuerza completa. Piernas sobre cabeza con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (193, 40, 'Boomerang', 3, 5, 'Coordinación avanzada. Combinación equilibrio y flexibilidad.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (194, 40, 'Control Balance', 3, 6, 'Fuerza y equilibrio. Transición piernas sobre cabeza.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (195, 40, 'Scissors', 3, 10, 'Piernas y core. Tijeras controladas con estabilidad.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (196, 40, 'Bicycle', 3, 12, 'Coordinación avanzada. Círculos con piernas en el aire.', NULL);

-- Rutina 41: Coreografía Básica (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (197, 41, 'Grapevine', 4, NULL, 'Pasos laterales. Cruzar piernas alternadamente.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (198, 41, 'Step Touch', 4, NULL, 'Movimiento básico. Paso lateral y juntar pies.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (199, 41, 'V-Step', 4, NULL, 'Movimiento en V. Abrir y cerrar piernas en ángulo.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (200, 41, 'Mambo', 4, NULL, 'Ritmo latino. Paso adelante y atrás con cadera.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (201, 41, 'Cha Cha Cha', 4, NULL, 'Pasos rápidos. Triple paso con ritmo característico.', 2);

-- Rutina 42: Dance Cardio Intenso (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (202, 42, 'Jumping Jacks con Ritmo', 4, 30, 'Cardio con coordinación. Sincronizar con música.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (203, 42, 'High Knees con Música', 4, 25, 'Cardio intenso. Rodillas altas al ritmo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (204, 42, 'Skater Jumps con Coreografía', 4, 20, 'Potencia lateral. Combinar con movimientos de brazos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (205, 42, 'Burpees con Baile', 4, 12, 'Ejercicio completo. Incorporar elementos de baile.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (206, 42, 'Squat Jumps con Ritmo', 4, 15, 'Potencia inferior. Saltos al compás de la música.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (207, 42, 'Kickboxing Dance', 4, 20, 'Combinación artes marciales y baile. Golpes coreografiados.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (342, 42, 'Shuffle Dance', 4, NULL, 'Cardio y coordinación. Pasos laterales rápidos con ritmo.', 2);

-- Rutina 43: Recuperación Postparto Inicial (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (208, 43, 'Respiración Diafragmática', 3, NULL, 'Recuperación core. Respiración profunda activando diafragma.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (209, 43, 'Contracciones de Suelo Pélvico', 3, 15, 'Kegels. Contracer y relajar músculos del suelo pélvico.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (210, 43, 'Inclinaciones Pélvicas', 3, 12, 'Movilidad cadera. Acostada, inclinar pelvis suavemente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (211, 43, 'Elevaciones de Piernas Laterales', 3, 10, 'Cadera segura. Acostada de lado, elevar pierna superior.', NULL);

-- Rutina 44: Fortalecimiento Postparto (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (212, 44, 'Puente de Glúteos', 3, 15, 'Cadena posterior segura. Elevar cadera con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (213, 44, 'Bird Dog Modificado', 3, 10, 'Core y estabilidad. Extensiones alternas desde cuadrupedia.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (214, 44, 'Sentadillas con Soporte', 3, 12, 'Piernas seguras. Usar silla o pared como apoyo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (215, 44, 'Press de Pared', 3, 15, 'Pecho y brazos. Empuje contra pared con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (216, 44, 'Plancha de Antebrazos Modificada', 3, NULL, 'Core progresivo. Rodillas en suelo si es necesario.', 30);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (217, 44, 'Caminata en Sitio', 1, NULL, 'Cardio suave. Mantener ritmo constante y controlado.', 10);

-- Rutina 45: Fuerza Senior Adaptada (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (218, 45, 'Levantarse de Silla', 3, 10, 'Fuerza funcional. Levantarse sin usar manos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (219, 45, 'Step Ups Bajos', 3, 12, 'Movilidad escaleras. Paso arriba y abajo con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (220, 45, 'Press de Hombros Sentado', 3, 12, 'Fuerza superior. Peso ligero, rango completo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (221, 45, 'Remo con Bandas Sentado', 3, 15, 'Espalda y postura. Tracción hacia atrás con bandas.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (222, 45, 'Elevaciones de Talones', 3, 20, 'Equilibrio y pantorrillas. Usar soporte para equilibrio.', NULL);

-- Rutina 46: Equilibrio y Movilidad (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (223, 46, 'Equilibrio Unipodal', 3, NULL, 'Estabilidad. Mantener equilibrio sobre una pierna.', 30);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (224, 46, 'Caminata en Línea Recta', 3, NULL, 'Coordinación. Caminar poniendo talón-punta.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (225, 46, 'Giros Controlados', 3, 8, 'Movilidad y equilibrio. Girar 360 grados con control.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (226, 46, 'Tai Chi Básico', 1, NULL, 'Movimiento fluido. Secuencia simple de Tai Chi.', 8);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (227, 46, 'Estiramiento de Gemelos', 3, NULL, 'Flexibilidad. Mantener 30 segundos por pierna.', 2);

-- Rutina 47: Natación Triatlón (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (228, 47, 'Crol con Respiración Cada 2', 4, NULL, 'Respiración eficiente. Patrón bilateral constante.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (229, 47, 'Nado con Traje de Neopreno', 3, NULL, 'Adaptación equipo. Familiarizarse con flotabilidad.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (230, 47, 'Navegación en Agua Abierta', 4, NULL, 'Orientación. Levantar cabeza para ver dirección.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (231, 47, 'Estelas Grupales', 3, NULL, 'Técnica competencia. Nadar cerca de otros nadadores.', 4);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (232, 47, 'Salidas en Agua Profunda', 3, 6, 'Salida triatlón. Comenzar nadando desde agua profunda.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (343, 47, 'Nado en Aguas Abiertas', 3, NULL, 'Adaptación ambiente. Práctica en condiciones reales.', 8);

-- Rutina 48: Transiciones y Brick (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (233, 48, 'Transición Rápida', 5, NULL, 'Cambio eficiente. Practicar cambio de equipo rápidamente.', 1);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (234, 48, 'Brick Session', 3, NULL, 'Adaptación muscular. Ciclismo inmediatamente seguido de carrera.', 15);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (235, 48, 'Montaje y Desmontaje Bici', 4, NULL, 'Habilidad técnica. Práctica rápida de transiciones.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (236, 48, 'Carrera con Piernas de Ciclista', 1, NULL, 'Adaptación. Correr después de sesión de ciclismo.', 10);

-- Rutina 49: Movilidad Completa (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (237, 49, 'Rotaciones de Cuello', 3, 10, 'Movilidad cervical. Círculos suaves en ambas direcciones.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (238, 49, 'Círculos de Hombros', 3, 12, 'Articulación escapular. Círculos grandes hacia adelante y atrás.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (239, 49, 'Rotaciones de Muñeca', 3, 15, 'Movilidad manos. Círculos y flexiones de muñecas.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (240, 49, 'Círculos de Cadera', 3, 10, 'Articulación coxofemoral. Círculos amplios en ambas direcciones.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (241, 49, 'Rotaciones de Tobillo', 3, 15, 'Movilidad pies. Círculos completos en ambas direcciones.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (242, 49, 'Giros de Columna', 3, 10, 'Movilidad vertebral. Rotaciones suaves de torso.', NULL);

-- Rutina 50: Flexibilidad Avanzada (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (243, 50, 'Split Frontal Progresivo', 3, NULL, 'Flexibilidad isquiotibiales. Mantener 60 segundos por lado.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (244, 50, 'Split Lateral', 3, NULL, 'Apertura caderas. Mantener 60 segundos por lado.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (245, 50, 'Puente Completo', 3, NULL, 'Flexibilidad espalda. Mantener posición 30 segundos.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (246, 50, 'Pigeon Pose Profunda', 3, NULL, 'Apertura caderas. Mantener 90 segundos por lado.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (247, 50, 'Straddle Sit', 3, NULL, 'Flexibilidad adductores. Mantener 60 segundos.', 3);

-- Rutina 51: Cardio en Ayunas (3 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (248, 51, 'Caminata Rápida en Ayunas', 1, NULL, 'Cardio suave. Intensidad baja-moderada en estado de ayuno.', 20);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (249, 51, 'Bicicleta Estática Suave', 1, NULL, 'Cardio sin impacto. Resistencia mínima en ayunas.', 8);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (250, 51, 'Elíptica en Ayunas', 1, NULL, 'Cardio completo. Ritmo constante y controlado.', 2);

-- Rutina 52: Fuerza en Ayunas (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (251, 52, 'Sentadillas con Peso Corporal', 3, 15, 'Fuerza inferior. Enfoque en técnica sobre intensidad.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (252, 52, 'Flexiones', 3, 12, 'Fuerza superior. Mantener técnica perfecta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (253, 52, 'Remo Invertido', 3, 12, 'Espalda. Usar mesa o barra fija.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (254, 52, 'Fondos en Silla', 3, 15, 'Tríceps. Usar silla estable para apoyo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (255, 52, 'Plancha', 3, NULL, 'Core. Mantener alineación perfecta.', 45);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (256, 52, 'Elevaciones de Gemelos', 3, 20, 'Pantorrillas. Rango completo de movimiento.', NULL);

-- Rutina 53: HIIT Quema Extrema (9 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (257, 53, 'Sprints All Out', 8, NULL, 'Máxima intensidad. 20 segundos máximo esfuerzo.', 1);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (258, 53, 'Burpees Complejos', 8, 10, 'Ejercicio metabólico. Combinación completa a máxima velocidad.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (259, 53, 'Mountain Climbers Explosivos', 8, 25, 'Core y cardio. Ritmo máximo durante intervalos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (260, 53, 'Jump Squats Potentes', 8, 15, 'Potencia inferior. Saltos máximos con buena técnica.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (261, 53, 'Push Ups Explosivos', 8, 12, 'Fuerza superior. Empuje explosivo durante intervalos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (262, 53, 'Plank to Push Up', 8, 10, 'Transición core. Cambio rápido entre plancha y flexión.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (263, 53, 'Tuck Jumps', 8, 12, 'Potencia y core. Saltos elevando rodillas al pecho.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (264, 53, 'Russian Twists', 8, 20, 'Core rotacional. Giros rápidos con o sin peso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (344, 53, 'Sprint Intervals', 8, NULL, 'Máxima intensidad. 30 segundos sprint, 90 recuperación.', 1);

-- Rutina 54: Tabata Protocol (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (265, 54, 'Squat Jumps Tabata', 8, NULL, '20 segundos trabajo, 10 segundos descanso x 8 rondas', 4);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (266, 54, 'Push Ups Tabata', 8, NULL, 'Máximas repeticiones en 20 segundos, 10 segundos descanso', 4);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (267, 54, 'Mountain Climbers Tabata', 8, NULL, 'Ritmo máximo durante intervalos de trabajo', 4);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (268, 54, 'Plank Tabata', 8, NULL, 'Mantener plancha durante intervalos de trabajo', 4);

-- Rutina 55: Yoga para Fuerza (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (269, 55, 'Chaturanga Dandasana', 3, 8, 'Fuerza completa. Transición controlada con core activo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (270, 55, 'Utkatasana', 3, NULL, 'Fuerza piernas. Mantener silla de yoga 60 segundos.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (271, 55, 'Vasisthasana', 3, NULL, 'Fuerza lateral. Plancha lateral con variaciones.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (272, 55, 'Bakasana', 3, NULL, 'Fuerza brazos y core. Mantener cuervo 30 segundos.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (273, 55, 'Navasana', 3, NULL, 'Core y equilibrio. Mantener barco 60 segundos.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (274, 55, 'Adho Mukha Vrksasana', 3, NULL, 'Fuerza superior. Parada de manos contra pared.', 2);

-- Rutina 56: Yoga para Flexibilidad (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (275, 56, 'Uttanasana', 3, NULL, 'Flexibilidad posterior. Mantener 90 segundos.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (276, 56, 'Paschimottanasana', 3, NULL, 'Flexibilidad isquiotibiales. Mantener 2 minutos.', 6);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (277, 56, 'Eka Pada Rajakapotasana', 3, NULL, 'Apertura caderas. Mantener 90 segundos por lado.', 5);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (278, 56, 'Ustrasana', 3, NULL, 'Flexibilidad espalda. Mantener camello 60 segundos.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (279, 56, 'Gomukhasana', 3, NULL, 'Flexibilidad hombros y caderas. Mantener 60 segundos.', 3);

-- Rutina 57: Entrenamiento Explosivo (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (280, 57, 'Power Cleans', 4, 5, 'Ejercicio olímpico completo. Técnica de cargada explosiva.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (281, 57, 'Box Jumps Altos', 4, 8, 'Potencia máxima. Altura desafiante con aterrizaje seguro.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (282, 57, 'Medicine Ball Slams', 4, 10, 'Potencia total. Golpear balón medicinal con máxima fuerza.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (283, 57, 'Broad Jumps', 4, 6, 'Potencia horizontal. Saltos largos con aterrizaje controlado.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (284, 57, 'Clap Push Ups', 4, 8, 'Fuerza explosiva superior. Aplaudir durante fase aérea.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (285, 57, 'Kettlebell Snatch', 4, 6, 'Potencia completa. Arranque con kettlebell a una mano.', NULL);

-- Rutina 58: Potencia Máxima (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (286, 58, 'Push Press', 5, 3, 'Fuerza-potencia. Usar piernas para impulsar peso overhead.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (287, 58, 'Jump Squats con Barra', 4, 5, 'Potencia con carga. Saltos con barra ligera en espalda.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (288, 58, 'Bench Press Explosivo', 5, 3, 'Velocidad en press. Barra ligera, movimiento explosivo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (289, 58, 'Depth Jumps', 4, 6, 'Potencia reactiva. Caer y explotar inmediatamente.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (290, 58, 'Ballistic Bench Press', 4, 5, 'Press balístico. Soltar barra en punto máximo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (345, 58, 'Medicine Ball Chest Pass', 4, 8, 'Potencia superior. Lanzar balón medicinal con fuerza.', NULL);

-- Rutina 59: Cardio de Resistencia (3 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (291, 59, 'Carrera Continua', 1, NULL, 'Resistencia aeróbica. Mantener ritmo constante por tiempo prolongado.', 40);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (292, 59, 'Fartlek Training', 1, NULL, 'Velocidad variable. Alternar ritmos rápido y lento espontáneamente.', 30);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (293, 59, 'Tempo Run', 1, NULL, 'Ritmo umbral. Mantener velocidad cómoda pero desafiante.', 25);

-- Rutina 60: Umbral Lactato (4 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (294, 60, 'Carrera en Umbral', 4, NULL, 'Intensidad umbral. Mantener ritmo justo debajo del máximo.', 8);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (295, 60, 'Hill Repeats', 6, NULL, 'Resistencia en pendiente. Subidas repetidas a ritmo fuerte.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (296, 60, 'Intervalos de 1000m', 5, NULL, 'Trabajo específico. Distancia media a ritmo umbral.', 4);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (297, 60, 'Recuperación Activa', 1, NULL, 'Vuelta a la calma. Trote muy suave entre intervalos.', 10);

-- Rutina 61: Tonificación Superior Femenina (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (298, 61, 'Lateral Raises', 4, 15, 'Hombros definidos. Elevaciones laterales con técnica perfecta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (299, 61, 'Bent Over Raises', 3, 15, 'Hombros posteriores. Inclinado, elevar pesos hacia los lados.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (300, 61, 'Tricep Kickbacks', 4, 15, 'Parte posterior brazo. Extensión con codo fijo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (301, 61, 'Bicep Curls', 4, 15, 'Brazos tonificados. Curl con mancuernas, rango completo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (302, 61, 'Upright Rows', 3, 12, 'Trapecios y hombros. Remo vertical con agarre estrecho.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (303, 61, 'Push Ups en Rodillas', 3, 15, 'Pecho y tríceps. Variación modificada para mejor técnica.', NULL);

-- Rutina 62: Tonificación Inferior Femenina (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (304, 62, 'Sumo Squats', 4, 15, 'Glúteos y adductores. Posición amplia, profundidad completa.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (305, 62, 'Curtsy Lunges', 4, 12, 'Glúteos laterales. Zancada cruzada hacia atrás.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (306, 62, 'Fire Hydrants', 3, 15, 'Glúteos medios. Elevación lateral desde cuadrupedia.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (307, 62, 'Glute Bridges', 4, 20, 'Activación glúteos. Elevación de cadera con squeeze máximo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (308, 62, 'Inner Thigh Lifts', 3, 20, 'Adductores. Acostada de lado, elevar pierna inferior.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (309, 62, 'Calf Raises', 4, 25, 'Pantorrillas definidas. Elevaciones con rango completo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (346, 62, 'Donkey Kicks', 3, 15, 'Glúteos máximos. Patada hacia atrás desde cuadrupedia.', NULL);

-- Rutina 63: Volumen para Delgados (7 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (310, 63, 'Bench Press', 4, 8, 'Masa pectoral. Progresión constante en peso.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (311, 63, 'Barbell Rows', 4, 8, 'Espesor espalda. Remo con barra, técnica estricta.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (312, 63, 'Overhead Press', 4, 8, 'Hombros completos. Press militar con barra.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (313, 63, 'Barbell Curls', 3, 10, 'Masa bíceps. Curl con barra, evitar balanceo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (314, 63, 'Skull Crushers', 3, 12, 'Tríceps volumen. Extensiones con barra EZ.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (315, 63, 'Squats', 4, 8, 'Masa inferior. Sentadillas con barra, profundidad completa.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (316, 63, 'Deadlifts', 3, 6, 'Masa total. Peso muerto para crecimiento general.', NULL);

-- Rutina 64: Nutrición y Descanso (2 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (317, 64, 'Meditación Nutricional', 1, NULL, 'Conciencia alimenticia. Meditar sobre relación con comida.', 15);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (318, 64, 'Técnicas de Relajación', 1, NULL, 'Optimización descanso. Práctica de relajación profunda.', 20);

-- Rutina 65: Quema Grasa Endomorfo (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (319, 65, 'Circuit Training', 4, NULL, 'Metabolismo acelerado. Circuito continuo de ejercicios.', 10);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (320, 65, 'Farmer"s Walks', 4, NULL, 'Metabolismo y fuerza. Caminar con peso en manos.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (321, 65, 'Battle Ropes', 4, NULL, 'Cardio intenso. Ondas con cuerdas pesadas.', 1);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (322, 65, 'Sled Pushes', 4, NULL, 'Metabolismo extremo. Empujar trineo cargado.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (323, 65, 'Rowing Machine', 4, NULL, 'Cardio completo. Remo a alta intensidad.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (324, 65, 'Jump Rope', 4, NULL, 'Metabolismo elevado. Saltar cuerda a ritmo rápido.', 2);

-- Rutina 66: Fuerza Metabólica (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (325, 66, 'Clean and Press', 4, 6, 'Ejercicio completo. Combinación de cargada y press.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (326, 66, 'Thrusters', 4, 8, 'Fuerza y cardio. Sentadilla seguida de press overhead.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (327, 66, 'Kettlebell Swings Pesados', 4, 12, 'Metabolismo y cadena posterior. Swing con peso desafiante.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (328, 66, 'Walking Lunges con Peso', 4, 10, 'Piernas y metabolismo. Zancadas caminando con carga.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (329, 66, 'Burpees con Salto', 4, 10, 'Ejercicio metabólico. Burpee con salto vertical máximo.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (347, 66, 'Sandbag Shouldering', 4, 6, 'Fuerza funcional. Cargar saco al hombro alternando lados.', NULL);

-- Rutina 67: Rutina Nocturna Energía (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (330, 67, 'Dynamic Warm-up Nocturno', 1, NULL, 'Activación corporal. Calentamiento dinámico suave.', 10);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (331, 67, 'Strength Circuit', 3, 12, 'Fuerza sin sobreestimulación. Circuito de ejercicios compuestos.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (332, 67, 'Yoga Flow Suave', 1, NULL, 'Movilidad y relajación. Secuencia de yoga no estimulante.', 15);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (333, 67, 'Breathing Exercises', 1, NULL, 'Calma post-entreno. Ejercicios respiratorios para relajación.', 8);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (334, 67, 'Cool Down Específico', 1, NULL, 'Recuperación nocturna. Enfriamiento progresivo.', 7);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (348, 67, 'Bodyweight Rows', 3, 12, 'Espalda suave. Remo invertido con mesa o barra baja.', NULL);

-- Rutina 68: Recuperación Nocturna (3 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (335, 68, 'Estiramientos Pasivos', 1, NULL, 'Flexibilidad y relajación. Mantener posiciones 30-60 segundos.', 15);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (336, 68, 'Foam Rolling', 1, NULL, 'Liberación miofascial. Auto-masaje con rodillo.', 10);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (337, 68, 'Meditación Guiada', 1, NULL, 'Preparación sueño. Meditación para inducción al descanso.', 12);

-- Rutina 69: Fitness Sin Equipo (6 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (338, 69, 'Shadow Boxing', 4, NULL, 'Cardio y coordinación. Boxeo de sombra a alta intensidad.', 3);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (339, 69, 'High Intensity Marching', 4, NULL, 'Cardio en espacio reducido. Marcha en sitio máxima intensidad.', 2);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (340, 69, 'Stair Running', 6, NULL, 'Cardio con escaleras. Subir y bajar escaleras rápidamente.', 2);

-- Rutina 70: Cardio de Viaje (5 ejercicios)
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (349, 70, 'Jumping Jacks Variados', 4, 25, 'Cardio completo. Diferentes variaciones de jumping jacks.', NULL);
INSERT INTO Ejercicios (id_ejercicio, id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min) VALUES (350, 70, 'Spot Running', 4, NULL, 'Cardio en sitio. Correr en lugar a alta intensidad.', 2);
commit;