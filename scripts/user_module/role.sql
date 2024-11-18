
-- --------------------------------------------
-- T_ROL01_ROLES
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_ROL01_ROLES(
	role_id                 INTEGER UNIQUE NOT NULL,
	role_tx_type            VARCHAR(45) UNIQUE NOT NULL,
    role_dt_created_at      TIMESTAMP NOT NULL,
    role_dt_updated_at      TIMESTAMP NOT NULL,
	role_st_is_active       BOOLEAN NOT NULL,
	PRIMARY KEY(role_id)
);

-- --------------------------------------------
-- T_ROL02_PERMISSIONS
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_ROL02_MODULE_USER_PERMISSIONS(
    permission_id           INTEGER UNIQUE NOT NULL,
    ump_st_all              BOOLEAN,
    ump_st_create           BOOLEAN,
	ump_st_read             BOOLEAN,
    ump_st_update           BOOLEAN,
	ump_st_detele           BOOLEAN,
    ump_st_enable_disable   BOOLEAN,
	ump_fk_role_id          INTEGER NOT NULL,
    ump_fk_module           VARCHAR(45) UNIQUE NOT NULL,
	PRIMARY KEY(permission_id)
);

-- --------------------------------------------
-- CONTRAINS
-- --------------------------------------------

ALTER TABLE public.T_ROL02_MODULE_USER_PERMISSIONS
	ADD CONSTRAINT FK01_T_ROL02_MOD_TO_ROL
		FOREIGN KEY(ump_fk_role_id)
		REFERENCES T_ROL01_ROLES(role_id);

-- --------------------------------------------
-- INSERTS
-- --------------------------------------------

INSERT INTO T_ROL01_ROLES VALUES (1, 'ADMIN_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (2, 'MANAGER_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (3, 'EMPLOYEE_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (4, 'CUSTOMER_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (5, 'GUESTS_ROLE', now(), now(), true);

--

/*                                                      ALL CREATE READ UPDATE DELETE ENDIS*/
INSERT INTO T_ROL02_MODULE_USER_PERMISSIONS VALUES (1, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 1, 'mod-priv-user'); /* ADMIN_ROLE */
INSERT INTO T_ROL02_MODULE_USER_PERMISSIONS VALUES (1, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 1, 'mod-mix-product'); /* ADMIN_ROLE */
INSERT INTO T_ROL02_MODULE_USER_PERMISSIONS VALUES (2, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, 2, 'mod-priv-user'); /* MANAGER_ROLE */
INSERT INTO T_ROL02_MODULE_USER_PERMISSIONS VALUES (3, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, 3, 'mod-priv-user'); /* EMPLOYEE_ROLE */
INSERT INTO T_ROL02_MODULE_USER_PERMISSIONS VALUES (4, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, 4, 'mod-priv-user'); /* CUSTOMER_ROLE */
INSERT INTO T_ROL02_MODULE_USER_PERMISSIONS VALUES (5, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, 5, 'mod-priv-user'); /* GUESTS_ROLE */
-- --------------------------------------------
-- SELECTS
-- --------------------------------------------

SELECT role_id AS id,
    role_tx_type AS type,
    role_dt_created_at AS created_at,
    role_dt_updated_at AS updated_at,
    role_st_is_active AS is_active
FROM T_ROL01_ROLES;

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
    
