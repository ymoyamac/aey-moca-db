
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

CREATE TABLE IF NOT EXISTS public.T_ROL02_PERMISSIONS(
	permission_id          INTEGER UNIQUE NOT NULL,
	prm_tx_type            VARCHAR(45) UNIQUE NOT NULL,
    prm_dt_created_at      TIMESTAMP NOT NULL,
    prm_dt_updated_at      TIMESTAMP NOT NULL,
	prm_st_is_active       BOOLEAN NOT NULL,
	PRIMARY KEY(permission_id)
);

-- --------------------------------------------
-- T_ROL03_PERMISSIONS_ROLES_HUB
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_ROL03_PERMISSIONS_ROLES_HUB(
	id              INTEGER UNIQUE NOT NULL,
	role_id         INTEGER NOT NULL,
    permission_id   INTEGER NOT NULL,
	PRIMARY KEY(id)
);

-- --------------------------------------------
-- CONTRAINS
-- --------------------------------------------

ALTER TABLE public.T_ROL03_PERMISSIONS_ROLES_HUB
	ADD CONSTRAINT FK01_T_ROL03_HUB_TO_ROL
		FOREIGN KEY(role_id)
		REFERENCES T_ROL01_ROLES(role_id);

ALTER TABLE public.T_ROL03_PERMISSIONS_ROLES_HUB
	ADD CONSTRAINT FK02_T_ROL03_HUB_TO_PERMISSIONS
		FOREIGN KEY(permission_id)
		REFERENCES T_ROL02_PERMISSIONS(permission_id);

-- --------------------------------------------
-- INSERTS
-- --------------------------------------------

INSERT INTO T_ROL01_ROLES VALUES (1, 'ADMIN_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (2, 'EMPLOYEE_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (3, 'CUSTOMER_ROLE', now(), now(), true);
INSERT INTO T_ROL01_ROLES VALUES (4, 'PUBLIC_USER_ROLE', now(), now(), true);

--

INSERT INTO T_ROL02_PERMISSIONS VALUES (1, 'ALL', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (2, 'CREATE', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (3, 'READ', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (4, 'UPDATE', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (5, 'DELETE', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (6, 'READ_ONLY', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (7, 'CREATE_SCHOOL_SUPPLY_LIST', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (8, 'READ_SCHOOL_SUPPLY_LIST', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (9, 'UPDATE_SCHOOL_SUPPLY_LIST', now(), now(), true);
INSERT INTO T_ROL02_PERMISSIONS VALUES (10, 'DELETE_SCHOOL_SUPPLY_LIST', now(), now(), true);

--

INSERT INTO T_ROL03_PERMISSIONS_ROLES_HUB VALUES (1, 1, 1);
INSERT INTO T_ROL03_PERMISSIONS_ROLES_HUB VALUES (2, 2, 2);
INSERT INTO T_ROL03_PERMISSIONS_ROLES_HUB VALUES (3, 2, 3);
INSERT INTO T_ROL03_PERMISSIONS_ROLES_HUB VALUES (4, 2, 4);
INSERT INTO T_ROL03_PERMISSIONS_ROLES_HUB VALUES (5, 2, 5);
INSERT INTO T_ROL03_PERMISSIONS_ROLES_HUB VALUES (6, 4, 6);

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
    T_ROL02_PERMISSIONS.prm_tx_type AS permission
FROM T_ROL01_ROLES
INNER JOIN T_ROL03_PERMISSIONS_ROLES_HUB 
    ON T_ROL01_ROLES.role_id = T_ROL03_PERMISSIONS_ROLES_HUB.role_id
INNER JOIN T_ROL02_PERMISSIONS
    ON T_ROL03_PERMISSIONS_ROLES_HUB.permission_id = T_ROL02_PERMISSIONS.permission_id
WHERE T_ROL01_ROLES.role_id	= 2;
    
