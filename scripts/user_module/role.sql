
-- --------------------------------------------
-- T_ROL01_ROLES
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_ROL01_ROLES(
	role_id                     INTEGER UNIQUE NOT NULL,
	role_tx_type                VARCHAR(45) UNIQUE NOT NULL,
    role_pm_all                 BOOLEAN,
    role_pm_create              BOOLEAN,
	role_pm_read                BOOLEAN,
    role_pm_update              BOOLEAN,
	role_pm_detele              BOOLEAN,
    role_pm_enable_disable      BOOLEAN,
    role_dt_created_at          TIMESTAMP NOT NULL,
    role_dt_updated_at          TIMESTAMP NOT NULL,
	role_st_is_active           BOOLEAN NOT NULL,
    role_fk_module_id           VARCHAR(45) NOT NULL,
	PRIMARY KEY(role_id)
);

-- --------------------------------------------
-- T_ROL02_MODULES
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_ROL02_MODULES(
	module_id                   VARCHAR(45) UNIQUE NOT NULL,
    mod_tx_description          VARCHAR(255),
	PRIMARY KEY(module_id)
);

-- --------------------------------------------
-- CONTRAINS
-- --------------------------------------------

ALTER TABLE public.T_ROL01_ROLES
	ADD CONSTRAINT FK01_T_ROL01_ROLE_TO_MOD
		FOREIGN KEY(role_fk_module_id)
		REFERENCES T_ROL02_MODULES(module_id);

-- --------------------------------------------
-- INSERTS
-- --------------------------------------------

INSERT INTO T_ROL01_ROLES VALUES (1, 'ADMIN_ROLE', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, now(), now(), true, 'MOD-MOCA-USER');
INSERT INTO T_ROL01_ROLES VALUES (2, 'MANAGER_ROLE', FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, now(), now(), true, 'MOD-MOCA-USER');
INSERT INTO T_ROL01_ROLES VALUES (3, 'EMPLOYEE_ROLE', FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, now(), now(), true, 'MOD-MOCA-USER');
INSERT INTO T_ROL01_ROLES VALUES (4, 'CUSTOMER_ROLE', FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, now(), now(), true, 'MOD-MOCA-USER');
INSERT INTO T_ROL01_ROLES VALUES (5, 'GUESTS_ROLE', FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, now(), now(), true, 'MOD-MOCA-USER');

--

INSERT INTO T_ROL02_MODULES VALUES ('MOD-MOCA-USER', 'Management-oriented access control (MOCA). Handles registration, login, user profiles and account management.');

-- --------------------------------------------
-- SELECTS
-- --------------------------------------------

SELECT role_id AS id,
    role_tx_type AS type,
    role_pm_all AS all,
    role_pm_create AS create,
	role_pm_read AS read,
    role_pm_update AS update,
	role_pm_detele AS delete,
	role_pm_enable_disable AS enableDisable,
    role_dt_created_at AS created_at,
    role_dt_updated_at AS updated_at,
    role_st_is_active AS is_active,
    module_id
FROM T_ROL01_ROLES
INNER JOIN T_ROL02_MODULES ON T_ROL01_ROLES.role_fk_module_id = T_ROL02_MODULE.module_id
WHERE role_id = 1;

SELECT role_id AS id,
    role_tx_type AS type,
    role_dt_created_at AS created_at,
    role_dt_updated_at AS updated_at,
    role_st_is_active AS is_active
FROM T_ROL01_ROLES
WHERE role_id = 1 AND role_st_is_active = true;

SELECT T_ROL01_ROLES.role_id AS id,
    T_ROL01_ROLES.role_tx_type AS type,
    T_ROL01_ROLES.role_dt_created_at AS created_at,
    T_ROL01_ROLES.role_dt_updated_at AS updated_at,
    T_ROL01_ROLES.role_st_is_active AS is_active,
    UMP.ump_st_all AS all,
    UMP.ump_st_create AS create,
	UMP.ump_st_read AS read,
    UMP.ump_st_update AS update,
	UMP.ump_st_detele AS delete,
	UMP.ump_st_enable_disable AS enableDisable,
    UMP.ump_fk_module as module
FROM T_ROL01_ROLES
INNER JOIN T_ROL02_MODULE_USER_PERMISSIONS UMP
    ON T_ROL01_ROLES.role_id = UMP.ump_fk_role_id
WHERE T_ROL01_ROLES.role_id = 1;
    
