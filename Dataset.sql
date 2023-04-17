
DROP TABLE IF EXISTS `Candidates`;
DROP TABLE IF EXISTS `Electorates`;
DROP TABLE IF EXISTS `Categories`;
DROP TABLE IF EXISTS `Locations`;
DROP TABLE IF EXISTS `PollingUnits`;
DROP TABLE IF EXISTS `Parties`;
DROP TABLE IF EXISTS `Registrations`;
DROP TABLE IF EXISTS `Positions`;
DROP TABLE IF EXISTS `Votes`;


CREATE TABLE `candidates` (
  `candidate_id` int(11) NOT NULL,
  `candidate_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `candidates` (`candidate_id`, `candidate_name`, `gender`, `age`, `position_id`, `party_id`, `category_id`) VALUES
(1, 'Jose Andrew', 'Male', 38, 3, 1, 1),
(2, 'Julie Kramer', 'Female ', 42, 2, 1, 1),
(3, 'Beth Perez', 'Female', 30, 4, 1, 1),
(4, 'Susan Hang ', 'Female', 35, 5, 2, 1),
(5, 'Williams Mclntosh', 'Male', 45, 1, 1, 1),
(6, 'John Godwin', 'Male', 40, 1, 2, 1),
(7, 'Aaron Simmons ', 'Male', 35, 2, 2, 1),
(8, 'Verna Morin', 'Female ', 44, 2, 3, 1),
(9, 'Alice Edwards ', 'Female ', 37, 5, 3, 1),
(10, 'Richard Tate', 'Male', 30, 4, 2, 1),
(11, 'Fonda Gibbs', 'Male', 41, 3, 2, 1),
(12, 'Martha Bowers', 'Female ', 30, 1, 3, 1);


CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Candidate'),
(2, 'Electorate');


CREATE TABLE `electorates` (
  `electorate_id` int(11) NOT NULL,
  `electorate_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `polling_unit` int(11) NOT NULL COMMENT 'An electorate maintains only one registered polling unit.',
  `voting_location` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `electorates` (`electorate_id`, `electorate_name`, `gender`, `age`, `polling_unit`, `voting_location`, `category_id`) VALUES
(1, 'John Marguez ', 'Male', 28, 2, 1, 2),
(2, 'Harry Ellis', 'Male', 31, 5, 3, 2),
(3, 'Chris Wagner', 'Male', 24, 10, 5, 2),
(4, 'Elizabeth Anderson ', 'Female ', 36, 1, 1, 2),
(5, 'Annette Garrison ', 'Female ', 21, 7, 4, 2),
(6, 'Jonathan Flood', 'Male', 50, 6, 3, 2),
(7, 'Michelle Trolley ', 'Female', 45, 3, 2, 2),
(8, 'Mia Parisien', 'Female ', 30, 9, 5, 2),
(9, 'Vivian Madore', 'Female ', 41, 4, 2, 2),
(10, 'Loren Gerald ', 'Male ', 37, 2, 1, 2),
(11, 'Mary Erwin ', 'Female ', 44, 10, 5, 2),
(12, 'Paul Handley', 'Male', 36, 3, 2, 2),
(13, 'Alice Burton', 'Female ', 41, 5, 3, 2),
(14, 'Patricia Harris ', 'Female ', 46, 8, 4, 2),
(15, 'Aaron Smith ', 'Male', 20, 8, 4, 2),
(16, 'Kenneth Bowden ', 'Male', 22, 1, 1, 2),
(17, 'Cheryl Raymond ', 'Female ', 38, 7, 4, 2),
(18, 'William Flower', 'Male', 25, 2, 1, 2),
(19, 'Deborah Howard ', 'Female ', 31, 9, 5, 2),
(20, 'Thomas Walker ', 'Male', 29, 4, 2, 2);


CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `locations` (`location_id`, `location_name`) VALUES
(1, 'California '),
(2, 'Texas '),
(3, 'Florida '),
(4, 'Washington '),
(5, 'Alaska ');


CREATE TABLE `parties` (
  `party_id` int(11) NOT NULL,
  `party_name` varchar(255) NOT NULL,
  `party_color` varchar(255) NOT NULL,
  `office_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `parties` (`party_id`, `party_name`, `party_color`, `office_location`) VALUES
(1, 'AA Party', 'Green and Yellow', 3),
(2, 'BW Party ', 'Purple and White ', 1),
(3, 'UM Party ', 'Blue and Red', 4);


CREATE TABLE `pollingunits` (
  `unit_id` int(11) NOT NULL,
  `unit_label` varchar(255) NOT NULL,
  `unit_location` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `pollingunits` (`unit_id`, `unit_label`, `unit_location`, `date_created`) VALUES
(1, 'San Francisco ', 1, '2022-01-24 11:10:45'),
(2, 'San Diego ', 1, '2022-01-31 11:29:45'),
(3, 'Houston ', 2, '2022-02-09 11:30:45'),
(4, 'San Antonio ', 2, '2022-02-11 11:12:45'),
(5, 'Sarasota ', 3, '2022-02-23 11:16:45'),
(6, 'Naples ', 3, '2022-03-03 11:11:45'),
(7, 'Tacoma ', 4, '2022-04-15 11:42:45'),
(8, 'Everett ', 4, '2022-05-10 11:30:45'),
(9, 'Anchorage ', 5, '2022-05-10 11:55:45'),
(10, 'Fairbanks ', 5, '2022-06-04 11:50:45');


CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `positions` (`position_id`, `position_name`) VALUES
(1, 'President '),
(2, 'Secretary '),
(3, 'Financial Secretary '),
(4, 'Provost '),
(5, 'PRO');


CREATE TABLE `registrations` (
  `registration_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `electorate_id` int(11) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `registrations` (`registration_id`, `category_id`, `candidate_id`, `electorate_id`, `registration_date`) VALUES
(1, 1, 1, NULL, '2022-06-05 22:10:48'),
(2, 1, 2, NULL, '2022-06-05 23:02:30'),
(3, 1, 3, NULL, '2022-06-05 23:02:30'),
(4, 2, NULL, 1, '2022-06-05 23:04:18'),
(5, 2, NULL, 2, '2022-06-05 23:04:18'),
(6, 1, 4, NULL, '2022-06-08 13:43:52'),
(7, 1, 5, NULL, '2022-06-08 13:43:52'),
(8, 2, NULL, 3, '2022-06-08 13:44:26'),
(9, 2, NULL, 4, '2022-06-08 13:44:26');


CREATE TABLE `votes` (
  `vote_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `voter_category` varchar(255) NOT NULL,
  `vote_validation_id` int(11) NOT NULL,
  `voting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `votes` (`vote_id`, `position_id`, `party_id`, `voter_category`, `vote_validation_id`, `voting_date`) VALUES
(1, 1, 1, 'Candidate', 1, '2022-06-07 18:50:17'),
(2, 5, 3, 'Candidate', 1, '2022-06-08 09:25:54'),
(3, 3, 2, 'Electorate', 5, '2022-06-08 09:26:46'),
(4, 4, 3, 'Electorate', 5, '2022-06-08 13:40:05'),
(5, 2, 1, 'Candidate', 3, '2022-06-08 13:40:15'),
(6, 5, 1, 'Candidate', 3, '2022-06-08 13:40:47'),
(7, 2, 2, 'Electorate', 4, '2022-06-08 13:41:00'),
(8, 2, 1, 'Electorate', 4, '2022-06-08 13:42:49'),
(9, 3, 1, 'Electorate', 9, '2022-06-08 13:44:48'),
(10, 1, 3, 'Candidate', 7, '2022-06-08 13:45:01'),
(11, 2, 2, 'Electorate', 8, '2022-06-08 13:45:15'),
(12, 5, 1, 'Candidate', 6, '2022-06-08 13:45:40');


ALTER TABLE `candidates`
  ADD PRIMARY KEY (`candidate_id`),
  ADD KEY `Candidates_position_id_Positions_position_id` (`position_id`),
  ADD KEY `Candidates_party_id_Parties_party_id` (`party_id`),
  ADD KEY `Candidates_category_id_Categories_category_id` (`category_id`);


ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);


ALTER TABLE `electorates`
  ADD PRIMARY KEY (`electorate_id`),
  ADD KEY `Electorates_polling_unit_PollingUnits_unit_id` (`polling_unit`),
  ADD KEY `Electorates_voting_location_Locations_location_id` (`voting_location`),
  ADD KEY `Electorates_category_id_Categories_category_id` (`category_id`);


ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);


ALTER TABLE `parties`
  ADD PRIMARY KEY (`party_id`),
  ADD KEY `Parties_office_location_Locations_location_id` (`office_location`);


ALTER TABLE `pollingunits`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `PollingUnits_unit_location_Locations_location_id` (`unit_location`);


ALTER TABLE `positions`
  ADD PRIMARY KEY (`position_id`);


ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `electorate_id` (`electorate_id`),
  ADD UNIQUE KEY `candidate_id` (`candidate_id`),
  ADD KEY `Registrations_category_id_Categories_category_id` (`category_id`);


ALTER TABLE `votes`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `Votes_position_id_Positions_position_id` (`position_id`),
  ADD KEY `Votes_party_id_Parties_party_id` (`party_id`),
  ADD KEY `Votes_voter_category_Categories_category_name` (`voter_category`),
  ADD KEY `Votes_vote_validation_id_Registrations_registration_id` (`vote_validation_id`);


ALTER TABLE `candidates`
  MODIFY `candidate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;


ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `electorates`
  MODIFY `electorate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `parties`
  MODIFY `party_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `pollingunits`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `registrations`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `votes`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `candidates`
  ADD CONSTRAINT `Candidates_category_id_Categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Candidates_party_id_Parties_party_id` FOREIGN KEY (`party_id`) REFERENCES `parties` (`party_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Candidates_position_id_Positions_position_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `electorates`
  ADD CONSTRAINT `Electorates_category_id_Categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Electorates_polling_unit_PollingUnits_unit_id` FOREIGN KEY (`polling_unit`) REFERENCES `pollingunits` (`unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Electorates_voting_location_Locations_location_id` FOREIGN KEY (`voting_location`) REFERENCES `locations` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `parties`
  ADD CONSTRAINT `Parties_office_location_Locations_location_id` FOREIGN KEY (`office_location`) REFERENCES `locations` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `pollingunits`
  ADD CONSTRAINT `PollingUnits_unit_location_Locations_location_id` FOREIGN KEY (`unit_location`) REFERENCES `locations` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `registrations`
  ADD CONSTRAINT `Registrations_candidate_id_Candidates_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Registrations_category_id_Categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Registrations_electorate_id_Electorates_electorate_id` FOREIGN KEY (`electorate_id`) REFERENCES `electorates` (`electorate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `votes`
  ADD CONSTRAINT `Votes_party_id_Parties_party_id` FOREIGN KEY (`party_id`) REFERENCES `parties` (`party_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Votes_position_id_Positions_position_id` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Votes_vote_validation_id_Registrations_registration_id` FOREIGN KEY (`vote_validation_id`) REFERENCES `registrations` (`registration_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Votes_voter_category_Categories_category_name` FOREIGN KEY (`voter_category`) REFERENCES `categories` (`category_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

