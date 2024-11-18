-- --------------------------------------------
-- T_MODULES
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS public.T_MODULES(
	module_key      VARCHAR(45) UNIQUE NOT NULL,
	PRIMARY KEY(module_key)
);

--

INSERT INTO T_MODULES VALUES ('mod-priv-user');
INSERT INTO T_MODULES VALUES ('mod-mix-product');

--

SELECT module_key FROM T_MODULES;