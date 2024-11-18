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
	usr_fk_account_id			INTEGER,
	PRIMARY KEY(user_id)
);

-- --------------------------------------------
-- T_USR02_ACCOUNTS
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_USR02_ACCOUNTS(
	account_id         		INTEGER UNIQUE NOT NULL,
	acc_tx_nickname			VARCHAR(45) NOT NULL,
	acc_tx_email            VARCHAR(100) UNIQUE NOT NULL,
	acc_tx_backup_email     VARCHAR(100) UNIQUE,
	acc_tx_password         VARCHAR(100) NOT NULL,
	acc_tx_mobile_phone     VARCHAR(10) NOT NULL,
	acc_tx_phone_number     VARCHAR(10),
	acc_tx_status			VARCHAR(45) NOT NULL,
	acc_json_images			JSONB,
    acc_dt_created_at      	TIMESTAMP NOT NULL,
    acc_dt_updated_at      	TIMESTAMP NOT NULL,
	acc_st_is_active        BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY(account_id)
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
		REFERENCES T_SHR_GENDERS(gender_id);

ALTER TABLE public.T_USR01_USERS
	ADD CONSTRAINT FK02_T_USR01_USERS_TO_ROLES
		FOREIGN KEY(usr_fk_role_id)
		REFERENCES T_ROL01_ROLES(role_id);

ALTER TABLE public.T_USR01_USERS
	ADD CONSTRAINT FK03_T_USR01_USERS_TO_ACCOUNTS
		FOREIGN KEY(usr_fk_account_id)
		REFERENCES T_USR02_ACCOUNTS(account_id);

--

ALTER TABLE public.T_USR03_ADDRESSES
	ADD CONSTRAINT FK01_T_USR03_ADDRESSES_TO_COUNTRY
		FOREIGN KEY(adr_fk_country_id)
		REFERENCES T_SHR_COUNTRIES(country_id);

ALTER TABLE public.T_USR03_ADDRESSES
	ADD CONSTRAINT FK02_T_USR03_ADDRESSES_TO_CITY
		FOREIGN KEY(adr_fk_city_id)
		REFERENCES T_SHR_CITIES(city_id);

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

INSERT INTO public.T_USR02_ACCOUNTS 
    (account_id, acc_tx_nickname, acc_tx_email, acc_tx_backup_email, acc_tx_password, acc_tx_mobile_phone, acc_tx_phone_number, acc_tx_status, acc_json_images, acc_dt_created_at, acc_dt_updated_at, acc_st_is_active)
VALUES
    (1, 'ymoyamac', 'yael.moya@email.com', 'ymoyamac@correo.com', 'Passw0rd!', '5551234567', '5557654321', 'ACTIVE', '{"images": [{"id": 1,"url": "https://image-1.jpg","description": "User image 1"}]}'::jsonb, NOW(), NOW(), TRUE),
    (2, 'programacionats', 'ale_taboa@email.com', 'astaboa@correo.com', 'Passw0rd!', '5572212417', '558301321', 'ACTIVE', NULL, NOW(), NOW(), TRUE),
    (3, 'sarori', 'toniduran@email.com', 'spainduran@correo.com', 'Passw0rd!', '5558182187', '5678714321', 'ACTIVE', NULL, NOW(), NOW(), TRUE),
	(4, 'johndoe', 'john.doe@example.com', 'john.backup@example.com', 'password123', '5551234567', '5557654321', 'ACTIVE', NULL, NOW(), NOW(), TRUE),
    (5, 'karlahdz', 'karla.hernandez@example.com', NULL, 'Passw0rd!', '5551234569', NULL, 'ACTIVE', NULL, NOW(), NOW(), FALSE),
    (6, 'susana.cuevas', 'susana.cuevas.escobar@example.com', 'susana.backup@example.com', 'Passw0rd!', '5551234572', '5557654326', 'ACTIVE', NULL, NOW(), NOW(), FALSE);

INSERT INTO PUBLIC.T_USR01_USERS 
    (user_id, usr_tx_name, usr_tx_first_surname, usr_tx_second_surname, usr_dt_birthdate, usr_dt_created_at, usr_dt_updated_at, usr_st_is_active, usr_fk_gender_id, usr_fk_role_id, usr_fk_account_id)
VALUES
    (1, 'Yael Jaffar', 'Moya', 'Macías', '1999-12-29', NOW(), NOW(), TRUE, 1, 1, 1),
    (2, 'Alejandro', 'Sanchez', 'Taboada', '1990-01-15', NOW(), NOW(), TRUE, 1, 2, 2),
    (3, 'Antonio', 'Sarosi', 'Spain', '1987-04-19', NOW(), NOW(), TRUE, 1, 2, 3),
    (4, 'John', 'Doe', 'Smith', '1990-01-15', NOW(), NOW(), TRUE, 1, 2, 4),
    (5, 'Karla', 'Hernandez', 'Hernandez', '1985-07-23', NOW(), NOW(), TRUE, 2, 3, 5),
    (6, 'Susana', 'Cuevas', 'Escobar', '1988-04-09', NOW(), NOW(), TRUE, 2, 4, 6);

INSERT INTO public.T_USR03_ADDRESSES 
    (address_id, adr_tx_street, adr_tx_number, adr_tx_zip_code, adr_dt_created_at, adr_dt_updated_at, adr_st_is_active, adr_fk_country_id, adr_fk_city_id)
VALUES
    (1, 'Camino a casas viejas', '28', '54602', NOW(), NOW(), TRUE, 1, 1),
    (2, 'Av. Central de puente nuevo', '23B', '23456', NOW(), NOW(), TRUE, 9, 8),
    (3, 'Madrid, Paseo de la Castellana', '8', '34567', NOW(), NOW(), FALSE, 3, 9),
    (4, '1 Maple Road', '15C', '45678', NOW(), NOW(), TRUE, 2, 1),
    (5, '5 de mayo', '12D', '56789', NOW(), NOW(), TRUE, 1, 1),
    (6, 'Insurgentes sur', '3', '67890', NOW(), NOW(), TRUE, 1, 1);

INSERT INTO PUBLIC.T_USR04_USERS_ADDRESSES_HUB
	(id, user_id, address_id)
VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(6, 6, 6);

-- --------------------------------------------
-- SELECTS
-- --------------------------------------------

SELECT T_USR01_USERS.user_id,
	T_USR01_USERS.usr_tx_name,
	T_USR01_USERS.usr_tx_first_surname,
	T_USR01_USERS.usr_tx_second_surname,
	T_USR01_USERS.usr_dt_birthdate,
	T_USR01_USERS.usr_st_is_active,
	T_USR02_ACCOUNTS.account_id,
	T_USR02_ACCOUNTS.acc_tx_nickname,
	T_USR02_ACCOUNTS.acc_tx_email,
	T_USR02_ACCOUNTS.acc_tx_backup_email,
	T_USR02_ACCOUNTS.acc_tx_password,
	T_USR02_ACCOUNTS.acc_tx_mobile_phone,
	T_USR02_ACCOUNTS.acc_tx_phone_number,
	T_USR02_ACCOUNTS.acc_tx_status,
	T_USR02_ACCOUNTS.acc_json_images,
	T_USR03_ADDRESSES.address_id,
	T_USR03_ADDRESSES.adr_tx_street,
	T_USR03_ADDRESSES.adr_tx_number,
	T_USR03_ADDRESSES.adr_tx_zip_code,
	T_USR03_ADDRESSES.adr_fk_country_id,
	T_USR03_ADDRESSES.adr_fk_city_id,
	T_ROL01_ROLES.role_id,
	T_ROL01_ROLES.role_tx_type,
FROM T_USR01_USERS
INNER JOIN T_USR02_ACCOUNTS ON T_USR01_USERS.usr_fk_account_id = T_USR02_ACCOUNTS.account_id
INNER JOIN T_USR04_USERS_ADDRESSES_HUB ON T_USR01_USERS.user_id = T_USR04_USERS_ADDRESSES_HUB.user_id
INNER JOIN T_USR03_ADDRESSES ON T_USR04_USERS_ADDRESSES_HUB.address_id = T_USR03_ADDRESSES.address_id
INNER JOIN T_ROL01_ROLES ON T_USR01_USERS.usr_fk_role_id = T_ROL01_ROLES.role_id;
