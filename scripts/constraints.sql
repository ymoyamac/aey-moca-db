-- --------------------------------------------
-- tua01_roles
-- --------------------------------------------

ALTER TABLE public.tua01_roles
    ADD CONSTRAINT ck01_tua01_roles_type
    CHECK (
        role_tx_type IN ('ADMIN_ROLE', 'EMPLOYEE_ROLE', 'USER_ROLE')
    );

ALTER TABLE public.tua01_roles
    ADD CONSTRAINT ck02_tua01_roles_type_has
    CHECK (
        role_tx_type ~* '^[A-Z]+_ROLE$'
    );

-- --------------------------------------------
-- tua02_genders
-- --------------------------------------------

ALTER TABLE public.tua02_genders
    ADD CONSTRAINT ck01_tua02_genders_name
    CHECK (
        gen_tx_name IN ('MALE', 'FEMALE')
    );

ALTER TABLE public.tua02_genders
    ADD CONSTRAINT ck02_tua02_genders_ab
    CHECK (
        gen_tx_abbrevation IN ('M', 'F')
    );


-- --------------------------------------------
-- tua05_users
-- --------------------------------------------

ALTER TABLE public.tua05_users
    ADD CONSTRAINT ck01_tua05_users_name
    CHECK (
        usr_tx_first_name ~* '^[a-zA-Z\u00C0-\u017F\\s]+$'
    );

ALTER TABLE public.tua05_users
    ADD CONSTRAINT ck02_tua05_users_last_name
    CHECK (
        usr_tx_last_name ~* '^[a-zA-Z\u00C0-\u017F\\s]+$'
    );

ALTER TABLE public.tua05_users
    ADD CONSTRAINT ck03_tua05_users_email
    CHECK (
        usr_tx_email ~* ('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
    );

ALTER TABLE public.tua05_users
    ADD CONSTRAINT ck04_tua05_users_backup_email
    CHECK (
        usr_tx_backup_email ~* ('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
    );

ALTER TABLE public.tua05_users
    ADD CONSTRAINT ck05_tua05_users_password
    CHECK (
        char_length(usr_tx_password) >= 8
        AND usr_tx_password ~* '^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\-=\[\]{};:\",.<>?]).{8,}$'
    );

ALTER TABLE public.tua05_users
    ADD CONSTRAINT ck06_tua05_users_phone_number
    CHECK (
        usr_tx_phone_number ~* ('^[0-9]{10}$')
);

ALTER TABLE public.tua05_users
    DROP CONSTRAINT ck06_tua05_users_phone_number;
    

-- --------------------------------------------
--tua06_employees
-- --------------------------------------------

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck01_tua06_employees_name
    CHECK (
        emp_tx_first_name ~* '^[a-zA-Z\u00C0-\u017F\\s]+$'
    );

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck02_tua06_employees_last_name
    CHECK (
        emp_tx_last_name ~* '^[a-zA-Z\u00C0-\u017F\\s]+$'
    );

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck03_tua06_employees_email
    CHECK (
        emp_tx_email ~* ('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
    );

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck04_tua06_employees_backup_email
    CHECK (
        emp_tx_backup_email ~* ('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
    );

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck05_tua06_employees_password
    CHECK (
        char_length(emp_tx_password) >= 8
        AND emp_tx_password ~* '^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\-=\[\]{};:\",.<>?]).{8,}$'
    );

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck06_tua06_employees_phone_number
    CHECK (
        emp_tx_phone_number ~* ('^[0-9]{10}$')
);

ALTER TABLE public.tua06_employees
    ADD CONSTRAINT ck07_tua06_employees_tag
    CHECK (
        LENGTH(emp_tx_tag) = 10 AND emp_tx_tag SIMILAR TO 'PN[A-Za-z0-9]{8}'
    );
