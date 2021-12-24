CREATE TABLE `dim_date` (
  `date_key` int PRIMARY KEY AUTO_INCREMENT,
  `date_str` varchat(10),
  `year` int,
  `quarte` int,
  `month` int,
  `week` int,
  `day_of_year` int,
  `day_of_month` int,
  `day_of_week` int,
  `is_weekend` boolean,
  `is_holiday` boolean
);

CREATE TABLE `dim_hour_minute` (
  `hour_minute_key` int PRIMARY KEY AUTO_INCREMENT,
  `hour_minute_str` varchat(10),
  `hour` varchat(2),
  `minute` varchat(2),
  `am_or_pm` varchat(2)
);

CREATE TABLE `dim_zip` (
  `zip_key` int PRIMARY KEY AUTO_INCREMENT,
  `incident_zip` varchat(10)
);

CREATE TABLE `dim_city` (
  `city_key` int PRIMARY KEY AUTO_INCREMENT,
  `city` varchart(50)
);

CREATE TABLE `dim_borough` (
  `borough_key` int PRIMARY KEY AUTO_INCREMENT,
  `borough` varchart(20)
);

CREATE TABLE `dim_incident_address` (
  `incident_address_key` int PRIMARY KEY AUTO_INCREMENT,
  `incident_address` varchart(200),
  `street_name` varchart(200),
  `cross_street1` varchart(200),
  `cross_street2` varchart(200)
);

CREATE TABLE `dim_status` (
  `status_key` int PRIMARY KEY AUTO_INCREMENT,
  `status` varchart(10)
);

CREATE TABLE `dim_community_board` (
  `community_board_key` int PRIMARY KEY AUTO_INCREMENT,
  `community_board` varchart(20)
);

CREATE TABLE `dim_resolution_action` (
  `resolution_action_key` int PRIMARY KEY AUTO_INCREMENT,
  `resolution_description` varchart(200)
);

CREATE TABLE `dim_nta` (
  `nta_key` int PRIMARY KEY AUTO_INCREMENT,
  `nta` varchart(100)
);

CREATE TABLE `dim_bbl` (
  `bbl_key` int PRIMARY KEY AUTO_INCREMENT,
  `bbl` varchart(100)
);

CREATE TABLE `dim_police_precinct` (
  `police_precinct_key` int PRIMARY KEY AUTO_INCREMENT,
  `police_precinct` varchart(100)
);

CREATE TABLE `fact_graffiti` (
  `created_date_key` int,
  `closed_date_key` int,
  `zip_key` int,
  `city_key` int,
  `borough_key` int,
  `incident_address_key` int,
  `community_board_key` int,
  `police_precinct_key` int,
  `status_key` int,
  `resolution_action_key` int,
  `NTA_key` int,
  `BBL_key` int,
  `created_date_hour_minute_key` int,
  `closed_date_hour_minute_key` int,
  `Latitude` float,
  `Longitude` float,
  `census_tract` int,
  `BIN` int
);

ALTER TABLE `dim_date` ADD FOREIGN KEY (`date_key`) REFERENCES `fact_graffiti` (`created_date_key`);

ALTER TABLE `dim_date` ADD FOREIGN KEY (`date_key`) REFERENCES `fact_graffiti` (`closed_date_key`);

ALTER TABLE `dim_zip` ADD FOREIGN KEY (`zip_key`) REFERENCES `fact_graffiti` (`zip_key`);

ALTER TABLE `dim_city` ADD FOREIGN KEY (`city_key`) REFERENCES `fact_graffiti` (`city_key`);

ALTER TABLE `dim_borough` ADD FOREIGN KEY (`borough_key`) REFERENCES `fact_graffiti` (`borough_key`);

ALTER TABLE `dim_status` ADD FOREIGN KEY (`status_key`) REFERENCES `fact_graffiti` (`status_key`);

ALTER TABLE `dim_hour_minute` ADD FOREIGN KEY (`hour_minute_key`) REFERENCES `fact_graffiti` (`created_date_hour_minute_key`);

ALTER TABLE `dim_hour_minute` ADD FOREIGN KEY (`hour_minute_key`) REFERENCES `fact_graffiti` (`closed_date_hour_minute_key`);

ALTER TABLE `dim_community_board` ADD FOREIGN KEY (`community_board_key`) REFERENCES `fact_graffiti` (`community_board_key`);

ALTER TABLE `dim_resolution_action` ADD FOREIGN KEY (`resolution_action_key`) REFERENCES `fact_graffiti` (`resolution_action_key`);

ALTER TABLE `dim_incident_address` ADD FOREIGN KEY (`incident_address_key`) REFERENCES `fact_graffiti` (`incident_address_key`);

ALTER TABLE `dim_police_precinct` ADD FOREIGN KEY (`police_precinct_key`) REFERENCES `fact_graffiti` (`police_precinct_key`);

ALTER TABLE `dim_nta` ADD FOREIGN KEY (`nta_key`) REFERENCES `fact_graffiti` (`NTA_key`);

ALTER TABLE `dim_bbl` ADD FOREIGN KEY (`bbl_key`) REFERENCES `fact_graffiti` (`BBL_key`);
