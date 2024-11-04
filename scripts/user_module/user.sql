-- --------------------------------------------
-- T_USR01_USERS
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_USR01_USERS(
	user_id                 	INTEGER UNIQUE NOT NULL,
	usr_tx_name       			VARCHAR(45) NOT NULL,
	usr_tx_first_surname        VARCHAR(45) NOT NULL,
	usr_tx_second_surname       VARCHAR(45) NOT NULL,
	usr_dt_birthdate       		TIMESTAMP NOT NULL,
    usr_dt_created_at      		TIMESTAMP NOT NULL,
    usr_dt_updated_at      		TIMESTAMP NOT NULL,
	usr_st_is_active        	BOOLEAN NOT NULL DEFAULT TRUE,
	usr_fk_gender_id            INTEGER NOT NULL,
	usr_fk_role_id              INTEGER NOT NULL,
	usr_fk_detail_id			INTEGER,
	PRIMARY KEY(user_id)
);

-- --------------------------------------------
-- T_USR02_DETAILS
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_USR02_DETAILS(
	detail_id         		INTEGER UNIQUE NOT NULL,
	dtl_tx_email            VARCHAR(100) UNIQUE NOT NULL,
	dtl_tx_backup_email     VARCHAR(100) UNIQUE,
	dtl_tx_password         VARCHAR(100) NOT NULL,
	dtl_tx_mobile_phone     VARCHAR(10) NOT NULL,
	dtl_tx_phone_number     VARCHAR(10),
    dtl_dt_created_at      	TIMESTAMP NOT NULL,
    dtl_dt_updated_at      	TIMESTAMP NOT NULL,
	dtl_st_is_active        BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY(detail_id)
);

-- --------------------------------------------
-- T_USR03_ADDRESSES
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_USR03_ADDRESSES(
	address_id           	INTEGER UNIQUE NOT NULL,
	adr_tx_street     	 	VARCHAR(100) UNIQUE,
	adr_tx_number	     	VARCHAR(10) NOT NULL,
	adr_tx_zip_code	     	VARCHAR(20),
    adr_dt_created_at    	TIMESTAMP NOT NULL,
    adr_dt_updated_at    	TIMESTAMP NOT NULL,
	adr_st_is_active     	BOOLEAN NOT NULL DEFAULT TRUE,
	adr_fk_country_id 	 	INTEGER NOT NULL,
	adr_fk_city_id       	INTEGER NOT NULL,
	PRIMARY KEY(address_id)
);

-- --------------------------------------------
-- T_USR04_USERS_ADDRESSES_HUB
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_USR04_USERS_ADDRESSES_HUB(
	id           	INTEGER UNIQUE NOT NULL,
	user_id 	 	INTEGER NOT NULL,
	address_id 		INTEGER NOT NULL,
	PRIMARY KEY(id)
);

-- --------------------------------------------
-- CONTRAINS
-- --------------------------------------------

ALTER TABLE public.T_USR01_USERS
	ADD CONSTRAINT FK01_T_USR01_USERS_TO_GENDERS
		FOREIGN KEY(usr_fk_gender_id)
		REFERENCES T_SHR01_GENDERS(gender_id);

ALTER TABLE public.T_USR01_USERS
	ADD CONSTRAINT FK02_T_USR01_USERS_TO_ROLES
		FOREIGN KEY(usr_fk_role_id)
		REFERENCES T_R01_ROLES(role_id);

ALTER TABLE public.T_USR01_USERS
	ADD CONSTRAINT FK03_T_USR01_USERS_TO_DETAILS
		FOREIGN KEY(usr_fk_detail_id)
		REFERENCES T_USR02_DETAILS(detail_id);

--

ALTER TABLE public.T_USR03_ADDRESSES
	ADD CONSTRAINT FK01_T_USR03_ADDRESSES_TO_COUNTRY
		FOREIGN KEY(adr_fk_country_id)
		REFERENCES T_SHR02_COUNTRIES(country_id);

ALTER TABLE public.T_USR03_ADDRESSES
	ADD CONSTRAINT FK02_T_USR03_ADDRESSES_TO_CITY
		FOREIGN KEY(usr_fk_detail_id)
		REFERENCES T_SHR03_CITIES(city_id);

--

ALTER TABLE public.T_USR04_USERS_ADDRESSES_HUB
	ADD CONSTRAINT FK01_T_USR04_HUB_TO_USERS
		FOREIGN KEY(user_id)
		REFERENCES T_USR01_USERS(user_id);

ALTER TABLE public.T_USR04_USERS_ADDRESSES_HUB
	ADD CONSTRAINT FK02_T_USR04_HUB_TO_ADDRESS
		FOREIGN KEY(address_id)
		REFERENCES T_USR03_ADDRESSES(address_id);

-- --------------------------------------------
-- INSERTS
-- --------------------------------------------

INSERT INTO PUBLIC.T_USR01_USERS 
    (usr_tx_name, usr_tx_first_surname, usr_tx_second_surname, usr_dt_birthdate, usr_dt_created_at, usr_dt_updated_at, usr_st_is_active, usr_fk_gender_id, usr_fk_role_id, usr_fk_detail_id)
