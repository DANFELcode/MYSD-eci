-- =====================================================
-- DEFINICIÓN DE ROLES Y PERMISOS - SISTEMA FITNESS
-- =====================================================

-- Crear roles para cada actor del sistema
CREATE ROLE GerenteFitness;
CREATE ROLE UsuarioApp;
CREATE ROLE AdministradorAppFitness;
CREATE ROLE EspecialistaFitness;

-- Asignar permisos de ejecución sobre los paquetes de seguridad
GRANT EXECUTE ON PA_GERENTE TO GerenteFitness;
GRANT EXECUTE ON PA_USUARIO TO UsuarioApp;
GRANT EXECUTE ON PA_ADMINISTRADOR_APP TO AdministradorAppFitness;
GRANT EXECUTE ON PA_ESPECIALISTA_FITNESS TO EspecialistaFitness;

COMMIT;