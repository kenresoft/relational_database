
SELECT *
FROM candidates
WHERE candidate_name LIKE '%j%';


SELECT electorate_id, electorate_name, gender, age, polling_unit, voting_location, category_id
FROM electorates
WHERE age > 30
ORDER BY age;


SELECT COUNT(position_name), position_name
FROM votes,
     positions
WHERE votes.position_id = positions.position_id
GROUP BY votes.position_id
ORDER BY votes.position_id;


SELECT SUM(age)
FROM electorates
WHERE age > 30;


SELECT AVG(age)
FROM electorates;


CREATE VIEW units AS
SELECT unit_location, date_created
FROM pollingunits;


DROP VIEW units;


SELECT DISTINCT vote_validation_id
FROM votes,
     electorates;


SELECT *
FROM parties
         INNER JOIN locations l on parties.office_location = l.location_id;


SELECT candidate_name
FROM candidates
UNION
SELECT party_color
FROM parties;


SELECT vote_validation_id
FROM votes
WHERE position_id BETWEEN 3 AND 5;


SELECT voting_date
FROM votes
WHERE EXISTS
          (SELECT electorate_name
           FROM electorates
           WHERE votes.vote_validation_id = electorates.electorate_id
             AND age < 50);


SELECT candidate_name,
       age *
       (registration_id + IFNULL(registrations.electorate_id, 0))
FROM candidates,
     registrations
WHERE candidates.candidate_id = registrations.candidate_id;


SELECT COUNT(age), electorate_name
FROM electorates
GROUP BY voting_location
HAVING COUNT(age) > 3;


SELECT electorate_name,
       LAG(age) OVER (PARTITION BY voting_location ORDER BY electorate_id) AS prev
FROM electorates;


SELECT registration_id, category_name, candidate_name
FROM registrations,
     candidates,
     categories
WHERE registrations.category_id = categories.category_id
  AND registrations.candidate_id = candidates.candidate_id
UNION
SELECT registration_id, category_name, electorate_name
FROM registrations,
     electorates,
     categories
WHERE registrations.category_id = categories.category_id
  AND registrations.electorate_id = electorates.electorate_id
ORDER BY registration_id;


SELECT registration_id,
       category_name           AS voter_category,
       candidates.candidate_id AS voter_id,
       candidate_name          AS voter_name,
       candidates.age          AS voter_age,
       candidates.gender       AS voter_gender,
       registration_date
FROM registrations,
     candidates,
     categories
WHERE registrations.category_id = categories.category_id
  AND registrations.candidate_id = candidates.candidate_id
UNION
SELECT registration_id,
       category_name             AS voter_category,
       electorates.electorate_id AS voter_id,
       electorate_name           AS voter_name,
       electorates.age           AS voter_age,
       electorates.gender        AS voter_gender,
       registration_date
FROM registrations,
     electorates,
     categories
WHERE registrations.category_id = categories.category_id
  AND registrations.electorate_id = electorates.electorate_id
ORDER BY registration_id;


SELECT MAX(age) AS max_age, electorate_name
FROM electorates;


SELECT MIN(age) AS min_age, candidate_name
FROM candidates;


SELECT *
FROM candidates
WHERE NOT candidate_name LIKE '%E%';


SELECT COUNT(age), age
FROM candidates
GROUP BY age;


UPDATE electorates
SET age = 46
WHERE electorate_id = 7;

