-- =====================================================
-- IMPLEMENTACIONES DE PAQUETES (PACKAGE BODIES)
-- =====================================================

-- PK_PERSONAS - IMPLEMENTACIÓN
CREATE OR REPLACE PACKAGE BODY PK_PERSONAS IS 
    
    -- ADICIONAR Persona (SIN id_persona, el trigger lo genera)
    PROCEDURE AD_PERSONAS(
        x_id_persona IN NUMBER,
        x_nombre IN VARCHAR2, 
        x_correo IN VARCHAR2, 
        x_contrasena IN VARCHAR2, 
        x_rol IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Personas (nombre, correo, contrasena, rol)
        VALUES (x_nombre, x_correo, x_contrasena, x_rol);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Persona agregada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al agregar persona: ' || SQLERRM);
    END AD_PERSONAS;
    
    -- MODIFICAR Persona
    PROCEDURE MO_PERSONAS(
        x_id_persona IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_correo IN VARCHAR2, 
        x_contrasena IN VARCHAR2, 
        x_rol IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Personas
        SET nombre = x_nombre,
            correo = x_correo,
            contrasena = x_contrasena,
            rol = x_rol
        WHERE id_persona = x_id_persona;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'No se encontró la persona con ID: ' || x_id_persona);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Persona modificada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al modificar persona: ' || SQLERRM);
    END MO_PERSONAS;
    
    -- ELIMINAR Persona
    PROCEDURE DEL_PERSONAS(x_id_persona IN NUMBER) IS
    BEGIN
        DELETE FROM Personas WHERE id_persona = x_id_persona;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'No se encontró la persona con ID: ' || x_id_persona);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Persona eliminada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20005, 'Error al eliminar persona: ' || SQLERRM);
    END DEL_PERSONAS;
    
    -- CONSULTAR Todas las Personas
    PROCEDURE CO_PERSONAS IS
        CURSOR c_personas IS
            SELECT id_persona, nombre, correo, rol
            FROM Personas
            ORDER BY id_persona;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('=== LISTADO DE PERSONAS ===');
        FOR rec IN c_personas LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id_persona || ' | Nombre: ' || rec.nombre || 
                               ' | Correo: ' || rec.correo || ' | Rol: ' || rec.rol);
        END LOOP;
    END CO_PERSONAS;
    
    -- CONSULTAS AVANZADAS
    
    FUNCTION CO_MI_HISTORIAL_PROGRESO_FISICO RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.fecha_registro, p.peso_actual, p.imc, p.porcentaje_grasa, p.medidas
            FROM Progresos p
            ORDER BY p.fecha_registro DESC;
        RETURN v_cursor;
    END CO_MI_HISTORIAL_PROGRESO_FISICO;
    
    FUNCTION CO_OBJETIVOS_USUARIOS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT per.nombre AS usuario, o.nombre AS objetivo, o.contenido, o.fecha_creacion
            FROM Usuarios u
            JOIN Personas per ON u.id_persona = per.id_persona
            LEFT JOIN Objetivos o ON u.id_persona = o.usuario
            ORDER BY o.fecha_creacion DESC;
        RETURN v_cursor;
    END CO_OBJETIVOS_USUARIOS;
    
    FUNCTION CO_ACTIVIDAD_ESTADO_USUARIOS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.nombre, u.membresia_activa, u.nivel, u.frecuencia_entreno_semanal
            FROM Usuarios u
            JOIN Personas p ON u.id_persona = p.id_persona
            ORDER BY p.nombre;
        RETURN v_cursor;
    END CO_ACTIVIDAD_ESTADO_USUARIOS;
    
    FUNCTION CO_USUARIOS_RENOVARON_MEMBRESIA RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.nombre, u.fecha_inicio_membresia, u.fecha_fin_membresia
            FROM Usuarios u
            JOIN Personas p ON u.id_persona = p.id_persona
            WHERE u.membresia_activa = '1'
            AND u.fecha_fin_membresia > SYSDATE
            ORDER BY u.fecha_fin_membresia;
        RETURN v_cursor;
    END CO_USUARIOS_RENOVARON_MEMBRESIA;
    
    FUNCTION CO_USUARIOS_ACTIVOS_MES RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT COUNT(*) AS usuarios_activos
            FROM Usuarios
            WHERE membresia_activa = '1';
        RETURN v_cursor;
    END CO_USUARIOS_ACTIVOS_MES;
    
    FUNCTION CO_FUNCIONALIDADES_PEOR_CALIFICACION RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT tipo_feedback, ROUND(AVG(calificacion), 2) AS calificacion_promedio
            FROM Feedbacks
            GROUP BY tipo_feedback
            ORDER BY calificacion_promedio ASC;
        RETURN v_cursor;
    END CO_FUNCIONALIDADES_PEOR_CALIFICACION;
    
    FUNCTION CO_SATISFACCION_GLOBAL_APLICACION RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT ROUND(AVG(calificacion), 2) AS satisfaccion_global
            FROM Feedbacks;
        RETURN v_cursor;
    END CO_SATISFACCION_GLOBAL_APLICACION;
    
