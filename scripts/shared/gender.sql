--T_SHR01_GENDERS

CREATE TABLE IF NOT EXISTS public.T_SHR01_GENDERS(
	gender_id           	INTEGER UNIQUE NOT NULL,
	gen_tx_name         	VARCHAR(20) UNIQUE NOT NULL,
	gen_tx_abbrevation  	VARCHAR(2) UNIQUE NOT NULL,
    gen_dt_created_at       TIMESTAMP NOT NULL,
    gen_dt_updated_at       TIMESTAMP NOT NULL,
	gen_st_is_active    	BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY(gender_id)
);

--

INSERT INTO T_SHR01_GENDERS VALUES (1, 'MALE', 'M', true);
INSERT INTO T_SHR01_GENDERS VALUES (2, 'FEMALE', 'F', true);
INSERT INTO T_SHR01_GENDERS VALUES (2, 'OTHER', 'O', true);

--

SELECT gender_id AS id,
    gen_tx_name AS gender,
    gen_tx_abbrevation AS code,
    gen_dt_created_at AS created_at,
    gen_dt_updated_at AS updated_at,
    gen_st_is_active AS is_active
FROM T_SHR01_GENDERS;