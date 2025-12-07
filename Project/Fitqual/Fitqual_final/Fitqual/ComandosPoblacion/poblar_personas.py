"""
Generador OPTIMIZADO de datos de prueba para sistema FitQual.
Genera UN SOLO archivo PoblarTablas.sql con TODAS las tablas pobladas.
Usa COMMITS frecuentes y bloques más pequeños para mejor rendimiento.
"""

import random
from datetime import datetime, timedelta


class FitQualCompletoDatabaseGenerator:
    """Generador completo para todas las tablas de FitQual"""
    
    def __init__(self, num_personas: int = 10000):
        self.num_personas = num_personas
        self.num_especialistas = int(num_personas * 0.10)  # 10%
        self.num_usuarios = num_personas - self.num_especialistas  # 90%
        
        # Datos generales
        self.NOMBRES = [
            "Carmen", "Daniela", "Paula", "Sofia", "Alba", "Juliana", "Marta", "María",
            "Helena", "Adriana", "Martin", "Ana", "Ivanna", "Laura", "Lara", "Lorena",
            "Patricia", "Noa", "Mia", "Juan", "Sebastian", "Roberto", "Jose", "Nacho",
            "Miguel", "Diego", "Carlos", "Gustavo", "Hector", "Marcos", "Alfonso",
            "Oscar", "Fernando", "Ricardo", "Agustin", "German", "Nestor", "Alvaro",
            "Alfredo", "Ruben", "Vicente", "Rafael", "Victor", "Silvestre", "Berto",
            "Enrique", "Luis", "Elias", "Bruno", "Javier", "Darío", "Daniel", "Santiago",
            "Rodrigo", "Guillermo", "Cristian", "Jorge", "Arturo", "Pablo", "Borja",
            "Ivan", "Pedro", "Andrea", "Valentina", "Isabella", "Camila", "Natalia",
            "Sara", "Lucia", "Emma", "Valeria", "Catalina", "Mariana", "Gabriela"
        ]
        
        self.APELLIDOS = [
            "Rodriguez", "Gomez", "Lopez", "Gonzalez", "Garcia", "Martinez",
            "Villamil", "Bermudez", "Rubio", "Pinto", "Ramirez", "Sanchez",
            "Hernandez", "Diaz", "Perez", "Torres", "Rojas", "Vargas", "Moreno",
            "Gutierrez", "Jimenez", "Muñoz", "Castro", "Ortiz", "Alvarez", "Ruiz",
            "Suarez", "Romero", "Herrera", "Valencia", "Quintero", "Morales"
        ]
        
        self.DOMINIOS_EMAIL = ["@gmail.com", "@hotmail.com", "@yahoo.com", "@outlook.com"]
        
        self.ESPECIALIDADES = [
            "Entrenamiento de Fuerza", "Pérdida de Peso", "Nutrición Deportiva",
            "Yoga y Flexibilidad", "Entrenamiento Funcional", "Crossfit", "Pilates"
        ]
        
        self.METAS = [
            "Pérdida de peso", "Ganancia muscular", "Definición corporal",
            "Mejorar resistencia", "Aumentar fuerza", "Tonificar cuerpo"
        ]
        
        self.NIVELES = ['Básico', 'Intermedio', 'Avanzado']
        self.SEXOS = ['M', 'F']
        self.TIPOS_FEEDBACK = ['EspecialistaFitness', 'RutinasDeEjemplo', 'Progreso', 'Sistema']
        self.TIPOS_ENFOQUE = ['Nutrición', 'Entrenamiento', 'Salud mental', 'Descanso', 'Motivación']
        self.TIPOS_ENTRENAMIENTO = ['Cardio', 'Fuerza']
    
    def escapar_comillas(self, texto: str) -> str:
        return texto.replace("'", "''")
    
    def generar_contrasena(self) -> str:
        longitud = random.randint(8, 15)
        caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return ''.join(random.choice(caracteres) for _ in range(longitud))
    
    def generar_personas(self, output):
        """Genera Personas con INSERTs directos en bloques de 100"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: PERSONAS (10,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        roles = ['EspecialistaFitness'] * self.num_especialistas + ['Usuario'] * self.num_usuarios
        random.shuffle(roles)
        
        for i in range(self.num_personas):
            id_persona = i + 1
            nombre = f"{random.choice(self.NOMBRES)} {random.choice(self.APELLIDOS)}"
            correo = f"{random.choice(self.NOMBRES).lower()}{id_persona}{random.choice(self.DOMINIOS_EMAIL)}"
            contrasena = self.generar_contrasena()
            rol = roles[i]
            
            output.write(f"INSERT INTO Personas VALUES ({id_persona}, '{nombre}', '{correo}', '{contrasena}', '{rol}');\n")
            
            if (id_persona % 100 == 0):
                output.write("COMMIT;\n\n")
        
        output.write("COMMIT;\n")
        output.write("-- Personas: 10,000 registros insertados\n\n")
    
    def generar_especialistas(self, output):
        """Genera EspecialistasFitness con INSERTs directos"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: ESPECIALISTASFITNESS (1,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    v_id NUMBER;
    v_count NUMBER := 0;