END PK_PERSONAS;
/

-- =====================================================
-- PK_PLANFITNESS - IMPLEMENTACIÓN
-- =====================================================

CREATE OR REPLACE PACKAGE BODY PK_PLANFITNESS IS

    -- ADICIONAR Plan Fitness (SIN id_plan, el trigger lo genera)
    PROCEDURE AD_PLANFITNESS(
        x_nombre IN VARCHAR2, 
        x_duracion IN VARCHAR2, 
        x_descripcion IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO PlanesFitness (nombre, duracion, descripcion)
        VALUES (x_nombre, x_duracion, x_descripcion);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Plan Fitness agregado exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20101, 'Error al agregar Plan Fitness: ' || SQLERRM);
    END AD_PLANFITNESS;
    
    -- MODIFICAR Plan Fitness
    PROCEDURE MO_PLANFITNESS(
        x_id_plan IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_duracion IN VARCHAR2, 
        x_descripcion IN VARCHAR2
    ) IS
    BEGIN
        UPDATE PlanesFitness
        SET nombre = x_nombre,
            duracion = x_duracion,
            descripcion = x_descripcion
        WHERE id_plan = x_id_plan;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20102, 'No se encontró el Plan con ID: ' || x_id_plan);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Plan Fitness modificado exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20103, 'Error al modificar Plan Fitness: ' || SQLERRM);
    END MO_PLANFITNESS;
    
    -- ELIMINAR Plan Fitness
    PROCEDURE DEL_PLANFITNESS(x_id_plan IN NUMBER) IS
    BEGIN
        DELETE FROM PlanesFitness WHERE id_plan = x_id_plan;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20104, 'No se encontró el Plan con ID: ' || x_id_plan);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Plan Fitness eliminado exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20105, 'Error al eliminar Plan Fitness: ' || SQLERRM);
    END DEL_PLANFITNESS;
    
    -- CONSULTAR Planes Fitness
    PROCEDURE CO_PLANFITNESS IS
        CURSOR c_planes IS
            SELECT id_plan, nombre, duracion, descripcion
            FROM PlanesFitness
            ORDER BY id_plan;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('=== LISTADO DE PLANES FITNESS ===');
        FOR rec IN c_planes LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id_plan || ' | Nombre: ' || rec.nombre || 
                               ' | Duración: ' || rec.duracion);
        END LOOP;
    END CO_PLANFITNESS;
    
    -- CONSULTAS AVANZADAS
    
    FUNCTION CO_MIS_PLANES_FITNESS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT pf.id_plan, pf.nombre, pf.duracion, pf.descripcion, pfu.comentario_usuario
            FROM PlanesFitness pf
            JOIN PlanesFitnessDeUsuarios pfu ON pf.id_plan = pfu.planfitness
            ORDER BY pf.id_plan;
        RETURN v_cursor;
    END CO_MIS_PLANES_FITNESS;
    
    FUNCTION CO_PLANES_FITNESS_USUARIOS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.nombre AS usuario, pf.nombre AS plan, pfu.comentario_usuario
            FROM PlanesFitnessDeUsuarios pfu
            JOIN Personas p ON pfu.usuario = p.id_persona
            JOIN PlanesFitness pf ON pfu.planfitness = pf.id_plan
            ORDER BY p.nombre;
        RETURN v_cursor;
    END CO_PLANES_FITNESS_USUARIOS;
    
