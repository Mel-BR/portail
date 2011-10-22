CREATE TABLE article (id BIGINT AUTO_INCREMENT, asso_id BIGINT, name VARCHAR(200), text TEXT, is_weekmail TINYINT(1), image TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX asso_id_idx (asso_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE asso (id BIGINT AUTO_INCREMENT, name VARCHAR(50), login VARCHAR(32), pole_id BIGINT, type_id BIGINT, url_site VARCHAR(100), description TEXT, logo VARCHAR(100), active TINYINT(1), passation TINYINT(1), local VARCHAR(6), phone VARCHAR(15), facebook TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX pole_id_idx (pole_id), INDEX type_id_idx (type_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE asso_member (id BIGINT AUTO_INCREMENT, user_id BIGINT, asso_id BIGINT, role_id BIGINT, semestre_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX asso_id_idx (asso_id), INDEX role_id_idx (role_id), INDEX user_id_idx (user_id), INDEX semestre_id_idx (semestre_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE branche (id BIGINT AUTO_INCREMENT, name VARCHAR(3), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE event (id BIGINT AUTO_INCREMENT, asso_id BIGINT, type_id BIGINT, name VARCHAR(50), description TEXT, start_date DATETIME, end_date DATETIME, is_public TINYINT(1), is_weekmail TINYINT(1), place TEXT, affiche TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX asso_id_idx (asso_id), INDEX type_id_idx (type_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE event_type (id BIGINT AUTO_INCREMENT, name VARCHAR(50), color VARCHAR(7), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE place (id BIGINT AUTO_INCREMENT, street TEXT, zipcode VARCHAR(10), city VARCHAR(100), country VARCHAR(100), phone VARCHAR(15), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE pole (id BIGINT AUTO_INCREMENT, asso_id BIGINT, couleur VARCHAR(7), INDEX asso_id_idx (asso_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE profile (id BIGINT AUTO_INCREMENT, user_id BIGINT, domain VARCHAR(15), nickname VARCHAR(50), birthday DATE, sexe CHAR(1), mobile VARCHAR(15), home_place BIGINT, family_place BIGINT, branche_id BIGINT, filiere_id BIGINT, semestre BIGINT, other_email TEXT, photo TEXT, weekmail TINYINT(1), autorisation_photo TINYINT(1), cotisant TINYINT(1), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), INDEX home_place_idx (home_place), INDEX family_place_idx (family_place), INDEX branche_idx (branche), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE role (id BIGINT AUTO_INCREMENT, name VARCHAR(50), sort INT, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE semestre (id BIGINT AUTO_INCREMENT, name VARCHAR(3), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE type_asso (id BIGINT AUTO_INCREMENT, name VARCHAR(50), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), email_address VARCHAR(255) NOT NULL UNIQUE, username VARCHAR(128) NOT NULL, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE article ADD CONSTRAINT article_asso_id_asso_id FOREIGN KEY (asso_id) REFERENCES asso(id);
ALTER TABLE asso ADD CONSTRAINT asso_type_id_type_asso_id FOREIGN KEY (type_id) REFERENCES type_asso(id);
ALTER TABLE asso ADD CONSTRAINT asso_pole_id_pole_id FOREIGN KEY (pole_id) REFERENCES pole(id);
ALTER TABLE asso_member ADD CONSTRAINT asso_member_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE asso_member ADD CONSTRAINT asso_member_semestre_id_semestre_id FOREIGN KEY (semestre_id) REFERENCES semestre(id);
ALTER TABLE asso_member ADD CONSTRAINT asso_member_role_id_role_id FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE asso_member ADD CONSTRAINT asso_member_asso_id_asso_id FOREIGN KEY (asso_id) REFERENCES asso(id);
ALTER TABLE event ADD CONSTRAINT event_type_id_event_type_id FOREIGN KEY (type_id) REFERENCES event_type(id);
ALTER TABLE event ADD CONSTRAINT event_asso_id_asso_id FOREIGN KEY (asso_id) REFERENCES asso(id);
ALTER TABLE pole ADD CONSTRAINT pole_asso_id_asso_id FOREIGN KEY (asso_id) REFERENCES asso(id);
ALTER TABLE profile ADD CONSTRAINT profile_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE profile ADD CONSTRAINT profile_home_place_place_id FOREIGN KEY (home_place) REFERENCES place(id);
ALTER TABLE profile ADD CONSTRAINT profile_family_place_place_id FOREIGN KEY (family_place) REFERENCES place(id);
ALTER TABLE profile ADD CONSTRAINT profile_branche_branche_id FOREIGN KEY (branche) REFERENCES branche(id);
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
