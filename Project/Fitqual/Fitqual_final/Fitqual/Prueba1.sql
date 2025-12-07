--------------------------------------------------------------------------------
-- 1. Un nuevo usuario llamado Pablo le interesa la app Fitqual, la descarga y se registra
--------------------------------------------------------------------------------
-- AD_PERSONAS: Registrar un nuevo usuario “Pablo”
EXECUTE PK_PERSONAS.AD_PERSONAS(12000,'Pablo', 'pablo.ad@fitqual.com', 'contra0001', 'Usuario');

-- Verificación
SELECT * FROM Personas WHERE id_persona = 12000;


--------------------------------------------------------------------------------
-- 2. El usuario modifica la información de su perfil, especificamente su contraseña ya que se le olvidó
--------------------------------------------------------------------------------
-- MO_PERSONAS: Actualizar datos del usuario con id 12000
EXECUTE PK_PERSONAS.MO_PERSONAS(12000,'Pablo', 'pablo.ad@fitqual.com', 'Perrito4321', 'Usuario');

-- Verificación
SELECT * FROM Personas WHERE id_persona = 12000;


--------------------------------------------------------------------------------
-- 3. El administrador elimina la cuenta antigua de Pablo que estaba inactiva, ya que este prefiere crearse una nueva.
--------------------------------------------------------------------------------
-- DEL_PERSONAS: Eliminar usuario 12000
EXECUTE PK_PERSONAS.DEL_PERSONAS(12000);

-- Verificación
SELECT * FROM Personas WHERE id_persona = 12000;

--Crea su nueva cuenta
EXECUTE PK_PERSONAS.AD_PERSONAS(12001,'Pablito', 'pablo.ad@gmail.com', 'Perrito555', 'Usuario');

--------------------------------------------------------------------------------
-- 4. Pablo, ahora con su nueva cuenta, decide comenzar un plan fitness para aumentar masa muscular
--------------------------------------------------------------------------------
-- AD_PLANFITNESS: Registrar un nuevo plan fitness disponible para él
EXECUTE PK_PLANFITNESS.AD_PLANFITNESS(
10150,
'Aumentar masa muscular',
'3 meses',
'Plan enfocado en hipertrofia muscular con rutinas intensas y alimentación alta en proteína.'
);

-- Verificación
SELECT * FROM PlanesFitness WHERE id_plan = 10150;


--------------------------------------------------------------------------------
-- 5. Después de hablar con un entrenador, Pablo actualiza su plan fitness,
--    extendiendo su duración para un progreso más gradual
--------------------------------------------------------------------------------
-- MO_PLANFITNESS: Modificar la duración a 5 meses
EXECUTE PK_PLANFITNESS.MO_PLANFITNESS(
10150,
'Aumentar masa muscular',
'5 meses',
'Plan ajustado para hipertrofia progresiva con nuevos ajustes de carga.'
);

-- Verificación
SELECT * FROM PlanesFitness WHERE id_plan = 10150;


--------------------------------------------------------------------------------
-- 6. Un especialista fitness asigna a Pablo una rutina de ejemplo
--------------------------------------------------------------------------------
-- AD_RUTINAS_EJEMPLO: Crear rutina recomendada
EXECUTE PK_ESPECIALISTA_FITNESS.AD_RUTINAS_EJEMPLO(
20200,
12001,
'Rutina FullBody intermedia',
'Rutina diseñada para mejorar fuerza general con énfasis en movimientos compuestos.',
'Lunes, Miércoles, Viernes',
60,
'Intermedio',
'Fuerza'
);

-- Verificación
SELECT * FROM RutinasDeEjemplo WHERE id_rutina_ejemplo = 20200;


--------------------------------------------------------------------------------
-- 7. Con el paso del tiempo, Pablo avanza y su rutina se actualiza a una versión más exigente
--------------------------------------------------------------------------------
-- MO_RUTINAS_EJEMPLO: Actualización de días, duración e intensidad
EXECUTE PK_ESPECIALISTA_FITNESS.MO_RUTINAS_EJEMPLO(
20200,
12001,
'Rutina FullBody avanzada',
'Rutina optimizada para fuerza máxima y resistencia muscular.',
'Lunes, Martes, Jueves, Sábado',
75,
'Avanzado',
'Fuerza'
);

