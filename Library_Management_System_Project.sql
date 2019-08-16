CREATE DATABASE db_library

USE db_library
GO

CREATE PROCEDURE create_Library_db
AS
BEGIN

	CREATE TABLE tbl_library_branch (
		library_branch_branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		library_branch_branch_name VARCHAR(50) NOT NULL,
		library_branch_address VARCHAR(100) NOT NULL
	);

	CREATE TABLE tbl_publisher (
		publisher_publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
		publisher_address VARCHAR(100) NOT NULL,
		publisher_phone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_books (
		books_book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		books_title VARCHAR(50) NOT NULL,
		books_publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_book_copies (
		book_copies_book_id INT NOT NULL CONSTRAINT fk_books_book_id FOREIGN KEY REFERENCES tbl_books(books_book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_branch_id INT NOT NULL CONSTRAINT fk_library_branch_branch_id FOREIGN KEY REFERENCES tbl_library_branch(library_branch_branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_number_of_copies INT NOT NULL
	);

	CREATE TABLE tbl_book_authors (
		book_authors_book_id INT NOT NULL CONSTRAINT fk_books_book_id2 FOREIGN KEY REFERENCES tbl_books(books_book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_author_name VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_borrower (
		borrower_card_no INT PRIMARY KEY NOT NULL IDENTITY (1000, 1),
		borrower_name VARCHAR(50) NOT NULL,
		borrower_address VARCHAR(100) NOT NULL,
		borrower_phone VARCHAR(50)
	);

	CREATE TABLE tbl_book_loans (
		book_loans_book_id INT CONSTRAINT fk_books_book_id3 FOREIGN KEY REFERENCES tbl_books(books_book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_branch_id INT CONSTRAINT fk_library_branch_branch_id2 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_card_no INT NOT NULL CONSTRAINT fk_borrower_card_no FOREIGN KEY REFERENCES tbl_borrower(borrower_card_no) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_date_out DATE,
		book_loans_date_due DATE
	);


	INSERT INTO tbl_library_branch
		(library_branch_branch_name, library_branch_address)
		VALUES
		('Sharpstown', '111 Main St, Austin, TX, 78000'),
		('Central', '122 Second St, Austin, TX, 78000'),
		('North Austin', '554 55th St, Austin, TX, 78010'),
		('South Austin', '432 Congress Ave, Austin, TX, 78004')
	;
	SELECT * FROM tbl_library_branch;

	INSERT INTO tbl_publisher
		(publisher_publisher_name, publisher_address, publisher_phone)
		VALUES
		('Viking Press', '216 Main St, New York, NY 55645', '888-654-5853'),
		('Vanguard Press', '885 Main St, New York, NY 55645', '888-548-5214'),
		('Doubleday', '367 Main St, New York, NY 55645', '888-542-6687')
	;
	SELECT * FROM tbl_publisher;

	INSERT INTO tbl_borrower
		(borrower_name, borrower_address, borrower_phone)
		VALUES
		('John Petterson', '546 Main St, Austin, TX 78000', '512-555-6581'),
		('Jake Olvera', '222 3rd St, Austin, TX 78000', '512-854-8569'),
		('Dallas Rhodes', '321 45th St, Austin, TX 78000', '512-785-5547'),
		('Matt Johnson', '124 5th St, Austin, TX 78000', '512-845-4526'),
		('Lauri Ortiz', '533 Martin Luther Blvd, Austin, TX 78110', '705-534-5578'),
		('Mia Hernandez', '105 11th St, Austin, TX 78005', '558-548-8852'),
		('Jose Villa', '664 50th St, Austin, TX 78055', '667-555-2975'),
		('Joey Papadelle', '548 10th St, Austin, TX, 78000', '512-487-6271'),
		('Jason Borne', '123 Main St, Austin, TX. 78000', '512-580-0264')
	;
	SELECT * FROM tbl_borrower;

	INSERT INTO tbl_books
	(books_title, books_publisher_name)
	VALUES
		('The Lost Tribe', 'Viking Press'),
		('The Found Tribe', 'Viking Press'),
		('Leadershift', 'Vanguard Press'),
		('The Greatest Salesman in the Word', 'Doubleday'),
		('The Leadership Handbook', 'Viking Press'),
		('The One Thing', 'Vanguard Press'),
		('Failing Forward', 'Doubleday'),
		('Start with the Why', 'Vanguard Press'),
		('Mindset', 'Vanguard Press'),
		('Wired That Way', 'Doubleday'),
		('It', 'Viking Press'),
		('Switch on your Brain', 'Vanguard Press'),
		('The Shining', 'Doubleday'),
		('Growing in Grace', 'Viking Press'),
		('No Limits', 'Vanguard Press'),
		('Extreme Ownership', 'Doubleday'),
		('Daring Greatly', 'Vanguard Press'),
		('Intentional Living', 'Vanguard Press'),
		('Multipliers', 'Vanguard Press'),
		('So Long Insecurity', 'Doubleday')
	;
	SELECT * FROM tbl_books;

	INSERT INTO tbl_book_copies
		(book_copies_book_id, book_copies_branch_id, book_copies_number_of_copies)
		VALUES
		(1, 1, 5),
		(2, 1, 6),
		(3, 1, 5),
		(4, 1, 6),
		(5, 1, 4),
		(6, 1, 4),
		(7, 1, 6),
		(8, 1, 4),
		(9, 1, 6),
		(10, 1, 5),
		(11, 2, 5),
		(12, 2, 4),
		(13, 2, 5),
		(14, 2, 4),
		(15, 2, 6),
		(16, 2, 4),
		(17, 2, 4),
		(18, 2, 6),
		(19, 2, 6),
		(20, 2, 8),
		(1, 3, 6),
		(2, 3, 4),
		(3, 3, 5),
		(4, 3, 7),
		(5, 3, 4),
		(6, 3, 6),
		(7, 3, 6),
		(8, 3, 7),
		(9, 3, 5),
		(10, 3, 4),
		(11, 4, 5),
		(12, 4, 6),
		(13, 4, 7),
		(14, 4, 8),
		(15, 4, 4),
		(16, 4, 5),
		(17, 4, 4),
		(18, 4, 5),
		(19, 4, 7),
		(20, 4, 4)
	;
	SELECT * FROM tbl_book_copies;



	INSERT INTO tbl_book_authors
		(book_authors_book_id, book_authors_author_name)
		VALUES
		(1, 'Mark Davidson'),
		(2,'Jack Scholar'),
		(3,'John Maxwell'),
		(4, 'Brene Brown'),
		(5, 'Beth Moore'),
		(6, 'Robert Jones'),
		(7, 'John Maxwell'),
		(8, 'Heath Lambert'),
		(9, 'Paul Tsika'),
		(10, 'Darren Hardy'),
		(11, 'Stephen King'),
		(12, 'Cameron Taylor'),
		(13, 'Stephen King'),
		(14, 'Frank Morales'),
		(15, 'John Maxwell'),
		(16, 'Henry Cloud'),
		(17, 'Francis Martin'),
		(18, 'John Jones'),
		(19, 'Frank Luntz'),
		(20, 'Og Mandino')
	;

	SELECT * FROM tbl_book_authors;


	INSERT INTO tbl_book_loans
		(book_loans_book_id, book_loans_branch_id,book_loans_card_no, book_loans_date_out, book_loans_date_due)
		VALUES
		(5,	1, 1000, '2019-07-21', '2019-08-15'),
		(3,	1, 1000, '2019-07-21', '2019-08-16'),
		(2,	1, 1000, '2019-07-26', '2019-08-26'),
		(6,	1, 1000, '2019-07-21', '2019-08-21'),
		(7,	1, 1000, '2019-07-21', '2019-08-21'),
		(1,	1, 1000, '2019-07-26', '2019-08-26'),
		(12, 4, 1001, '2019-07-21', '2019-08-21'),
		(14, 4, 1001, '2019-07-26', '2019-08-26'),
		(16, 4, 1001, '2019-07-21', '2019-08-21'),
		(18, 4, 1001, '2019-07-26', '2019-08-26'),
		(11, 4, 1001, '2019-07-21', '2019-08-21'),
		(11, 4, 1002, '2019-07-26', '2019-08-26'),
		(14, 4, 1002, '2019-07-26', '2019-08-26'),
		(16, 4, 1002, '2019-07-21', '2019-08-21'),
		(17, 4, 1002, '2019-07-21', '2019-08-21'),
		(18, 4, 1002, '2019-07-26', '2019-08-26'),
		(12, 4, 1002, '2019-07-10', '2019-08-10'),
		(2,	3, 1003, '2019-07-29', '2019-08-29'),
		(5,	3, 1003, '2019-07-26', '2019-08-26'),
		(4,	3, 1003, '2019-07-29', '2019-08-29'),
		(10, 1, 1003, '2019-07-26', '2019-08-26'),
		(9,	1, 1003, '2019-07-29', '2019-08-29'),
		(6,	1, 1003, '2019-07-29', '2019-08-29'),
		(4,	1, 1003, '2019-07-29', '2019-08-29'),
		(2,	1, 1003, '2019-07-29', '2019-08-29'),
		(19, 2, 1004, '2019-07-21', '2019-08-21'),
		(20, 2, 1004, '2019-07-29', '2019-08-29'),
		(16, 2, 1004, '2019-07-21', '2019-08-21'),
		(18, 2, 1004, '2019-07-29', '2019-08-29'),
		(13, 2, 1004, '2019-07-21', '2019-08-21'),
		(12, 2, 1004, '2019-07-29', '2019-08-29'),
		(16, 2, 1004, '2019-07-21', '2019-08-21'),
		(11, 2, 1004, '2019-07-10', '2019-08-10'),
		(11, 2, 1005, '2019-07-29', '2019-08-29'),
		(14, 2, 1005, '2019-07-21', '2019-08-21'),
		(15, 4, 1005, '2019-07-29', '2019-08-29'),
		(16, 4, 1005, '2019-07-29', '2019-08-29'),
		(18, 4, 1005, '2019-07-21', '2019-08-21'),
		(20, 2, 1005, '2019-07-10', '2019-08-10'),
		(19, 2, 1005, '2019-07-21', '2019-08-21'),
		(11, 2, 1006, '2019-07-29', '2019-08-29'),
		(15, 4, 1006, '2019-07-21', '2019-08-21'),
		(18, 4, 1006, '2019-07-29', '2019-08-29'),
		(3,	1, 1006, '2019-07-21', '2019-08-21'),
		(5, 1, 1006, '2019-07-10', '2019-08-10'),
		(5, 3, 1007, '2019-07-21', '2019-08-21'),
		(3, 3, 1007, '2019-07-29', '2019-08-29'),
		(15, 4, 1007, '2019-07-21', '2019-08-21'),
		(20, 4, 1007, '2019-07-10', '2019-08-10'),
		(19, 4, 1007, '2019-07-29', '2019-08-29'),
		(NULL, NULL, 1008, NULL, NULL)
	;
	SELECT * FROM tbl_book_loans;

	SELECT book_copies_number_of_copies AS 'Number of copies', books_title AS 'Title', library_branch_branch_name AS 'Library Branch'
		FROM tbl_book_copies
		INNER JOIN tbl_books ON books_book_id = book_copies_book_id
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_copies_branch_id
		WHERE books_title = 'The Lost Tribe' AND library_branch_branch_name = 'Sharpstown'
	;
 
	Select book_copies_number_of_copies AS 'Number of copies', library_branch_branch_name AS 'Library Name', books_title AS 'Title'
		FROM tbl_book_copies
		INNER JOIN tbl_books ON books_book_id = book_copies_book_id
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_copies_branch_id
		WHERE books_title = 'The Lost Tribe'
	;

	SELECT borrower_name AS 'Name', book_loans_book_id AS 'Number of Books Checked Out' 
		FROM tbl_borrower
		INNER JOIN tbl_book_loans ON book_loans_card_no = borrower_card_no
		WHERE book_loans_date_out IS NULL
	;

	SELECT books_title AS 'Book Title', borrower_name AS 'Borrower''s Name', borrower_address AS 'Borrower''s Address', library_branch_branch_name AS 'Library Branch', book_loans_date_due AS 'Due Date'
		FROM tbl_borrower
		INNER JOIN tbl_book_loans ON book_loans_card_no = borrower_card_no
		INNER JOIN tbl_books ON books_book_id = book_loans_book_id
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_loans_branch_id
		WHERE library_branch_branch_name = 'Sharpstown' AND book_loans_date_due = CONVERT(date, GETDATE())
	;


	SELECT COUNT(book_loans_book_id) AS 'Total Books Loaned Out', library_branch_branch_name = 'Sharpstown'
		FROM tbl_book_loans
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_loans_branch_id
		WHERE library_branch_branch_name = 'Sharpstown'
	;
	SELECT COUNT(book_loans_book_id) AS 'Total Books Loaned Out', library_branch_branch_name = 'Central'
		FROM tbl_book_loans
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_loans_branch_id
		WHERE library_branch_branch_name = 'Central'
	;
	SELECT COUNT(book_loans_book_id) AS 'Total Books Loaned Out', library_branch_branch_name = 'North Austin'
		FROM tbl_book_loans
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_loans_branch_id
		WHERE library_branch_branch_name = 'North Austin'
	;
	SELECT COUNT(book_loans_book_id) AS 'Total Books Loaned Out', library_branch_branch_name = 'South Austin'
		FROM tbl_book_loans
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_loans_branch_id
		WHERE library_branch_branch_name = 'South Austin'
	;


	BEGIN
		DECLARE @counter INT = 0;
		DECLARE @totalBorrowers INT = (SELECT COUNT(borrower_card_no) FROM tbl_borrower);
		DECLARE @total_loaned_borrower INT;
		WHILE @counter < @totalBorrowers
			BEGIN
				SET @total_loaned_borrower = (SELECT COUNT(book_loans_book_id)
					FROM tbl_book_loans
					WHERE book_loans_card_no = @counter + 1000
				);

				IF @total_loaned_borrower > 5
					BEGIN
						SELECT borrower_name AS 'Name', borrower_address AS 'Address', @total_loaned_borrower AS 'Number of books checked out'
							FROM tbl_borrower
							WHERE borrower_card_no = @counter + 1000
					END
			
				SET @counter = @counter + 1;
			END
	END

	SELECT books_title AS 'Title', book_copies_number_of_copies AS 'Number of Copies', library_branch_branch_name AS 'Library Branch'
		FROM tbl_books
		INNER JOIN tbl_book_authors ON book_authors_book_id = books_book_id
		INNER JOIN tbl_book_copies ON book_copies_book_id = books_book_id
		INNER JOIN tbl_library_branch ON library_branch_branch_id = book_copies_branch_id
		WHERE book_authors_author_name = 'Stephen King' AND library_branch_branch_name = 'Central'
	;

END