END PK_PLANFITNESS;
/

-- =====================================================
-- PK_ESPECIALISTA_FITNESS - IMPLEMENTACIÓN
-- =====================================================

CREATE OR REPLACE PACKAGE BODY PK_ESPECIALISTA_FITNESS IS

    -- ADICIONAR Rutina de Ejemplo (SIN id_rutina_ejemplo, el trigger lo genera)
    PROCEDURE AD_RUTINAS_EJEMPLO(
        x_especialista_fitness IN NUMBER, 
        x_nombre_rutina IN VARCHAR2, 
        x_descripcion IN VARCHAR2, 
        x_dias_semana IN VARCHAR2, 
        x_duracion_rutina IN NUMBER, 
        x_nivel_dificultad IN VARCHAR2, 
        x_tipo_entrenamiento IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO RutinasDeEjemplo (
            especialista_fitness, nombre_rutina, descripcion, dias_semana,
            duracion_rutina, nivel_dificultad, tipo_entrenamiento
        ) VALUES (
            x_especialista_fitness, x_nombre_rutina, x_descripcion, x_dias_semana,
            x_duracion_rutina, x_nivel_dificultad, x_tipo_entrenamiento
        );
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Rutina de Ejemplo agregada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20201, 'Error al agregar Rutina de Ejemplo: ' || SQLERRM);
    END AD_RUTINAS_EJEMPLO;
    
    -- MODIFICAR Rutina de Ejemplo
    PROCEDURE MO_RUTINAS_EJEMPLO(
        x_id_rutina_ejemplo IN NUMBER, 
        x_nombre_rutina IN VARCHAR2, 
        x_descripcion IN VARCHAR2, 
        x_dias_semana IN VARCHAR2, 
        x_duracion_rutina IN NUMBER, 
        x_nivel_dificultad IN VARCHAR2, 
        x_tipo_entrenamiento IN VARCHAR2
    ) IS
    BEGIN
        UPDATE RutinasDeEjemplo
        SET nombre_rutina = x_nombre_rutina,
            descripcion = x_descripcion,
            dias_semana = x_dias_semana,
            duracion_rutina = x_duracion_rutina,
            nivel_dificultad = x_nivel_dificultad,
            tipo_entrenamiento = x_tipo_entrenamiento
        WHERE id_rutina_ejemplo = x_id_rutina_ejemplo;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20202, 'No se encontró la Rutina con ID: ' || x_id_rutina_ejemplo);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Rutina de Ejemplo modificada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20203, 'Error al modificar Rutina de Ejemplo: ' || SQLERRM);
    END MO_RUTINAS_EJEMPLO;
    
    -- ELIMINAR Rutina de Ejemplo
    PROCEDURE DEL_RUTINAS_EJEMPLO(x_id_rutina_ejemplo IN NUMBER) IS
    BEGIN
        DELETE FROM RutinasDeEjemplo WHERE id_rutina_ejemplo = x_id_rutina_ejemplo;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20204, 'No se encontró la Rutina con ID: ' || x_id_rutina_ejemplo);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Rutina de Ejemplo eliminada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20205, 'Error al eliminar Rutina de Ejemplo: ' || SQLERRM);
    END DEL_RUTINAS_EJEMPLO;
    
    -- CONSULTAR Rutinas de Ejemplo
    PROCEDURE CO_RUTINAS_EJEMPLO IS
        CURSOR c_rutinas IS
            SELECT re.id_rutina_ejemplo, re.nombre_rutina, re.nivel_dificultad, 
                   re.tipo_entrenamiento, p.nombre AS especialista
            FROM RutinasDeEjemplo re
            JOIN Personas p ON re.especialista_fitness = p.id_persona
            ORDER BY re.id_rutina_ejemplo;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('=== LISTADO DE RUTINAS DE EJEMPLO ===');
        FOR rec IN c_rutinas LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id_rutina_ejemplo || ' | Rutina: ' || rec.nombre_rutina || 
                               ' | Nivel: ' || rec.nivel_dificultad || ' | Especialista: ' || rec.especialista);
        END LOOP;
    END CO_RUTINAS_EJEMPLO;
    
    -- CONSULTAS AVANZADAS
    
    FUNCTION CO_RUTINAS_EJEMPLO_NIVEL_DIFICULTAD RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT nivel_dificultad, COUNT(*) AS cantidad
            FROM RutinasDeEjemplo
            GROUP BY nivel_dificultad
            ORDER BY cantidad DESC;
        RETURN v_cursor;
    END CO_RUTINAS_EJEMPLO_NIVEL_DIFICULTAD;
    
    FUNCTION CO_RECOMENDACIONES_ESPECIALISTAS_FITNESS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.nombre AS especialista, r.contenido, r.tipo_enfoque, r.fecha_creacion
            FROM Recomendaciones r
            JOIN EspecialistasFitness ef ON r.especialista_fitness = ef.id_persona
            JOIN Personas p ON ef.id_persona = p.id_persona
            ORDER BY r.fecha_creacion DESC;
        RETURN v_cursor;
    END CO_RECOMENDACIONES_ESPECIALISTAS_FITNESS;
    