-- Verificación
SELECT * FROM RutinasDeEjemplo WHERE id_rutina_ejemplo = 20200;


--------------------------------------------------------------------------------
-- 8. Pablo establece un objetivo personal dentro de la aplicación
--------------------------------------------------------------------------------
-- AD_OBJETIVOS: Crear objetivo
EXECUTE PK_OBJETIVOS.AD_OBJETIVOS(
30300,
12001,
'Aumentar fuerza en sentadilla',
'Incrementar carga en sentadilla de 70 kg a 100 kg para 5 repeticiones',
DATE '2025-06-10'
);

-- Verificación
SELECT * FROM Objetivos WHERE id_objetivo = 30300;


--------------------------------------------------------------------------------
-- 9. Un especialista le crea recomendaciones específicas para cumplir este objetivo
--------------------------------------------------------------------------------
-- AD_RECOMENDACIONES: Crear recomendaciones nutricionales y de entrenamiento
EXECUTE PK_OBJETIVOS.AD_RECOMENDACIONES(
40400,
12001,
'Consumir 150 g de proteína diaria, mantener superávit calórico de 300 kcal y realizar progresión de cargas semanal.',
DATE '2025-01-15',
'Entrenamiento y nutrición'
);

-- Verificación
SELECT * FROM Recomendaciones WHERE id_recomendacion = 40400;


--------------------------------------------------------------------------------
-- 10. Finalmente, tras un tiempo, Pablo actualiza su objetivo y elimina su recomendación anterior
--------------------------------------------------------------------------------
-- MO_OBJETIVOS: Ajustar su objetivo a fuerza en peso muerto
EXECUTE PK_OBJETIVOS.MO_OBJETIVOS(
30300,
12001,
'Aumentar fuerza en peso muerto',
'Incrementar peso muerto de 100 kg a 140 kg para 3 repeticiones',
SYSDATE
);

SELECT * FROM Objetivos WHERE id_objetivo = 30300;


-- DEL_RECOMENDACIONES: Eliminar la recomendación anterior para reemplazarla más adelante
EXECUTE PK_OBJETIVOS.DEL_RECOMENDACIONES(40400);

-- Verificación
SELECT * FROM Recomendaciones WHERE id_recomendacion = 40400;


--------------------------------------------------------------------------------
-- Confirmación de todas las transacciones
--------------------------------------------------------------------------------
COMMIT;


------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- 1. Un nuevo EspecialistaFitness llamado Carlos decide registrarse en Fitqual
--------------------------------------------------------------------------------
-- AD_PERSONAS: Registrar especialista
EXECUTE PK_PERSONAS.AD_PERSONAS(13000,'Carlos', 'carlos.ef@fitqual.com', 'FitXpert001', 'EspecialistaFitness');

-- Verificación
SELECT * FROM Personas WHERE id_persona = 13000;


--------------------------------------------------------------------------------
-- 2. Carlos actualiza su información profesional agregando una nueva contraseña
--------------------------------------------------------------------------------
-- MO_PERSONAS: Modificar datos del especialista
EXECUTE PK_PERSONAS.MO_PERSONAS(13000,'Carlos', 'carlos.ef@fitqual.com', 'StrongPass2025', 'EspecialistaFitness');

-- Verificación
SELECT * FROM Personas WHERE id_persona = 13000;


--------------------------------------------------------------------------------
-- 3. La administración elimina una cuenta anterior de Carlos que estaba mal registrada
--------------------------------------------------------------------------------
EXECUTE PK_PERSONAS.DEL_PERSONAS(13000);

-- Verificación
SELECT * FROM Personas WHERE id_persona = 13000;

-- Se crea su nueva cuenta correctamente
EXECUTE PK_PERSONAS.AD_PERSONAS(13001,'CarlosEF', 'carlos.entrenador@gmail.com', 'MuscleMaster55', 'EspecialistaFitness');

SELECT * FROM Personas WHERE id_persona = 13001;


