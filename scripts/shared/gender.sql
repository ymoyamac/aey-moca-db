-- --------------------------------------------
-- T_SHR_GENDERS
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_SHR_GENDERS(
	gender_id             	VARCHAR(20) UNIQUE NOT NULL,
	gen_tx_key             	VARCHAR(1) UNIQUE NOT NULL,
    gen_dt_created_at       TIMESTAMP NOT NULL,
    gen_dt_updated_at       TIMESTAMP NOT NULL,
	gen_st_is_active    	BOOLEAN NOT NULL DEFAULT TRUE,
	PRIMARY KEY(gender_id)
);

-- --------------------------------------------
-- INSERTS
-- --------------------------------------------

INSERT INTO T_SHR_GENDERS VALUES ('MALE', 'M', NOW(), NOW(), true);
INSERT INTO T_SHR_GENDERS VALUES ('FEMALE', 'F', NOW(), NOW(), true);

-- --------------------------------------------
-- SELECTS
-- --------------------------------------------

SELECT gender_id AS gender,
    gen_tx_abbrevation AS code,
    gen_dt_created_at AS created_at,
    gen_dt_updated_at AS updated_at,
    gen_st_is_active AS is_active
FROM T_SHR_GENDERS;
