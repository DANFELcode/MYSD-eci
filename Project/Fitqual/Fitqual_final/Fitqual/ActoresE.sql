-- =====================================================
-- PAQUETE: PA_GERENTE
-- Descripción: Acceso a consultas gerenciales y reportes
-- =====================================================
CREATE OR REPLACE PACKAGE PA_GERENTE IS
    
    FUNCTION CO_OBJETIVOS_COMUNES_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_USUARIOS_RENOVARON_MEMBRESIA RETURN SYS_REFCURSOR;
    FUNCTION CO_FUNCIONALIDADES_PEOR_CALIFICACION RETURN SYS_REFCURSOR;
    FUNCTION CO_USUARIOS_ACTIVOS_MES RETURN SYS_REFCURSOR;
    FUNCTION CO_SATISFACCION_GLOBAL_APLICACION RETURN SYS_REFCURSOR;
    
END PA_GERENTE;
/

-- =====================================================
-- PAQUETE: PA_USUARIO
-- Descripción: Gestión de objetivos, planes fitness y consultas de usuario
-- =====================================================
CREATE OR REPLACE PACKAGE PA_USUARIO IS
    
    -- CRUD de Objetivos
    PROCEDURE AD_OBJETIVOS(Xusuario IN NUMBER, Xnombre IN VARCHAR2, Xcontenido IN VARCHAR2, Xfecha_creacion IN DATE);
    PROCEDURE MO_OBJETIVOS(Xid_objetivo IN NUMBER, Xnombre IN VARCHAR2, Xcontenido IN VARCHAR2);
    PROCEDURE DEL_OBJETIVOS(Xid_objetivo IN NUMBER);
    PROCEDURE CO_OBJETIVOS;
    
    -- CRUD de Planes Fitness
    PROCEDURE AD_PLANFITNESS(Xnombre IN VARCHAR2, Xduracion IN VARCHAR2, Xdescripcion IN VARCHAR2);
    PROCEDURE MO_PLANFITNESS(Xid_plan IN NUMBER, Xnombre IN VARCHAR2, Xduracion IN VARCHAR2, Xdescripcion IN VARCHAR2);
    PROCEDURE DEL_PLANFITNESS(Xid_plan IN NUMBER);
    PROCEDURE CO_PLANFITNESS;
    
    -- Consultas adicionales
    FUNCTION CO_MIS_PLANES_FITNESS RETURN SYS_REFCURSOR;
    FUNCTION CO_MI_HISTORIAL_PROGRESO_FISICO RETURN SYS_REFCURSOR;
    FUNCTION CO_RECOMENDACIONES_SOBRE_MIS_OBJETIVOS RETURN SYS_REFCURSOR;
    
END PA_USUARIO;
/

-- =====================================================
-- PAQUETE: PA_ADMINISTRADOR_APP
-- Descripción: Administración de personas y consultas administrativas
-- =====================================================
CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR_APP IS
    
    -- CRUD de Personas
    PROCEDURE AD_PERSONAS(Xnombre IN VARCHAR2, Xcorreo IN VARCHAR2, Xcontrasena IN VARCHAR2, Xrol IN VARCHAR2);
    PROCEDURE MO_PERSONAS(Xid_persona IN NUMBER, Xnombre IN VARCHAR2, Xcorreo IN VARCHAR2, Xcontrasena IN VARCHAR2, Xrol IN VARCHAR2);
    PROCEDURE DEL_PERSONAS(Xid_persona IN NUMBER);
    PROCEDURE CO_PERSONAS;
    
    -- Consultas administrativas
    FUNCTION CO_PLANES_FITNESS_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_ACTIVIDAD_ESTADO_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_RECOMENDACIONES_ESPECIALISTAS_FITNESS RETURN SYS_REFCURSOR;
    
END PA_ADMINISTRADOR_APP;
/

-- =====================================================
-- PAQUETE: PA_ESPECIALISTA_FITNESS
-- Descripción: Gestión de recomendaciones y rutinas de ejemplo
-- =====================================================
CREATE OR REPLACE PACKAGE PA_ESPECIALISTA_FITNESS IS
    
    -- CRUD de Recomendaciones
    PROCEDURE AD_RECOMENDACIONES(Xespecialista_fitness IN NUMBER, Xcontenido IN VARCHAR2, Xfecha_creacion IN DATE, Xtipo_enfoque IN VARCHAR2);
    PROCEDURE MO_RECOMENDACIONES(Xid_recomendacion IN NUMBER, Xcontenido IN VARCHAR2, Xfecha_creacion IN DATE, Xtipo_enfoque IN VARCHAR2);
    PROCEDURE DEL_RECOMENDACIONES(Xid_recomendacion IN NUMBER);
    PROCEDURE CO_RECOMENDACIONES;
    
    -- CRUD de Rutinas de Ejemplo
    PROCEDURE AD_RUTINAS_EJEMPLO(Xespecialista_fitness IN NUMBER, Xnombre_rutina IN VARCHAR2, Xdescripcion IN VARCHAR2, Xdias_semana IN VARCHAR2, Xduracion_rutina IN NUMBER, Xnivel_dificultad IN VARCHAR2, Xtipo_entrenamiento IN VARCHAR2);
    PROCEDURE MO_RUTINAS_EJEMPLO(Xid_rutina_ejemplo IN NUMBER, Xnombre_rutina IN VARCHAR2, Xdescripcion IN VARCHAR2, Xdias_semana IN VARCHAR2, Xduracion_rutina IN NUMBER, Xnivel_dificultad IN VARCHAR2, Xtipo_entrenamiento IN VARCHAR2);
    PROCEDURE DEL_RUTINAS_EJEMPLO(Xid_rutina_ejemplo IN NUMBER);
    PROCEDURE CO_RUTINAS_EJEMPLO;
    
    -- Consultas adicionales
    FUNCTION CO_OBJETIVOS_USUARIOS RETURN SYS_REFCURSOR;
    FUNCTION CO_RUTINAS_EJEMPLO_NIVEL_DIFICULTAD RETURN SYS_REFCURSOR;
    
END PA_ESPECIALISTA_FITNESS;
/

COMMIT;