--------------------------------------------------------------------------------
-- 4. Como especialista, Carlos crea un nuevo plan de entrenamiento para sus clientes
--------------------------------------------------------------------------------
EXECUTE PK_PLANFITNESS.AD_PLANFITNESS(
11000,
'Plan Fuerza Total',
'8 semanas',
'Programa intensivo de fuerza para progresión continua en ejercicios compuestos.'
);

SELECT * FROM PlanesFitness WHERE id_plan = 11000;


--------------------------------------------------------------------------------
-- 5. Después de probar el plan con atletas, ajusta el plan para que dure más tiempo
--------------------------------------------------------------------------------
EXECUTE PK_PLANFITNESS.MO_PLANFITNESS(
11000,
'Plan Fuerza Total',
'12 semanas',
'Plan optimizado con progresión estructurada y ajustes de carga.'
);

SELECT * FROM PlanesFitness WHERE id_plan = 11000;


--------------------------------------------------------------------------------
-- 6. Carlos diseña una rutina de ejemplo para sus usuarios intermedios
--------------------------------------------------------------------------------
EXECUTE PK_ESPECIALISTA_FITNESS.AD_RUTINAS_EJEMPLO(
21000,
13001,
'Rutina Push-Pull-Legs Avanzada',
'Entrenamiento estructurado para fuerza, hipertrofia y equilibrio muscular.',
'Lunes, Miércoles, Viernes, Domingo',
90,
'Avanzado',
'Fuerza e hipertrofia'
);

SELECT * FROM RutinasDeEjemplo WHERE id_rutina_ejemplo = 21000;


--------------------------------------------------------------------------------
-- 7. Tras evaluar resultados, actualiza la rutina haciéndola más intensa
--------------------------------------------------------------------------------
EXECUTE PK_ESPECIALISTA_FITNESS.MO_RUTINAS_EJEMPLO(
21000,
13001,
'Rutina Push-Pull-Legs Elite',
'Versión avanzada con sobrecarga progresiva y nuevos ejercicios.',
'Martes, Jueves, Sábado, Domingo',
100,
'Elite',
'Fuerza'
);

SELECT * FROM RutinasDeEjemplo WHERE id_rutina_ejemplo = 21000;


--------------------------------------------------------------------------------
-- 8. Carlos registra un objetivo para uno de sus clientes
--------------------------------------------------------------------------------
EXECUTE PK_OBJETIVOS.AD_OBJETIVOS(
32000,
13001,
'Mejorar técnica de peso muerto',
'Perfeccionar técnica y aumentar el levantamiento a 180 kg.',
DATE '2025-05-01'
);

SELECT * FROM Objetivos WHERE id_objetivo = 32000;


--------------------------------------------------------------------------------
-- 9. Carlos crea recomendaciones personalizadas para el progreso del cliente
--------------------------------------------------------------------------------
EXECUTE PK_OBJETIVOS.AD_RECOMENDACIONES(
42000,
13001,
'Incluir movilidad lumbar diaria, aumentar ingesta proteica a 180 g, y realizar trabajo accesorio posterior.',
DATE '2025-02-15',
'Entrenamiento avanzado'
);

SELECT * FROM Recomendaciones WHERE id_recomendacion = 42000;


--------------------------------------------------------------------------------
-- 10. Finalmente, actualiza el objetivo del cliente y elimina recomendaciones previas
--------------------------------------------------------------------------------
EXECUTE PK_OBJETIVOS.MO_OBJETIVOS(
32000,
13001,
'Mejorar técnica de sentadilla profunda',
'Aumentar sentadilla profunda a 160 kg manteniendo técnica perfecta.',
SYSDATE
);

SELECT * FROM Objetivos WHERE id_objetivo = 32000;

-- Eliminar recomendación anterior
EXECUTE PK_OBJETIVOS.DEL_RECOMENDACIONES(42000);

SELECT * FROM Recomendaciones WHERE id_recomendacion = 42000;


--------------------------------------------------------------------------------
-- Confirmación de cambios
--------------------------------------------------------------------------------
COMMIT;
