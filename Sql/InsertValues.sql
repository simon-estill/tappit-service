use Tappit

INSERT INTO dbo.People( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Frank', 'Smith', 0, 1, 0);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Bob', 'Maso', 0, 0, 0);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'David', 'Adams', 0, 1, 1);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Eve', 'Jones', 0, 0, 0);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Steve', 'Taylor', 0, 1, 1);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Hannah', 'Butler', 0, 0, 0);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Joh', 'Edwards', 0, 1, 0);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Oliver', 'Woods', 0, 0, 0);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Nata', 'Lee', 0, 1, 1);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Thomas', 'Brow', 0, 1, 1);
INSERT INTO dbo.People ( FirstName, LastName, IsAuthorised, IsValid, IsEnabled) VALUES ( 'Otto', 'Campbell', 1, 1, 0);

GO

INSERT INTO dbo.Sports (SportId, Name, IsEnabled) VALUES ('American Football', 1);
INSERT INTO dbo.Sports (SportId, Name, IsEnabled) VALUES ('Baseball', 1); 
INSERT INTO dbo.Sports (SportId, Name, IsEnabled) VALUES ('Basketball', 1);

GO

INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (1, 1);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (1, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (1, 3);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (2, 1);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (2, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (3, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (4, 1);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (4, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (4, 3);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (5, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (6, 1);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (7, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (7, 3);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (8, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (9, 1);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (10, 1);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (10, 2);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (10, 3);
INSERT INTO dbo.FavouriteSports (PersonId, SportId) VALUES (11, 1);

GO