BEGIN
    FOR rec IN (SELECT id_persona FROM Personas WHERE rol = 'EspecialistaFitness') LOOP
        INSERT INTO EspecialistasFitness VALUES (
            rec.id_persona,
            CASE MOD(v_count, 7)
                WHEN 0 THEN 'Entrenamiento de Fuerza'
                WHEN 1 THEN 'Pérdida de Peso'
                WHEN 2 THEN 'Nutrición Deportiva'
                WHEN 3 THEN 'Yoga y Flexibilidad'
                WHEN 4 THEN 'Entrenamiento Funcional'
                WHEN 5 THEN 'Crossfit'
                ELSE 'Pilates'
            END,
            'Especialista certificado con experiencia',
            'Más de ' || DBMS_RANDOM.VALUE(3, 15) || ' años de experiencia profesional',
            0
        );
        v_count := v_count + 1;
        
        IF MOD(v_count, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_usuarios(self, output):
        """Genera Usuarios optimizado"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: USUARIOS (9,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    v_count NUMBER := 0;
    v_con_membresia NUMBER := 0;
    v_total NUMBER;
    v_limite_membresia NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total FROM Personas WHERE rol = 'Usuario';
    v_limite_membresia := ROUND(v_total * 0.20);
    
    FOR rec IN (SELECT id_persona FROM Personas WHERE rol = 'Usuario') LOOP
        v_count := v_count + 1;
        v_con_membresia := CASE WHEN v_count <= v_limite_membresia THEN 1 ELSE 0 END;
        
        INSERT INTO Usuarios (
            id_persona, meta, nivel, frecuencia_entreno_semanal,
            edad, sexo, peso, altura,
            fecha_inicio_membresia, membresia_activa, fecha_fin_membresia
        ) VALUES (
            rec.id_persona,
            CASE MOD(v_count, 6)
                WHEN 0 THEN 'Pérdida de peso'
                WHEN 1 THEN 'Ganancia muscular'
                WHEN 2 THEN 'Definición corporal'
                WHEN 3 THEN 'Mejorar resistencia'
                WHEN 4 THEN 'Aumentar fuerza'
                ELSE 'Tonificar cuerpo'
            END,
            CASE MOD(v_count, 3)
                WHEN 0 THEN 'Básico'
                WHEN 1 THEN 'Intermedio'
                ELSE 'Avanzado'
            END,
            DBMS_RANDOM.VALUE(2, 6),
            DBMS_RANDOM.VALUE(18, 60),
            CASE WHEN MOD(v_count, 2) = 0 THEN 'M' ELSE 'F' END,
            ROUND(DBMS_RANDOM.VALUE(55, 95), 2),
            ROUND(DBMS_RANDOM.VALUE(1.55, 1.85), 2),
            CASE WHEN v_con_membresia = 1 THEN SYSDATE - DBMS_RANDOM.VALUE(30, 300) ELSE NULL END,
            CASE WHEN v_con_membresia = 1 THEN '1' ELSE '0' END,
            CASE WHEN v_con_membresia = 1 THEN ADD_MONTHS(SYSDATE - DBMS_RANDOM.VALUE(30, 300), 12) ELSE NULL END
        );
        
        IF MOD(v_count, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_feedbacks(self, output):
        """Genera 10,000 feedbacks"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: FEEDBACKS (10,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_usuarios id_array;
    v_idx NUMBER;
BEGIN
    SELECT id_persona BULK COLLECT INTO v_usuarios FROM Usuarios;
    
    FOR i IN 1..10000 LOOP
        v_idx := MOD(i, v_usuarios.COUNT) + 1;
        
        INSERT INTO Feedbacks (usuario, contenido, fecha, calificacion, tipo_feedback, visibilidad)
        VALUES (
            v_usuarios(v_idx),
            'Excelente experiencia, muy recomendado',
            SYSDATE - DBMS_RANDOM.VALUE(1, 365),
            DBMS_RANDOM.VALUE(4, 5),
            CASE MOD(i, 4)
                WHEN 0 THEN 'EspecialistaFitness'
                WHEN 1 THEN 'RutinasDeEjemplo'
                WHEN 2 THEN 'Progreso'
                ELSE 'Sistema'
            END,
            CASE WHEN MOD(i, 10) < 7 THEN 'Público' ELSE 'Privado' END
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_objetivos(self, output):
        """Genera 10,000 objetivos"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: OBJETIVOS (10,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_usuarios id_array;
    v_idx NUMBER;
    v_nombre VARCHAR2(100);
BEGIN
    SELECT id_persona BULK COLLECT INTO v_usuarios FROM Usuarios;
    
    FOR i IN 1..10000 LOOP
        v_idx := MOD(i, v_usuarios.COUNT) + 1;
        
        v_nombre := CASE MOD(i, 6)
            WHEN 0 THEN 'Perder 10 kg'
            WHEN 1 THEN 'Ganar masa muscular'
            WHEN 2 THEN 'Correr 5K'
            WHEN 3 THEN 'Mejorar flexibilidad'
            WHEN 4 THEN 'Aumentar fuerza'
            ELSE 'Tonificar abdomen'
        END;
        
        INSERT INTO Objetivos (usuario, nombre, contenido, fecha_creacion)
        VALUES (
            v_usuarios(v_idx),
            v_nombre,
            'Objetivo: ' || v_nombre || '. Plan de acción definido',
            SYSDATE - DBMS_RANDOM.VALUE(1, 180)
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_recomendaciones(self, output):
        """Genera 500 recomendaciones reutilizables"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: RECOMENDACIONES (500 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_especialistas id_array;
    v_idx NUMBER;
    v_contenido VARCHAR2(1000);
    v_tipo VARCHAR2(50);
BEGIN
    SELECT id_persona BULK COLLECT INTO v_especialistas FROM EspecialistasFitness;
    
    FOR i IN 1..500 LOOP
        v_idx := MOD(i, v_especialistas.COUNT) + 1;
        
        v_tipo := CASE MOD(i, 5)
            WHEN 0 THEN 'Nutrición'
            WHEN 1 THEN 'Entrenamiento'
            WHEN 2 THEN 'Salud mental'
            WHEN 3 THEN 'Descanso'
            ELSE 'Motivación'
        END;
        
        v_contenido := CASE v_tipo
            WHEN 'Nutrición' THEN 'Incrementa tu consumo de proteína a 1.8g por kg de peso'
            WHEN 'Entrenamiento' THEN 'Implementa progresión gradual en tus entrenamientos'
            WHEN 'Salud mental' THEN 'Practica mindfulness 10 minutos diarios'
            WHEN 'Descanso' THEN 'Duerme 7-9 horas para óptima recuperación'
            ELSE 'Visualiza tus objetivos cada mañana'
        END;
        
        INSERT INTO Recomendaciones (especialista_fitness, contenido, fecha_creacion, tipo_enfoque)
        VALUES (v_especialistas(v_idx), v_contenido, SYSDATE - DBMS_RANDOM.VALUE(1, 365), v_tipo);
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_objetivos_recomendaciones(self, output):
        """Genera tabla intermedia"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: OBJETIVOSRECOMENDACIONES\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_objetivos id_array;
    v_recomendaciones id_array;
    v_rec_idx NUMBER;
    v_contador NUMBER := 0;
BEGIN
    SELECT id_objetivo BULK COLLECT INTO v_objetivos FROM Objetivos;
    SELECT id_recomendacion BULK COLLECT INTO v_recomendaciones FROM Recomendaciones;
    
    FOR i IN 1..v_objetivos.COUNT LOOP
        FOR j IN 1..DBMS_RANDOM.VALUE(1, 2) LOOP
            v_rec_idx := MOD(i + j, v_recomendaciones.COUNT) + 1;
            
            BEGIN
                INSERT INTO ObjetivosRecomendaciones VALUES (v_recomendaciones(v_rec_idx), v_objetivos(i));
                v_contador := v_contador + 1;
                EXCEPTION
                    WHEN DUP_VAL_ON_INDEX THEN 
                        NULL;
            END;
        END LOOP;
        
        IF MOD(v_contador, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_progresos(self, output):
        """Genera 10,000 progresos"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: PROGRESOS (10,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_usuarios id_array;
    v_idx NUMBER;
BEGIN
    SELECT id_persona BULK COLLECT INTO v_usuarios FROM Usuarios;
    
    FOR i IN 1..10000 LOOP
        v_idx := MOD(i, v_usuarios.COUNT) + 1;
        
        INSERT INTO Progresos (usuario, peso_actual, medidas, porcentaje_grasa, imc, fecha_registro)
        VALUES (
            v_usuarios(v_idx),
            ROUND(DBMS_RANDOM.VALUE(55, 95), 2),
            'Pecho: ' || ROUND(DBMS_RANDOM.VALUE(85, 110)) || 'cm',
            ROUND(DBMS_RANDOM.VALUE(15, 30), 2),
            ROUND(DBMS_RANDOM.VALUE(20, 28), 2),
            SYSDATE - DBMS_RANDOM.VALUE(1, 365)
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_planes_fitness(self, output):
        """Genera 1000 planes"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: PLANESFITNESS (1,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO PlanesFitness (nombre, duracion, descripcion)
        VALUES (
            CASE MOD(i, 5)
                WHEN 0 THEN 'Plan Pérdida de Peso ' || i
                WHEN 1 THEN 'Plan Ganancia Muscular ' || i
                WHEN 2 THEN 'Plan Definición ' || i
                WHEN 3 THEN 'Plan Resistencia ' || i
                ELSE 'Plan Fuerza ' || i
            END,
            CASE MOD(i, 3)
                WHEN 0 THEN '8 semanas'
                WHEN 1 THEN '12 semanas'
                ELSE '16 semanas'
            END,
            'Plan personalizado enfocado en resultados'
        );
        
        IF MOD(i, 200) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_planes_usuarios(self, output):
        """Genera PlanesFitnessDeUsuarios"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: PLANESFITNESSDE USUARIOS\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_usuarios id_array;
    v_planes id_array;
    v_plan_idx NUMBER;
    v_contador NUMBER := 0;
BEGIN
    SELECT id_persona BULK COLLECT INTO v_usuarios FROM Usuarios WHERE membresia_activa = '1';
    SELECT id_plan BULK COLLECT INTO v_planes FROM PlanesFitness;
    
    FOR i IN 1..v_usuarios.COUNT LOOP
        FOR j IN 1..DBMS_RANDOM.VALUE(1, 2) LOOP
            v_plan_idx := MOD(i + j, v_planes.COUNT) + 1;
            
            BEGIN
                INSERT INTO PlanesFitnessDeUsuarios (usuario, planfitness, comentario_usuario)
                VALUES (
                    v_usuarios(i),
                    v_planes(v_plan_idx),
                    CASE WHEN MOD(i, 2) = 0 THEN 'Excelente plan' ELSE NULL END
                );
                v_contador := v_contador + 1;
                EXCEPTION
                    WHEN DUP_VAL_ON_INDEX THEN 
                        NULL;
            END;
        END LOOP;
        
        IF MOD(v_contador, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_rutinas(self, output):
        """Genera 1000 rutinas"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: RUTINAS (1,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_planes id_array;
    v_plan_idx NUMBER;
    v_count NUMBER := 0;
BEGIN
    SELECT id_plan BULK COLLECT INTO v_planes FROM PlanesFitness;
    
    FOR i IN 1..1000 LOOP
        v_plan_idx := MOD(i, v_planes.COUNT) + 1;
        
        SELECT COUNT(*) INTO v_count FROM Rutinas WHERE planfitness = v_planes(v_plan_idx);
        
        INSERT INTO Rutinas (
            planfitness, nombre_rutina, descripcion, dias_semana,
            duracion_rutina_min, nivel_dificultad, tipo_entrenamiento
        ) VALUES (
            v_planes(v_plan_idx),
            'Rutina ' || (v_count + 1),
            'Rutina personalizada',
            'Lunes, Miércoles, Viernes',
            DBMS_RANDOM.VALUE(40, 80),
            CASE MOD(i, 3) WHEN 0 THEN 'Básico' WHEN 1 THEN 'Intermedio' ELSE 'Avanzado' END,
            CASE WHEN MOD(i, 2) = 0 THEN 'Fuerza' ELSE 'Cardio' END
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_comidas(self, output):
        """Genera 3000 comidas"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: COMIDAS (3,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_planes id_array;
    v_plan_idx NUMBER;
    v_count NUMBER := 0;
BEGIN
    SELECT id_plan BULK COLLECT INTO v_planes FROM PlanesFitness;
    
    FOR i IN 1..3000 LOOP
        v_plan_idx := MOD(i, v_planes.COUNT) + 1;
        
        SELECT COUNT(*) INTO v_count FROM Comidas WHERE planfitness = v_planes(v_plan_idx);
        
        INSERT INTO Comidas (planfitness, nombre_comida, calorias, carbohidratos, grasas, proteinas)
        VALUES (
            v_planes(v_plan_idx),
            CASE MOD(v_count, 3)
                WHEN 0 THEN 'Desayuno ' || (v_count + 1)
                WHEN 1 THEN 'Almuerzo ' || (v_count + 1)
                ELSE 'Cena ' || (v_count + 1)
            END,
            DBMS_RANDOM.VALUE(300, 700),
            ROUND(DBMS_RANDOM.VALUE(30, 80), 2),
            ROUND(DBMS_RANDOM.VALUE(10, 30), 2),
            ROUND(DBMS_RANDOM.VALUE(20, 50), 2)
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_habitos(self, output):
        """Genera 2000 hábitos"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: HABITOS (2,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_planes id_array;
    v_plan_idx NUMBER;
    v_count NUMBER := 0;
BEGIN
    SELECT id_plan BULK COLLECT INTO v_planes FROM PlanesFitness;
    
    FOR i IN 1..2000 LOOP
        v_plan_idx := MOD(i, v_planes.COUNT) + 1;
        
        SELECT COUNT(*) INTO v_count FROM Habitos WHERE planfitness = v_planes(v_plan_idx);
        
        INSERT INTO Habitos (planfitness, nombre_habito, descripcion, frecuencia)
        VALUES (
            v_planes(v_plan_idx),
            CASE MOD(i, 3)
                WHEN 0 THEN 'Hidratación ' || (v_count + 1)
                WHEN 1 THEN 'Estiramientos ' || (v_count + 1)
                ELSE 'Descanso ' || (v_count + 1)
            END,
            'Hábito saludable recomendado',
            CASE MOD(i, 3)
                WHEN 0 THEN 'Diario'
                WHEN 1 THEN '3 veces por semana'
                ELSE '5 veces por semana'
            END
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_ejercicios(self, output):
        """Genera 5000 ejercicios"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: EJERCICIOS (5,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_rutinas id_array;
    v_rutina_idx NUMBER;
    v_tipo VARCHAR2(50);
    v_contador NUMBER := 0;
BEGIN
    SELECT id_rutina BULK COLLECT INTO v_rutinas FROM Rutinas;
    
    FOR i IN 1..v_rutinas.COUNT LOOP
        SELECT tipo_entrenamiento INTO v_tipo FROM Rutinas WHERE id_rutina = v_rutinas(i);
        
        FOR j IN 1..5 LOOP
            IF v_tipo = 'Fuerza' THEN
                INSERT INTO Ejercicios (id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
                VALUES (
                    v_rutinas(i),
                    CASE MOD(j, 5)
                        WHEN 0 THEN 'Sentadillas'
                        WHEN 1 THEN 'Press de banca'
                        WHEN 2 THEN 'Peso muerto'
                        WHEN 3 THEN 'Dominadas'
                        ELSE 'Press militar'
                    END,
                    DBMS_RANDOM.VALUE(3, 4),
                    DBMS_RANDOM.VALUE(10, 15),
                    'Ejercicio de fuerza',
                    NULL
                );
            ELSE
                INSERT INTO Ejercicios (id_rutina, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
                VALUES (
                    v_rutinas(i),
                    CASE MOD(j, 4)
                        WHEN 0 THEN 'Burpees'
                        WHEN 1 THEN 'Mountain climbers'
                        WHEN 2 THEN 'Running'
                        ELSE 'Jumping jacks'
                    END,
                    NULL,
                    NULL,
                    'Ejercicio cardiovascular',
                    DBMS_RANDOM.VALUE(3, 10)
                );
            END IF;
            
            v_contador := v_contador + 1;
            
            IF v_contador >= 5000 THEN
                EXIT;
            END IF;
        END LOOP;
        
        IF v_contador >= 5000 THEN
            EXIT;
        END IF;
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_rutinas_ejemplo(self, output):
        """Genera 10,000 rutinas de ejemplo"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: RUTINASDEEJEMPLO (10,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_especialistas id_array;
    v_esp_idx NUMBER;
    v_count NUMBER := 0;
BEGIN
    SELECT id_persona BULK COLLECT INTO v_especialistas FROM EspecialistasFitness;
    
    FOR i IN 1..10000 LOOP
        v_esp_idx := MOD(i, v_especialistas.COUNT) + 1;
        
        SELECT COUNT(*) INTO v_count 
        FROM RutinasDeEjemplo WHERE especialista_fitness = v_especialistas(v_esp_idx);
        
        INSERT INTO RutinasDeEjemplo (
            especialista_fitness, nombre_rutina, descripcion, dias_semana,
            duracion_rutina, nivel_dificultad, tipo_entrenamiento
        ) VALUES (
            v_especialistas(v_esp_idx),
            'Rutina Ejemplo ' || (v_count + 1),
            'Rutina de ejemplo para seguir',
            'Lunes, Miércoles, Viernes',
            DBMS_RANDOM.VALUE(40, 90),
            CASE MOD(i, 3) WHEN 0 THEN 'Básico' WHEN 1 THEN 'Intermedio' ELSE 'Avanzado' END,
            CASE WHEN MOD(i, 2) = 0 THEN 'Fuerza' ELSE 'Cardio' END
        );
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_ejercicios_ejemplo(self, output):
        """Genera 10,000 ejercicios de ejemplo"""
        output.write("\n-- =================================================\n")
        output.write("-- TABLA: EJERCICIOSDERUTINASDEEJEMPLO (10,000 registros)\n")
        output.write("-- =================================================\n\n")
        
        output.write("""DECLARE
    TYPE id_array IS TABLE OF NUMBER(10);
    v_rutinas id_array;
    v_tipo VARCHAR2(50);
    v_contador NUMBER := 0;
BEGIN
    SELECT id_rutina_ejemplo BULK COLLECT INTO v_rutinas FROM RutinasDeEjemplo;
    
    FOR i IN 1..v_rutinas.COUNT LOOP
        SELECT tipo_entrenamiento INTO v_tipo 
        FROM RutinasDeEjemplo WHERE id_rutina_ejemplo = v_rutinas(i);
        
        IF v_tipo = 'Fuerza' THEN
            INSERT INTO EjerciciosDeRutinasDeEjemplo 
                (id_rutina_ejemplo, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
            VALUES (v_rutinas(i), 'Sentadillas', 4, 12, 'Ejercicio de piernas', 5);
        ELSE
            INSERT INTO EjerciciosDeRutinasDeEjemplo 
                (id_rutina_ejemplo, nombre_ejercicio, series, repeticiones, descripcion, duracion_min)
            VALUES (v_rutinas(i), 'Running', 1, 1, 'Cardio', 20);
        END IF;
        
        v_contador := v_contador + 1;
        
        IF v_contador >= 10000 THEN
            EXIT;
        END IF;
        
        IF MOD(i, 100) = 0 THEN
            COMMIT;
        END IF;
    END LOOP;
    COMMIT;
END;
/

""")
    
    def generar_verificacion(self, output):
        """Genera queries de verificación"""
        output.write("\n-- =================================================\n")
        output.write("-- VERIFICACIÓN DE DATOS\n")
        output.write("-- =================================================\n\n")
        
        output.write("""-- Conteo por tabla
SELECT 'Personas' tabla, COUNT(*) registros FROM Personas
UNION ALL SELECT 'EspecialistasFitness', COUNT(*) FROM EspecialistasFitness
UNION ALL SELECT 'Usuarios', COUNT(*) FROM Usuarios
UNION ALL SELECT 'Feedbacks', COUNT(*) FROM Feedbacks
UNION ALL SELECT 'Objetivos', COUNT(*) FROM Objetivos
UNION ALL SELECT 'Recomendaciones', COUNT(*) FROM Recomendaciones
UNION ALL SELECT 'ObjetivosRecomendaciones', COUNT(*) FROM ObjetivosRecomendaciones
UNION ALL SELECT 'Progresos', COUNT(*) FROM Progresos
UNION ALL SELECT 'PlanesFitness', COUNT(*) FROM PlanesFitness
UNION ALL SELECT 'PlanesFitnessDeUsuarios', COUNT(*) FROM PlanesFitnessDeUsuarios
UNION ALL SELECT 'Rutinas', COUNT(*) FROM Rutinas
UNION ALL SELECT 'Comidas', COUNT(*) FROM Comidas
UNION ALL SELECT 'Habitos', COUNT(*) FROM Habitos
UNION ALL SELECT 'Ejercicios', COUNT(*) FROM Ejercicios
UNION ALL SELECT 'RutinasDeEjemplo', COUNT(*) FROM RutinasDeEjemplo
UNION ALL SELECT 'EjerciciosDeRutinasDeEjemplo', COUNT(*) FROM EjerciciosDeRutinasDeEjemplo;

-- Usuarios con membresía
SELECT membresia_activa, COUNT(*) cantidad FROM Usuarios GROUP BY membresia_activa;

""")
    
    def generar_archivo_completo(self, nombre_archivo: str = "PoblarTablas.sql"):
        """Genera el archivo SQL optimizado"""
        print("=" * 70)
        print("GENERADOR OPTIMIZADO FITQUAL")
        print("=" * 70)
        print(f"\nGenerando: {nombre_archivo}\n")
        
        with open(nombre_archivo, 'w', encoding='utf-8') as f:
            f.write("-- =================================================\n")
            f.write("-- FITQUAL - POBLACIÓN DE BASE DE DATOS\n")
            f.write(f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("-- =================================================\n\n")
            f.write("SET DEFINE OFF;\n")
            f.write("SET SERVEROUTPUT ON SIZE UNLIMITED;\n")
            f.write("SET TIMING ON;\n\n")
            
            print("✓ Personas...")
            self.generar_personas(f)
            
            print("✓ EspecialistasFitness...")
            self.generar_especialistas(f)
            
            print("✓ Usuarios...")
            self.generar_usuarios(f)
            
            print("✓ Feedbacks...")
            self.generar_feedbacks(f)
            
            print("✓ Objetivos...")
            self.generar_objetivos(f)
            
            print("✓ Recomendaciones...")
            self.generar_recomendaciones(f)
            
            print("✓ ObjetivosRecomendaciones...")
            self.generar_objetivos_recomendaciones(f)
            
            print("✓ Progresos...")
            self.generar_progresos(f)
            
            print("✓ PlanesFitness...")
            self.generar_planes_fitness(f)
            
            print("✓ PlanesFitnessDeUsuarios...")
            self.generar_planes_usuarios(f)
            
            print("✓ Rutinas...")
            self.generar_rutinas(f)
            
            print("✓ Comidas...")
            self.generar_comidas(f)
            
            print("✓ Hábitos...")
            self.generar_habitos(f)
            
            print("✓ Ejercicios...")
            self.generar_ejercicios(f)
            
            print("✓ RutinasDeEjemplo...")
            self.generar_rutinas_ejemplo(f)
            
            print("✓ EjerciciosDeRutinasDeEjemplo...")
            self.generar_ejercicios_ejemplo(f)
            
            print("✓ Verificación...")
            self.generar_verificacion(f)
            
            f.write("\nSET DEFINE ON;\n")
            f.write("-- FIN\n")
        
        print("\n" + "=" * 70)
        print(f"✓ COMPLETADO: {nombre_archivo}")
        print("=" * 70)
        print("\nPara ejecutar:")
        print(f"  sqlplus usuario/pass@db @{nombre_archivo}")
        print()


def main():
    try:
        print("\n" + "=" * 70)
        print("GENERADOR FITQUAL DATABASE")
        print("=" * 70 + "\n")
        
        num = input("Personas [10000]: ").strip()
        num = int(num) if num else 10000
        
        archivo = input("Archivo [PoblarTablas.sql]: ").strip()
        archivo = archivo if archivo else "PoblarTablas.sql"
        if not archivo.endswith('.sql'):
            archivo += '.sql'
        
        print()
        
        gen = FitQualCompletoDatabaseGenerator(num)
        gen.generar_archivo_completo(archivo)
        
    except KeyboardInterrupt:
        print("\n\n✗ Cancelado")
    except Exception as e:
        print(f"\n✗ ERROR: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()