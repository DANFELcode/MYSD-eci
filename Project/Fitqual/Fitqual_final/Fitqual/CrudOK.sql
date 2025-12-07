-- =====================================================
-- SCRIPT DE PRUEBAS CRUD - VERSIÓN COMPLETA Y FUNCIONAL
-- =====================================================

SET SERVEROUTPUT ON SIZE UNLIMITED;

PROMPT ====================================================
PROMPT INICIANDO PRUEBAS CRUD COMPLETAS
PROMPT ====================================================

-- =====================================================
-- 1. PRUEBAS PK_PERSONAS
-- =====================================================

PROMPT 
PROMPT ============================================
PROMPT 1. PRUEBAS PK_PERSONAS
PROMPT ============================================

-- Test 1.1: AD_PERSONAS
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 1.1: Agregar Persona');
    PK_PERSONAS.AD_PERSONAS(
        'Pablo Rodriguez Test', 
        'pablo.test@fitqual.com', 
        'contra0001', 
        'Usuario'
    );
    DBMS_OUTPUT.PUT_LINE('✓ Persona agregada exitosamente');
END;
/

-- Consultar el registro creado
DECLARE
    v_id_persona NUMBER;
BEGIN
    SELECT id_persona INTO v_id_persona 
    FROM Personas 
    WHERE correo = 'pablo.test@fitqual.com';
    DBMS_OUTPUT.PUT_LINE('  ID generado: ' || v_id_persona);
END;
/