VALUES
    ('Yael Jaffar', 'Moya', 'Macías', '1999-12-29', NOW(), NOW(), TRUE, 1, 1, 1),
    ('Alejandro', 'Sanchez', 'Taboada', '1990-01-15', NOW(), NOW(), TRUE, 1, 2, 2),
    ('Antonio', 'Duran', 'Spain', '1987-04-19', NOW(), NOW(), TRUE, 1, 2, 3),
    ('John', 'Doe', 'Smith', '1990-01-15', NOW(), NOW(), TRUE, 1, 2, 4),
    ('Karla', 'Hernandez', 'Hernandez', '1985-07-23', NOW(), NOW(), TRUE, 2, 3, 5),
    ('Alice', 'Garcia', 'Herrera', '1992-12-11', NOW(), NOW(), FALSE, 2, 2, 6),
    ('Susana', 'Cuevas', 'Escobar', '1988-04-09', NOW(), NOW(), TRUE, 2, 4, 7),
    ('Emily', 'Davis', 'Lee', '1995-09-21', NOW(), NOW(), TRUE, 2, 3, 8),
    ('Miguel', 'Martinez', 'Garcia', '1983-11-05', NOW(), NOW(), FALSE, 1, 3, 9),
    ('Laura', 'Rodriguez', 'Lopez', '1991-02-13', NOW(), NOW(), TRUE, 2, 2, 10),
    ('Sarah', 'Moore', 'Thomas', '1993-08-14', NOW(), NOW(), TRUE, 2, 4, 11),
    ('David', 'Taylor', 'Jackson', '1987-10-25', NOW(), NOW(), FALSE, 1, 3, 12);

INSERT INTO public.T_USR02_DETAILS 
    (dtl_tx_email, dtl_tx_backup_email, dtl_tx_password, dtl_tx_mobile_phone, dtl_tx_phone_number, dtl_dt_created_at, dtl_dt_updated_at, dtl_st_is_active)
VALUES
    ('yael.moya@email.com', 'ymoyamac@correo.com', 'Passw0rd!', '5551234567', '5557654321', NOW(), NOW(), TRUE),
    ('ale_taboa@email.com', 'astaboa@correo.com', 'Passw0rd!', '5572212417', '558301321', NOW(), NOW(), TRUE),
    ('toniduran@email.com', 'spainduran@correo.com', 'Passw0rd!', '5558182187', '5678714321', NOW(), NOW(), TRUE),
	('john.doe@example.com', 'john.backup@example.com', 'password123', '5551234567', '5557654321', NOW(), NOW(), TRUE),
    ('karla.hernandez@example.com', NULL, 'Passw0rd!', '5551234569', NULL, NOW(), NOW(), FALSE),
    ('alice.garcia@example.com', 'alice.backup@example.com', 'Passw0rd!', '5551234570', '5557654324', NOW(), NOW(), TRUE),
    ('susana.cuevas.escobar@example.com', 'susana.backup@example.com', 'Passw0rd!', '5551234572', '5557654326', NOW(), NOW(), FALSE),
    ('emily.davis@example.com', NULL, 'Passw0rd!', '5551234571', NULL, NOW(), NOW(), TRUE),
    ('miguel.martinez@example.com', 'miguel.backup@example.com', 'Passw0rd!', '5551234574', NULL, NOW(), NOW(), TRUE),
    ('laura.rodriguez@example.com', NULL, 'Passw0rd!', '5551234573', '5557654327', NOW(), NOW(), TRUE),
    ('sarah.moore@example.com', 'sarah.backup@example.com', 'Passw0rd!', '5551234575', '5557654328', NOW(), NOW(), TRUE),
    ('david.taylor@example.com', NULL, 'Passw0rd!', '5551234576', NULL, NOW(), NOW(), FALSE);

INSERT INTO public.T_USR03_ADDRESSES 
    (adr_tx_street, adr_tx_number, adr_tx_zip_code, adr_dt_created_at, adr_dt_updated_at, adr_st_is_active, adr_fk_country_id, adr_fk_city_id)
VALUES
    ('Camino a casas viejas', '28', '54602', NOW(), NOW(), TRUE, 1, 1),
    ('Av. Central de puente nuevo', '23B', '23456', NOW(), NOW(), TRUE, 9, 8),
    ('Madrid, Paseo de la Castellana', '8', '34567', NOW(), NOW(), FALSE, 3, 9),
    ('1 Maple Road', '15C', '45678', NOW(), NOW(), TRUE, 2, 1),
    ('5 de mayo', '12D', '56789', NOW(), NOW(), TRUE, 1, 1),
    ('Insurgentes sur', '3', '67890', NOW(), NOW(), TRUE, 1, 1),
    ('Miguel Hidalgo, Avenida Río San Joaquín', '3', '67890', NOW(), NOW(), TRUE, 1, 1),
    ('404 Walnut St', '2B', '78901', NOW(), NOW(), FALSE, 2, 1),
    ('505 Ash Dr', '9A', '89012', NOW(), NOW(), TRUE, 3, 1),
    ('606 Beech Way', '7', '90123', NOW(), NOW(), TRUE, 1, 109),
    ('707 Fir Path', '5D', '01234', NOW(), NOW(), TRUE, 1, 110);