END PK_ESPECIALISTA_FITNESS;
/

-- =====================================================
-- PK_OBJETIVOS - IMPLEMENTACIÓN
-- =====================================================

CREATE OR REPLACE PACKAGE BODY PK_OBJETIVOS IS

    -- ADICIONAR Objetivo (SIN id_objetivo, el trigger lo genera)
    PROCEDURE AD_OBJETIVOS(
        x_usuario IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_contenido IN VARCHAR2, 
        x_fecha_creacion IN DATE
    ) IS
    BEGIN
        INSERT INTO Objetivos (usuario, nombre, contenido, fecha_creacion)
        VALUES (x_usuario, x_nombre, x_contenido, x_fecha_creacion);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Objetivo agregado exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20301, 'Error al agregar Objetivo: ' || SQLERRM);
    END AD_OBJETIVOS;
    
    -- MODIFICAR Objetivo
    PROCEDURE MO_OBJETIVOS(
        x_id_objetivo IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_contenido IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Objetivos
        SET nombre = x_nombre,
            contenido = x_contenido
        WHERE id_objetivo = x_id_objetivo;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20302, 'No se encontró el Objetivo con ID: ' || x_id_objetivo);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Objetivo modificado exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20303, 'Error al modificar Objetivo: ' || SQLERRM);
    END MO_OBJETIVOS;
    
    -- ELIMINAR Objetivo
    PROCEDURE DEL_OBJETIVOS(x_id_objetivo IN NUMBER) IS
    BEGIN
        DELETE FROM Objetivos WHERE id_objetivo = x_id_objetivo;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20304, 'No se encontró el Objetivo con ID: ' || x_id_objetivo);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Objetivo eliminado exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20305, 'Error al eliminar Objetivo: ' || SQLERRM);
    END DEL_OBJETIVOS;
    
    -- CONSULTAR Objetivos
    PROCEDURE CO_OBJETIVOS IS
        CURSOR c_objetivos IS
            SELECT o.id_objetivo, o.nombre, o.contenido, o.fecha_creacion, p.nombre AS usuario
            FROM Objetivos o
            JOIN Personas p ON o.usuario = p.id_persona
            ORDER BY o.fecha_creacion DESC;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('=== LISTADO DE OBJETIVOS ===');
        FOR rec IN c_objetivos LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id_objetivo || ' | Objetivo: ' || rec.nombre || 
                               ' | Usuario: ' || rec.usuario);
        END LOOP;
    END CO_OBJETIVOS;
    
    -- ADICIONAR Recomendación (SIN id_recomendacion, el trigger lo genera)
    PROCEDURE AD_RECOMENDACIONES(
        x_especialista_fitness IN NUMBER, 
        x_contenido IN VARCHAR2, 
        x_fecha_creacion IN DATE, 
        x_tipo_enfoque IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Recomendaciones (especialista_fitness, contenido, fecha_creacion, tipo_enfoque)
        VALUES (x_especialista_fitness, x_contenido, x_fecha_creacion, x_tipo_enfoque);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Recomendación agregada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20306, 'Error al agregar Recomendación: ' || SQLERRM);
    END AD_RECOMENDACIONES;
    
    -- MODIFICAR Recomendación
    PROCEDURE MO_RECOMENDACIONES(
        x_id_recomendacion IN NUMBER, 
        x_contenido IN VARCHAR2, 
        x_fecha_creacion IN DATE, 
        x_tipo_enfoque IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Recomendaciones
        SET contenido = x_contenido,
            fecha_creacion = x_fecha_creacion,
            tipo_enfoque = x_tipo_enfoque
        WHERE id_recomendacion = x_id_recomendacion;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20307, 'No se encontró la Recomendación con ID: ' || x_id_recomendacion);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Recomendación modificada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20308, 'Error al modificar Recomendación: ' || SQLERRM);
    END MO_RECOMENDACIONES;
    
    -- ELIMINAR Recomendación
    PROCEDURE DEL_RECOMENDACIONES(x_id_recomendacion IN NUMBER) IS
    BEGIN
        DELETE FROM Recomendaciones WHERE id_recomendacion = x_id_recomendacion;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20309, 'No se encontró la Recomendación con ID: ' || x_id_recomendacion);
        END IF;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Recomendación eliminada exitosamente');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20310, 'Error al eliminar Recomendación: ' || SQLERRM);
    END DEL_RECOMENDACIONES;
    
   -- CONSULTAR Recomendaciones
    PROCEDURE CO_RECOMENDACIONES IS
        CURSOR c_recomendaciones IS
            SELECT id_recomendacion, contenido, tipo_enfoque
            FROM Recomendaciones
            ORDER BY fecha_creacion DESC;
    BEGIN
        FOR rec IN c_recomendaciones LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.id_recomendacion || ' | Tipo: ' || rec.tipo_enfoque);
        END LOOP;
    END CO_RECOMENDACIONES;
    
    FUNCTION CO_RECOMENDACIONES_SOBRE_MIS_OBJETIVOS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT o.nombre as objetivo, r.contenido as recomendacion, r.tipo_enfoque
            FROM ObjetivosRecomendaciones or_table
            JOIN Objetivos o ON or_table.id_objetivo = o.id_objetivo
            JOIN Recomendaciones r ON or_table.id_recomendacion = r.id_recomendacion;
        RETURN v_cursor;
    END CO_RECOMENDACIONES_SOBRE_MIS_OBJETIVOS;
    
    FUNCTION CO_OBJETIVOS_USUARIOS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT p.nombre as usuario, o.nombre as objetivo, o.fecha_creacion
            FROM Objetivos o
            JOIN Personas p ON o.usuario = p.id_persona
            ORDER BY o.fecha_creacion DESC;
        RETURN v_cursor;
    END CO_OBJETIVOS_USUARIOS;
    
    FUNCTION CO_OBJETIVOS_COMUNES_USUARIOS RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT nombre, COUNT(*) as cantidad_usuarios
            FROM Objetivos
            GROUP BY nombre
            ORDER BY cantidad_usuarios DESC;
        RETURN v_cursor;
    END CO_OBJETIVOS_COMUNES_USUARIOS;
    
END PK_OBJETIVOS;
/

COMMIT;