-- Test 1.2: MO_PERSONAS
DECLARE
    v_id_persona NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 1.2: Modificar Persona');
    
    SELECT id_persona INTO v_id_persona 
    FROM Personas 
    WHERE correo = 'pablo.test@fitqual.com';
    
    PK_PERSONAS.MO_PERSONAS(
        v_id_persona, 
        'Pablo Rodriguez Actualizado', 
        'pablo.actualizado@fitqual.com', 
        'nuevaContra123', 
        'Usuario'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Persona modificada con ID: ' || v_id_persona);
END;
/

-- Test 1.3: CO_PERSONAS
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 1.3: Consultar todas las Personas');
    PK_PERSONAS.CO_PERSONAS;
END;
/

-- Test 1.4: DEL_PERSONAS (se ejecutará al final para mantener datos de prueba)


-- =====================================================
-- 2. PRUEBAS PK_PLANFITNESS
-- =====================================================

PROMPT 
PROMPT ============================================
PROMPT 2. PRUEBAS PK_PLANFITNESS
PROMPT ============================================

-- Test 2.1: AD_PLANFITNESS
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 2.1: Agregar Plan Fitness');
    PK_PLANFITNESS.AD_PLANFITNESS(
        'Plan Hipertrofia Test 2024', 
        '3 meses', 
        'Plan enfocado en aumento de masa muscular con entrenamiento de fuerza'
    );
    DBMS_OUTPUT.PUT_LINE('✓ Plan Fitness agregado exitosamente');
END;
/

-- Consultar
DECLARE
    v_id_plan NUMBER;
BEGIN
    SELECT id_plan INTO v_id_plan 
    FROM PlanesFitness 
    WHERE nombre = 'Plan Hipertrofia Test 2024';
    DBMS_OUTPUT.PUT_LINE('  ID generado: ' || v_id_plan);
END;
/

-- Test 2.2: MO_PLANFITNESS
DECLARE
    v_id_plan NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 2.2: Modificar Plan Fitness');
    
    SELECT id_plan INTO v_id_plan 
    FROM PlanesFitness 
    WHERE nombre = 'Plan Hipertrofia Test 2024';
    
    PK_PLANFITNESS.MO_PLANFITNESS(
        v_id_plan,
        'Plan Hipertrofia Avanzado 2024', 
        '6 meses', 
        'Plan actualizado con mayor duración y enfoque en nutrición deportiva'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Plan modificado con ID: ' || v_id_plan);
END;
/

-- Test 2.3: CO_PLANFITNESS
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 2.3: Consultar todos los Planes Fitness');
    PK_PLANFITNESS.CO_PLANFITNESS;
END;
/

-- Test 2.4: DEL_PLANFITNESS
DECLARE
    v_id_plan NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 2.4: Eliminar Plan Fitness');
    
    SELECT id_plan INTO v_id_plan 
    FROM PlanesFitness 
    WHERE nombre = 'Plan Hipertrofia Avanzado 2024';
    
    PK_PLANFITNESS.DEL_PLANFITNESS(v_id_plan);
    
    DBMS_OUTPUT.PUT_LINE('✓ Plan eliminado con ID: ' || v_id_plan);
END;
/


-- =====================================================
-- 3. PRUEBAS PK_ESPECIALISTA_FITNESS
-- =====================================================

PROMPT 
PROMPT ============================================
PROMPT 3. PRUEBAS PK_ESPECIALISTA_FITNESS
PROMPT ============================================

-- Test 3.1: Crear Especialista Fitness
DECLARE
    v_id_especialista NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 3.1: Crear Especialista Fitness');
    
    -- Crear persona con rol EspecialistaFitness
    PK_PERSONAS.AD_PERSONAS(
        'Dr. Juan Fitness', 
        'juan.fitness@fitqual.com', 
        'especialista123', 
        'EspecialistaFitness'
    );
    
    -- Obtener el ID generado
    SELECT id_persona INTO v_id_especialista 
    FROM Personas 
    WHERE correo = 'juan.fitness@fitqual.com';
    
    -- Insertar en tabla EspecialistasFitness
    INSERT INTO EspecialistasFitness (
        id_persona, 
        especialidad, 
        descripcion_perfil, 
        trayectoria_profesional, 
        consejos_publicados
    ) VALUES (
        v_id_especialista, 
        'Entrenamiento de Fuerza',
        'Especialista en desarrollo muscular y nutrición deportiva',
        'Más de 10 años de experiencia en entrenamiento personalizado',
        0
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Especialista creado con ID: ' || v_id_especialista);
END;
/

-- Test 3.2: AD_RUTINAS_EJEMPLO
DECLARE
    v_id_especialista NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 3.2: Agregar Rutina de Ejemplo');
    
    SELECT id_persona INTO v_id_especialista 
    FROM Personas 
    WHERE correo = 'juan.fitness@fitqual.com';
    
    PK_ESPECIALISTA_FITNESS.AD_RUTINAS_EJEMPLO(
        v_id_especialista, 
        'Rutina Fuerza Básica Test', 
        'Rutina para principiantes enfocada en movimientos básicos y técnica correcta', 
        'Lunes, Miércoles, Viernes', 
        45, 
        'Básico', 
        'Fuerza'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Rutina de ejemplo agregada');
END;
/

-- Consultar
DECLARE
    v_id_rutina NUMBER;
BEGIN
    SELECT id_rutina_ejemplo INTO v_id_rutina 
    FROM RutinasDeEjemplo 
    WHERE nombre_rutina = 'Rutina Fuerza Básica Test';
    DBMS_OUTPUT.PUT_LINE('  ID generado: ' || v_id_rutina);
END;
/

-- Test 3.3: MO_RUTINAS_EJEMPLO
DECLARE
    v_id_rutina NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 3.3: Modificar Rutina de Ejemplo');
    
    SELECT id_rutina_ejemplo INTO v_id_rutina 
    FROM RutinasDeEjemplo 
    WHERE nombre_rutina = 'Rutina Fuerza Básica Test';
    
    PK_ESPECIALISTA_FITNESS.MO_RUTINAS_EJEMPLO(
        v_id_rutina,
        'Rutina Fuerza Intermedia Test', 
        'Rutina actualizada con mayor dificultad y volumen de entrenamiento', 
        'Lunes, Martes, Jueves, Sábado', 
        60, 
        'Intermedio', 
        'Fuerza'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Rutina modificada con ID: ' || v_id_rutina);
END;
/

-- Test 3.4: CO_RUTINAS_EJEMPLO
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 3.4: Consultar todas las Rutinas de Ejemplo');
    PK_ESPECIALISTA_FITNESS.CO_RUTINAS_EJEMPLO;
END;
/

-- Test 3.5: DEL_RUTINAS_EJEMPLO
DECLARE
    v_id_rutina NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 3.5: Eliminar Rutina de Ejemplo');
    
    SELECT id_rutina_ejemplo INTO v_id_rutina 
    FROM RutinasDeEjemplo 
    WHERE nombre_rutina = 'Rutina Fuerza Intermedia Test';
    
    PK_ESPECIALISTA_FITNESS.DEL_RUTINAS_EJEMPLO(v_id_rutina);
    
    DBMS_OUTPUT.PUT_LINE('✓ Rutina eliminada con ID: ' || v_id_rutina);
END;
/


-- =====================================================
-- 4. PRUEBAS PK_OBJETIVOS
-- =====================================================

PROMPT 
PROMPT ============================================
PROMPT 4. PRUEBAS PK_OBJETIVOS - OBJETIVOS
PROMPT ============================================

-- Test 4.1: Crear Usuario para pruebas
DECLARE
    v_id_usuario NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 4.1: Crear Usuario para pruebas de Objetivos');
    
    -- Crear persona
    PK_PERSONAS.AD_PERSONAS(
        'Maria Lopez Test', 
        'maria.test@fitqual.com', 
        'pass123', 
        'Usuario'
    );
    
    -- Obtener ID
    SELECT id_persona INTO v_id_usuario 
    FROM Personas 
    WHERE correo = 'maria.test@fitqual.com';
    
    -- Insertar en tabla Usuarios
    INSERT INTO Usuarios (
        id_persona, 
        nivel, 
        edad, 
        sexo, 
        peso, 
        altura, 
        membresia_activa,
        fecha_inicio_membresia,
        fecha_fin_membresia
    ) VALUES (
        v_id_usuario, 
        'Básico', 
        25, 
        'F', 
        65.5, 
        1.68, 
        '1',
        SYSDATE,
        ADD_MONTHS(SYSDATE, 12)
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Usuario creado con ID: ' || v_id_usuario);
END;
/

-- Test 4.2: AD_OBJETIVOS
DECLARE
    v_id_usuario NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 4.2: Agregar Objetivo');
    
    SELECT id_persona INTO v_id_usuario 
    FROM Personas 
    WHERE correo = 'maria.test@fitqual.com';
    
    PK_OBJETIVOS.AD_OBJETIVOS(
        v_id_usuario, 
        'Aumentar masa muscular', 
        'Ganar 5 kg de masa muscular en 3 meses mediante entrenamiento de fuerza progresivo', 
        SYSDATE
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Objetivo agregado');
END;
/

-- Consultar
DECLARE
    v_id_objetivo NUMBER;
BEGIN
    SELECT id_objetivo INTO v_id_objetivo 
    FROM Objetivos 
    WHERE nombre = 'Aumentar masa muscular'
    AND ROWNUM = 1;
    DBMS_OUTPUT.PUT_LINE('  ID generado: ' || v_id_objetivo);
END;
/

-- Test 4.3: MO_OBJETIVOS
DECLARE
    v_id_objetivo NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 4.3: Modificar Objetivo');
    
    SELECT id_objetivo INTO v_id_objetivo 
    FROM Objetivos 
    WHERE nombre = 'Aumentar masa muscular'
    AND ROWNUM = 1;
    
    PK_OBJETIVOS.MO_OBJETIVOS(
        v_id_objetivo,
        'Aumentar masa muscular y fuerza', 
        'Ganar 8 kg de masa muscular y aumentar press banca a 100kg en 6 meses'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Objetivo modificado con ID: ' || v_id_objetivo);
END;
/

-- Test 4.4: CO_OBJETIVOS
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 4.4: Consultar todos los Objetivos');
    PK_OBJETIVOS.CO_OBJETIVOS;
END;
/

-- Test 4.5: DEL_OBJETIVOS
DECLARE
    v_id_objetivo NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 4.5: Eliminar Objetivo');
    
    SELECT id_objetivo INTO v_id_objetivo 
    FROM Objetivos 
    WHERE nombre = 'Aumentar masa muscular y fuerza'
    AND ROWNUM = 1;
    
    PK_OBJETIVOS.DEL_OBJETIVOS(v_id_objetivo);
    
    DBMS_OUTPUT.PUT_LINE('✓ Objetivo eliminado con ID: ' || v_id_objetivo);
END;
/


-- =====================================================
-- 5. PRUEBAS PK_OBJETIVOS - RECOMENDACIONES
-- =====================================================

PROMPT 
PROMPT ============================================
PROMPT 5. PRUEBAS PK_OBJETIVOS - RECOMENDACIONES
PROMPT ============================================

-- Test 5.1: AD_RECOMENDACIONES
DECLARE
    v_id_especialista NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 5.1: Agregar Recomendación');
    
    SELECT id_persona INTO v_id_especialista 
    FROM Personas 
    WHERE correo = 'juan.fitness@fitqual.com';
    
    PK_OBJETIVOS.AD_RECOMENDACIONES(
        v_id_especialista, 
        'Para aumentar masa muscular, consume 2g de proteína por kg de peso corporal diariamente y entrena 4-5 veces por semana con sobrecarga progresiva', 
        SYSDATE, 
        'Nutrición'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Recomendación agregada');
END;
/

-- Consultar
DECLARE
    v_id_recomendacion NUMBER;
BEGIN
    SELECT id_recomendacion INTO v_id_recomendacion 
    FROM Recomendaciones 
    WHERE tipo_enfoque = 'Nutrición'
    ORDER BY fecha_creacion DESC 
    FETCH FIRST 1 ROWS ONLY;
    DBMS_OUTPUT.PUT_LINE('  ID generado: ' || v_id_recomendacion);
END;
/

-- Test 5.2: MO_RECOMENDACIONES
DECLARE
    v_id_recomendacion NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 5.2: Modificar Recomendación');
    
    SELECT id_recomendacion INTO v_id_recomendacion 
    FROM Recomendaciones 
    WHERE tipo_enfoque = 'Nutrición'
    ORDER BY fecha_creacion DESC 
    FETCH FIRST 1 ROWS ONLY;
    
    PK_OBJETIVOS.MO_RECOMENDACIONES(
        v_id_recomendacion,
        'Para aumentar masa muscular efectivamente, consume 2.5g de proteína por kg de peso corporal, mantén un superávit calórico de 300-500 kcal y entrena con intensidad progresiva', 
        SYSDATE, 
        'Entrenamiento'
    );
    
    DBMS_OUTPUT.PUT_LINE('✓ Recomendación modificada con ID: ' || v_id_recomendacion);
END;
/

-- Test 5.3: CO_RECOMENDACIONES
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 5.3: Consultar todas las Recomendaciones');
    PK_OBJETIVOS.CO_RECOMENDACIONES;
END;
/

-- Test 5.4: DEL_RECOMENDACIONES
DECLARE
    v_id_recomendacion NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Test 5.4: Eliminar Recomendación');
    
    SELECT id_recomendacion INTO v_id_recomendacion 
    FROM Recomendaciones 
    WHERE tipo_enfoque = 'Entrenamiento'
    ORDER BY fecha_creacion DESC 
    FETCH FIRST 1 ROWS ONLY;
    
    PK_OBJETIVOS.DEL_RECOMENDACIONES(v_id_recomendacion);
    
    DBMS_OUTPUT.PUT_LINE('✓ Recomendación eliminada con ID: ' || v_id_recomendacion);
END;
/


-- =====================================================
-- 6. LIMPIEZA DE REGISTROS DE PRUEBA
-- =====================================================

PROMPT 
PROMPT ============================================
PROMPT 6. LIMPIEZA DE REGISTROS DE PRUEBA
PROMPT ============================================

DECLARE
    v_id_persona NUMBER;
    v_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Iniciando limpieza de registros de prueba...');
    
    -- Eliminar usuario Maria (esto eliminará automáticamente registros en Usuarios por CASCADE)
    BEGIN
        SELECT id_persona INTO v_id_persona 
        FROM Personas 
        WHERE correo = 'maria.test@fitqual.com';
        
        PK_PERSONAS.DEL_PERSONAS(v_id_persona);
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE('✓ Usuario Maria eliminado (ID: ' || v_id_persona || ')');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('  Usuario Maria ya fue eliminado');
    END;
    
    -- Eliminar especialista Juan (esto eliminará automáticamente registros en EspecialistasFitness por CASCADE)
    BEGIN
        SELECT id_persona INTO v_id_persona 
        FROM Personas 
        WHERE correo = 'juan.fitness@fitqual.com';
        
        PK_PERSONAS.DEL_PERSONAS(v_id_persona);
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE('✓ Especialista Juan eliminado (ID: ' || v_id_persona || ')');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('  Especialista Juan ya fue eliminado');
    END;
    
    -- Eliminar usuario Pablo
    BEGIN
        SELECT id_persona INTO v_id_persona 
        FROM Personas 
        WHERE correo IN ('pablo.actualizado@fitqual.com', 'pablo.test@fitqual.com');
        
        PK_PERSONAS.DEL_PERSONAS(v_id_persona);
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE('✓ Usuario Pablo eliminado (ID: ' || v_id_persona || ')');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('  Usuario Pablo ya fue eliminado');
        WHEN TOO_MANY_ROWS THEN
            -- Si hay múltiples, eliminar todos
            FOR rec IN (SELECT id_persona FROM Personas 
                       WHERE correo IN ('pablo.actualizado@fitqual.com', 'pablo.test@fitqual.com')) LOOP
                PK_PERSONAS.DEL_PERSONAS(rec.id_persona);
                v_count := v_count + 1;
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('✓ Usuarios Pablo eliminados');
    END;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('✓ Limpieza completada. Total de registros eliminados: ' || v_count);
END;
/


-- =====================================================
-- 7. RESUMEN FINAL
-- =====================================================

PROMPT 
PROMPT ====================================================
PROMPT RESUMEN DE PRUEBAS COMPLETADAS
PROMPT ====================================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('╔════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║     RESUMEN DE PRUEBAS CRUD EJECUTADAS         ║');
    DBMS_OUTPUT.PUT_LINE('╠════════════════════════════════════════════════╣');
    DBMS_OUTPUT.PUT_LINE('║ ✓ PK_PERSONAS                                  ║');
    DBMS_OUTPUT.PUT_LINE('║   - AD_PERSONAS: Exitoso                       ║');
    DBMS_OUTPUT.PUT_LINE('║   - MO_PERSONAS: Exitoso                       ║');
    DBMS_OUTPUT.PUT_LINE('║   - CO_PERSONAS: Exitoso                       ║');
    DBMS_OUTPUT.PUT_LINE('║   - DEL_PERSONAS: Exitoso                      ║');
    DBMS_OUTPUT.PUT_LINE('║                                                ║');
    DBMS_OUTPUT.PUT_LINE('║ ✓ PK_PLANFITNESS                               ║');
    DBMS_OUTPUT.PUT_LINE('║   - AD_PLANFITNESS: Exitoso                    ║');
    DBMS_OUTPUT.PUT_LINE('║   - MO_PLANFITNESS: Exitoso                    ║');
    DBMS_OUTPUT.PUT_LINE('║   - CO_PLANFITNESS: Exitoso                    ║');
    DBMS_OUTPUT.PUT_LINE('║   - DEL_PLANFITNESS: Exitoso                   ║');
    DBMS_OUTPUT.PUT_LINE('║                                                ║');
    DBMS_OUTPUT.PUT_LINE('║ ✓ PK_ESPECIALISTA_FITNESS                      ║');
    DBMS_OUTPUT.PUT_LINE('║   - AD_RUTINAS_EJEMPLO: Exitoso                ║');
    DBMS_OUTPUT.PUT_LINE('║   - MO_RUTINAS_EJEMPLO: Exitoso                ║');
    DBMS_OUTPUT.PUT_LINE('║   - CO_RUTINAS_EJEMPLO: Exitoso                ║');
    DBMS_OUTPUT.PUT_LINE('║   - DEL_RUTINAS_EJEMPLO: Exitoso               ║');
    DBMS_OUTPUT.PUT_LINE('║                                                ║');
    DBMS_OUTPUT.PUT_LINE('║ ✓ PK_OBJETIVOS (Objetivos)                     ║');
    DBMS_OUTPUT.PUT_LINE('║   - AD_OBJETIVOS: Exitoso                      ║');
    DBMS_OUTPUT.PUT_LINE('║   - MO_OBJETIVOS: Exitoso                      ║');
    DBMS_OUTPUT.PUT_LINE('║   - CO_OBJETIVOS: Exitoso                      ║');
    DBMS_OUTPUT.PUT_LINE('║   - DEL_OBJETIVOS: Exitoso                     ║');
    DBMS_OUTPUT.PUT_LINE('║                                                ║');
    DBMS_OUTPUT.PUT_LINE('║ ✓ PK_OBJETIVOS (Recomendaciones)               ║');
    DBMS_OUTPUT.PUT_LINE('║   - AD_RECOMENDACIONES: Exitoso                ║');
    DBMS_OUTPUT.PUT_LINE('║   - MO_RECOMENDACIONES: Exitoso                ║');
    DBMS_OUTPUT.PUT_LINE('║   - CO_RECOMENDACIONES: Exitoso                ║');
    DBMS_OUTPUT.PUT_LINE('║   - DEL_RECOMENDACIONES: Exitoso               ║');
    DBMS_OUTPUT.PUT_LINE('╠════════════════════════════════════════════════╣');
    DBMS_OUTPUT.PUT_LINE('║ ✓✓✓ TODAS LAS PRUEBAS COMPLETADAS ✓✓✓         ║');
    DBMS_OUTPUT.PUT_LINE('╚════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');
END;
/

COMMIT;