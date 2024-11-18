-- --------------------------------------------
-- T_SHR_CITIES
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_SHR_CITIES(
	city_id              	INTEGER UNIQUE NOT NULL,
	cty_tx_name        		VARCHAR(50) NOT NULL,
	cty_tx_abbrevation  	VARCHAR(10) NOT NULL,
    cty_dt_created_at       TIMESTAMP NOT NULL,
    cty_dt_updated_at       TIMESTAMP NOT NULL,
	cty_st_is_active    	BOOLEAN NOT NULL DEFAULT TRUE,
	cty_fk_country_id		INTEGER,
	PRIMARY KEY(city_id)
);

--

ALTER TABLE public.T_SHR_CITIES
	ADD CONSTRAINT fk01_T_SHR_CITIES_country
		FOREIGN KEY(cty_fk_country_id)
		REFERENCES T_SHR_COUNTRIES(country_id);

--

INSERT INTO T_SHR_CITIES VALUES (1, 'Ciudad de México', 'CDMX', NOW(), NOW() true, 1);
INSERT INTO T_SHR_CITIES VALUES (2, 'México', 'MX', NOW(), NOW() true, 1);
INSERT INTO T_SHR_CITIES VALUES (3, 'Querétaro', 'QT', NOW(), NOW() true, 1);
--INSERT INTO T_SHR_CITIES VALUES (4, 'Buenos aires', 'LM', NOW(), NOW() true, 8);
--INSERT INTO T_SHR_CITIES VALUES (5, 'Barcelona', 'BC', NOW(), NOW() true, 3);
--INSERT INTO T_SHR_CITIES VALUES (6, 'San Salvador', 'SS', NOW(), NOW() true, 6);
--INSERT INTO T_SHR_CITIES VALUES (7, 'Santiago de Chile', 'SCHL', NOW(), NOW() true, 4);
--INSERT INTO T_SHR_CITIES VALUES (8, 'Lima', 'LI', NOW(), NOW() true, 4);
--INSERT INTO T_SHR_CITIES VALUES (9, 'Madrid', 'LI', NOW(), NOW() true, 4);

--

SELECT city_id AS id,
    cty_tx_name AS name,
    cty_tx_abbrevation AS abbrevation,
    cty_dt_created_at AS created_at,
    cty_dt_updated_at AS updated_at,
    cty_st_is_active AS is_active
FROM T_CITIES;