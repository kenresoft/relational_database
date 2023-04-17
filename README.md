# relational_database

## Relational Database demonstration with SQL

A Relational Database is a form of database that stores and organizes data elements with established relationships in order to provide quick access.

### Entity
In a database, an entity is essentially a container for storing and separating information relevant to the project's objectives.

### Property/Attribute
The characterizing features or properties that identify all objects belonging to a specific category and are applied to all cells in a column are known as attributes.

### Domain Integrity
Domain integrity is established by the permissible values of an attribute, which ensures that all data in a field is valid.

### Relationship Hints

1:1 = One to One Cardinality

1:M = One to Many Cardinality

M:N = Many to Many Cardinality

TP = Total Participation

PP = Partial Participation

### LIST OF TABLES
- candidates
- categories
- electorates
- locations
- parties
- polling_units
- positions
- registrations
- votes

### Database setup

```sql

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
```

### Tools
- JetBrains Datagrip
- Apache MySQL Server
- PHPMyAdmin
- Database Designer
