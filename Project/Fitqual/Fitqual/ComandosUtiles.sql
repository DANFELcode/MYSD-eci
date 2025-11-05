--Saber todas las claves primarias que hay junto con su columna

SELECT 
    ut.table_name,
    uc.constraint_name AS primary_key_name,
    ucc.column_name AS primary_key_column,
    ut.num_rows,
    ut.last_analyzed
FROM user_tables ut
LEFT JOIN user_constraints uc ON ut.table_name = uc.table_name AND uc.constraint_type = 'P'
LEFT JOIN user_cons_columns ucc ON uc.constraint_name = ucc.constraint_name
ORDER BY ut.table_name;

-- Ver todas las tablas de tu usuario actual
SELECT table_name 
FROM user_tables 
ORDER BY table_name;