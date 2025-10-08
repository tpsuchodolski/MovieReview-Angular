-- Create database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'MovieReview')
BEGIN
    CREATE DATABASE MovieReview;
END
GO

USE MovieReview;
GO

-- Example table: Users
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL
);
GO

-- Example table: Movies
CREATE TABLE Movies (
    MovieId INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    ReleaseDate DATE
);
GO

-- Example table: Reviews
CREATE TABLE Reviews (
    ReviewId INT IDENTITY(1,1) PRIMARY KEY,
    MovieId INT NOT NULL,
    UserId INT NOT NULL,
    Rating INT NOT NULL,
    Comment NVARCHAR(1000),
    ReviewDate DATETIME NOT NULL,
    FOREIGN KEY (MovieId) REFERENCES Movies(MovieId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO

-- Insert initial data
INSERT INTO Users (UserName, Email) VALUES ('Alice', 'alice@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Bob', 'bob@example.com');
GO

INSERT INTO Movies (Title, ReleaseDate) VALUES ('Inception', '2010-07-16');
INSERT INTO Movies (Title, ReleaseDate) VALUES ('The Matrix', '1999-03-31');
GO

INSERT INTO Reviews (MovieId, UserId, Rating, Comment, ReviewDate)
VALUES (1, 1, 5, 'Amazing movie!', GETDATE());
INSERT INTO Reviews (MovieId, UserId, Rating, Comment, ReviewDate)
VALUES (2, 2, 4, 'Great sci-fi!', GETDATE());
GO