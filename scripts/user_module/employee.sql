
-- --------------------------------------------
-- T_EMP01_SCHEDULE
-- --------------------------------------------

CREATE TABLE IF NOT EXISTS MOCA.T_EMP01_SCHEDULES(
	schedule_id         	    INTEGER UNIQUE NOT NULL,
    sch_dt_start_time      	    TIMESTAMP NOT NULL,
    sch_dt_end_time      	    TIMESTAMP NOT NULL,
	sch_tx_shift_type           VARCHAR(45) UNIQUE NOT NULL,
    sch_dt_break_start_time     TIMESTAMP NOT NULL,
    sch_dt_break_end_time      	TIMESTAMP NOT NULL,
    sch_tx_location             VARCHAR(45),
    sch_tx_status               VARCHAR(45) NOT NULL,
    sch_dt_created_at      	    TIMESTAMP NOT NULL,
    sch_dt_updated_at      	    TIMESTAMP NOT NULL,
	sch_st_is_active            BOOLEAN NOT NULL DEFAULT TRUE,
    sch_fk_user_id              INTEGER
	PRIMARY KEY(schedule_id)
);

-- --------------------------------------------
-- CONTRAINS
-- --------------------------------------------

ALTER TABLE MOCA.T_EMP01_SCHEDULE
	ADD CONSTRAINT FK01_T_EMP01_SCHEDULE_TO_USERS
		FOREIGN KEY(sch_fk_user_id)
		REFERENCES T_USR01_USERS(user_id);

-- --------------------------------------------
-- SELECTS
-- --------------------------------------------

INSERT INTO MOCA.T_EMP01_SCHEDULES 
    (sch_dt_start_time, sch_dt_end_time, sch_tx_shift_type, sch_dt_break_start_time, sch_dt_break_end_time, sch_tx_location, sch_tx_status, sch_dt_created_at, sch_dt_updated_at, sch_st_is_active, sch_fk_user_id)
VALUES
    ('2024-10-22 08:00:00', '2024-10-22 16:00:00', 'Morning', '2024-10-22 12:00:00', '2024-10-22 12:30:00', 'Branch papers and notes', 'Active', NOW(), NOW(), TRUE, 1),
    ('2024-10-23 16:00:00', '2024-10-23 23:59:00', 'Evening', '2024-10-23 19:00:00', '2024-10-23 19:30:00', 'Branch papers and notes', 'Active', NOW(), NOW(), TRUE, 2),
    ('2024-10-24 09:00:00', '2024-10-24 17:00:00', 'Regular', '2024-10-24 12:30:00', '2024-10-24 13:00:00', 'Branch papers and notes', 'Active', NOW(), NOW(), TRUE, 3),
    ('2024-10-25 18:00:00', '2024-10-25 23:59:00', 'Night', '2024-10-25 20:00:00', '2024-10-25 20:30:00', 'Branch papers and notes', 'Active', NOW(), NOW(), TRUE, 4),
    ('2024-10-26 07:00:00', '2024-10-26 15:00:00', 'Morning', '2024-10-26 11:00:00', '2024-10-26 11:30:00', 'Branch papers and notes', 'Inactive', NOW(), NOW(), FALSE, 5);

