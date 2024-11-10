-- --------------------------------------------
-- T_COUNTRIES
-- --------------------------------------------
--https://www.iban.com/country-codes

CREATE TABLE IF NOT EXISTS public.T_COUNTRIES(
	country_id              INTEGER UNIQUE NOT NULL,
	ctry_tx_name            VARCHAR(50) NOT NULL,
	ctry_tx_abbrevation     VARCHAR(10) NOT NULL,
    ctry_nu_code            SMALLINT UNIQUE NOT NULL,
    ctry_dt_created_at      TIMESTAMP NOT NULL,
    ctry_dt_updated_at      TIMESTAMP NOT NULL,
	ctry_st_is_active       BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY(country_id)
);

--

INSERT INTO T_COUNTRIES VALUES (1, 'México', 'MX', 484, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (2, 'Canada', 'CAN', 124, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (3, 'España', 'ESP', 724, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (4, 'Chile', 'CHL', 152, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (5, 'Colombia', 'CO', 170, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (6, 'El Salvador', 'SV', 222, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (7, 'Panama', 'PAN', 591, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (8, 'Argentina', 'ARG', 32, NOW(), NOW(), true);
INSERT INTO T_COUNTRIES VALUES (9, 'Perú', 'PR', 604, NOW(), NOW(), true);

--

SELECT country_id AS id,
    ctry_tx_name AS name,
    ctry_tx_abbrevation AS abbrevation,
    ctry_nu_code AS code,
    ctry_dt_created_at AS created_at,
    ctry_dt_updated_at AS updated_at,
    ctry_st_is_active AS is_active
FROM T_COUNTRIES;