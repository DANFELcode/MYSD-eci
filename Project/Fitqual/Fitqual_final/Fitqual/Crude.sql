-- =====================================================
-- ESPECIFICACIONES DE PAQUETES (PACKAGE SPECIFICATIONS)
-- =====================================================

-- PK_PERSONAS - ESPECIFICACIÓN
CREATE OR REPLACE PACKAGE PK_PERSONAS IS 
    -- CRUD Básico
    PROCEDURE AD_PERSONAS(
        x_id_persona IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_correo IN VARCHAR2, 
        x_contrasena IN VARCHAR2, 
        x_rol IN VARCHAR2
    );
    
    PROCEDURE MO_PERSONAS(
        x_id_persona IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_correo IN VARCHAR2, 
        x_contrasena IN VARCHAR2, 
        x_rol IN VARCHAR2
    );
    
    PROCEDURE DEL_PERSONAS(x_id_persona IN NUMBER);
    
    PROCEDURE CO_PERSONAS;
    
    -- Consultas avanzadas
    FUNCTION CO_MI_HISTORIAL_PROGRESO_FISICO RETURN SYS_REFCURSOR;
    FUNCTION CO_OBJETIVOS_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_ACTIVIDAD_ESTADO_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_USUARIOS_RENOVARON_MEMBRESIA RETURN SYS_REFCURSOR;
    FUNCTION CO_USUARIOS_ACTIVOS_MES RETURN SYS_REFCURSOR;
    FUNCTION CO_FUNCIONALIDADES_PEOR_CALIFICACION RETURN SYS_REFCURSOR;
    FUNCTION CO_SATISFACCION_GLOBAL_APLICACION RETURN SYS_REFCURSOR;
END PK_PERSONAS;
/

-- PK_PLANFITNESS - ESPECIFICACIÓN
CREATE OR REPLACE PACKAGE PK_PLANFITNESS IS
    -- CRUD Básico
    PROCEDURE AD_PLANFITNESS(
        x_nombre IN VARCHAR2, 
        x_duracion IN VARCHAR2, 
        x_descripcion IN VARCHAR2
    );
    
    PROCEDURE MO_PLANFITNESS(
        x_id_plan IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_duracion IN VARCHAR2, 
        x_descripcion IN VARCHAR2
    );
    
    PROCEDURE DEL_PLANFITNESS(x_id_plan IN NUMBER);
    
    PROCEDURE CO_PLANFITNESS;
    
    -- Consultas avanzadas
    FUNCTION CO_MIS_PLANES_FITNESS RETURN SYS_REFCURSOR;
    FUNCTION CO_PLANES_FITNESS_USUARIOS RETURN SYS_REFCURSOR;
END PK_PLANFITNESS;
/

-- PK_ESPECIALISTA_FITNESS - ESPECIFICACIÓN
CREATE OR REPLACE PACKAGE PK_ESPECIALISTA_FITNESS IS
    -- CRUD Básico
    PROCEDURE AD_RUTINAS_EJEMPLO(
        x_especialista_fitness IN NUMBER, 
        x_nombre_rutina IN VARCHAR2, 
        x_descripcion IN VARCHAR2, 
        x_dias_semana IN VARCHAR2, 
        x_duracion_rutina IN NUMBER, 
        x_nivel_dificultad IN VARCHAR2, 
        x_tipo_entrenamiento IN VARCHAR2
    );
    
    PROCEDURE MO_RUTINAS_EJEMPLO(
        x_id_rutina_ejemplo IN NUMBER, 
        x_nombre_rutina IN VARCHAR2, 
        x_descripcion IN VARCHAR2, 
        x_dias_semana IN VARCHAR2, 
        x_duracion_rutina IN NUMBER, 
        x_nivel_dificultad IN VARCHAR2, 
        x_tipo_entrenamiento IN VARCHAR2
    );
    
    PROCEDURE DEL_RUTINAS_EJEMPLO(x_id_rutina_ejemplo IN NUMBER);
    
    PROCEDURE CO_RUTINAS_EJEMPLO;
    
    -- Consultas avanzadas
    FUNCTION CO_RUTINAS_EJEMPLO_NIVEL_DIFICULTAD RETURN SYS_REFCURSOR;
    FUNCTION CO_RECOMENDACIONES_ESPECIALISTAS_FITNESS RETURN SYS_REFCURSOR;
END PK_ESPECIALISTA_FITNESS;
/

-- PK_OBJETIVOS - ESPECIFICACIÓN
CREATE OR REPLACE PACKAGE PK_OBJETIVOS IS
    -- CRUD Básico - Objetivos
    PROCEDURE AD_OBJETIVOS(
        x_usuario IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_contenido IN VARCHAR2, 
        x_fecha_creacion IN DATE
    );
    
    PROCEDURE MO_OBJETIVOS(
        x_id_objetivo IN NUMBER, 
        x_nombre IN VARCHAR2, 
        x_contenido IN VARCHAR2
    );
    
    PROCEDURE DEL_OBJETIVOS(x_id_objetivo IN NUMBER);
    
    PROCEDURE CO_OBJETIVOS;
    
    -- CRUD Básico - Recomendaciones
    PROCEDURE AD_RECOMENDACIONES(
        x_especialista_fitness IN NUMBER, 
        x_contenido IN VARCHAR2, 
        x_fecha_creacion IN DATE, 
        x_tipo_enfoque IN VARCHAR2
    );
    
    PROCEDURE MO_RECOMENDACIONES(
        x_id_recomendacion IN NUMBER, 
        x_contenido IN VARCHAR2, 
        x_fecha_creacion IN DATE, 
        x_tipo_enfoque IN VARCHAR2
    );
    
    PROCEDURE DEL_RECOMENDACIONES(x_id_recomendacion IN NUMBER);
    
    PROCEDURE CO_RECOMENDACIONES;
    
    -- Consultas avanzadas
    FUNCTION CO_RECOMENDACIONES_SOBRE_MIS_OBJETIVOS RETURN SYS_REFCURSOR;
    FUNCTION CO_OBJETIVOS_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_OBJETIVOS_COMUNES_USUARIOS RETURN SYS_REFCURSOR;
END PK_OBJETIVOS;
/

COMMIT;

-- =====================================================
-- Mensaje de confirmación
-- =====================================================
BEGIN
    DBMS_OUTPUT.PUT_LINE('✓ Especificaciones de paquetes creadas exitosamente');
    DBMS_OUTPUT.PUT_LINE('  - PK_PERSONAS');
    DBMS_OUTPUT.PUT_LINE('  - PK_PLANFITNESS');
    DBMS_OUTPUT.PUT_LINE('  - PK_ESPECIALISTA_FITNESS');
    DBMS_OUTPUT.PUT_LINE('  - PK_OBJETIVOS');
END;
/