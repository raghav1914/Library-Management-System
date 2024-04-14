create database library_management_system;
use library_management_system;
DELIMITER //																/*helps to create the stored procedure.*/
create PROCEDURE Execute_library_management_system()
BEGIN
create table tbl_publisher(                                                 /*tbl_publisher*/
    publisher_Publisher_Name varchar(100) PRIMARY KEY not null,
    publisher_Publisher_Address varchar(200) not null,
    publisher_Publisher_Phone varchar(50) not null
);

select * from tbl_publisher;




create table tbl_book(                                                       /*tbl_book*/
    book_Book_ID int primary key not null AUTO_INCREMENT,                     /*This means the first row inserted will have book_BookID as 1, the second row will have book_BookID as 2, and so on.*/
    book_Title varchar(100) not null,
    book_Publisher_Name varchar(100) not null,
	constraint fk_Publisher_Name1 foreign key (book_Publisher_Name) references tbl_publisher(publisher_Publisher_Name) on update cascade on delete cascade
);

select * from tbl_book;




create table tbl_library_branch(                                              /*tbl_library_branch*/
    library_branch_Branch_ID int primary key not null AUTO_INCREMENT,
    library_branch_Branch_Name varchar(100) not null,
    library_branch_Branch_Address varchar(200) not null
);

select * from tbl_library_branch;




create table tbl_borrower(                                                    /*tbl_borrower*/
    borrower_Card_No INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	borrower_Borrower_Name VARCHAR(100) NOT NULL,
	borrower_Borrower_Address VARCHAR(200) NOT NULL,
	borrower_Borrower_Phone VARCHAR(50) NOT NULL
);

select * from tbl_borrower;




create table tbl_book_loans (
    book_loans_Loans_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_loans_Book_ID INT NOT NULL,
    book_loans_Branch_ID INT NOT NULL,
    book_loans_Card_No INT NOT NULL,
    book_loans_Date_Out VARCHAR(50) NOT NULL,
    book_loans_Due_Date VARCHAR(50) NOT NULL,
    CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_Book_ID) REFERENCES tbl_book(book_Book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_Branch_ID) REFERENCES tbl_library_branch(library_branch_Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_cardno FOREIGN KEY (book_loans_Card_No) REFERENCES tbl_borrower(borrower_Card_No) ON UPDATE CASCADE ON DELETE CASCADE
);


select * from tbl_book_loans;
	/* Use GETDATE() to retrieve the date values for Date out. Use DATEADD for the DueDate*/




create table tbl_book_copies(                                                      /*tbl_book_copies*/
	book_copies_Copies_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	book_copies_Book_ID INT NOT NULL,
	book_copies_Branch_ID INT NOT NULL,
	book_copies_No_Of_Copies INT NOT NULL,
	constraint fk_book_id2 foreign key (book_copies_Book_ID) references tbl_book(book_Book_ID) on update cascade on delete cascade,
	constraint fk_branch_id2 foreign key (book_copies_Branch_ID) references tbl_library_branch(library_branch_Branch_ID) on update cascade on delete cascade
);

select * from tbl_book_copies;




create table tbl_book_authors(                                                       /*tbl_book_author*/
	book_authors_Author_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	book_authors_Book_ID INT NOT NULL,
	book_authors_Author_Name VARCHAR(50) NOT NULL,
	constraint fk_book_id3 FOREIGN KEY (book_authors_Book_ID) REFERENCES tbl_book(book_Book_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

select * from tbl_book_authors;

/*======================== END TABLES ======================*/

/*==================== POPULATING TABLES ======================*/

insert into tbl_publisher (publisher_Publisher_Name, publisher_Publisher_Address, publisher_Publisher_Phone)                 /*insert -  tbl_publisher*/
values
    ('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Chilton Books','Not Available','Not Available'),
	('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
	('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
	('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
	('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
	('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
	('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
	('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
	('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
	('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
	('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');

select * from tbl_publisher;




insert into tbl_book (book_Title, book_Publisher_Name)                                                                      /*insert - tbl_book*/
values
	('The Name of the Wind', 'DAW Books'),
	('It', 'Viking'),
	('The Green Mile', 'Signet Books'),
	('Dune', 'Chilton Books'),
	('The Hobbit', 'George Allen & Unwin'),
	('Eragon', 'Alfred A. Knopf'),
	('A Wise Mans Fear', 'DAW Books'),
	('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
	('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
	('The Giving Tree', 'Harper and Row'),
	('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
	('Brave New World', 'Chalto & Windus'),
	('The Princess Bride', 'Harcourt Brace Jovanovich'),
	('Fight Club', 'W.W. Norton'),
	('Holes', 'Scholastic'),
	('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
	('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
	('The Fellowship of the Ring', 'George Allen & Unwin'),
	('A Game of Thrones', 'Bantam'),
	('The Lost Tribe', 'Picador USA');

select * from tbl_book;




insert into tbl_library_branch (library_branch_Branch_Name, library_branch_Branch_Address)									/*insert - tbl_library_branch*/
values
	('Sharpstown','32 Corner Road, New York, NY 10012'),
	('Central','491 3rd Street, New York, NY 10014'),
	('Saline','40 State Street, Saline, MI 48176'),
	('Ann Arbor','101 South University, Ann Arbor, MI 48104');

/*UPDATE tbl_library_branch
SET library_branch_BranchName = 'Central'
WHERE library_branch_BranchID = 2;*/

select * from tbl_library_branch; 




insert into tbl_borrower (borrower_Borrower_Name, borrower_Borrower_Address, borrower_Borrower_Phone)					  /*insert - tbl_borrower*/
values
	('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
	('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
	('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
	('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
	('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
	('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
	('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
	('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');

select * from tbl_borrower;




insert into tbl_book_loans (book_loans_Book_ID, book_loans_Branch_ID, book_loans_Card_No, book_loans_Date_Out, book_loans_Due_Date)
VALUES
	(1, 1, 1, '2018-01-01', '2018-02-02'),
	(2, 1, 1, '2018-01-01', '2018-02-02'),
	(3, 1, 1, '2018-01-01', '2018-02-02'),
	(4, 1, 1, '2018-01-01', '2018-02-02'),
	(5, 1, 2, '2018-01-03', '2018-02-03'),
	(6, 1, 2, '2018-01-03', '2018-02-03'),
	(7, 1, 2, '2018-01-03', '2018-02-03'),
	(8, 1, 2, '2018-01-03', '2018-02-03'),
	(9, 1, 2, '2018-01-03', '2018-02-03'),
	(11, 1, 2, '2018-01-03', '2018-02-03'),
	(12, 2, 5, '2017-12-12', '2018-01-12'),
	(10, 2, 5, '2017-12-12', '2017-01-12'),
	(20, 2, 5, '2018-02-03', '2018-03-03'),
	(18, 2, 5, '2018-01-05', '2018-02-05'),
	(19, 2, 5, '2018-01-05', '2018-02-05'),
	(19, 2, 8, '2018-01-03', '2018-02-03'),
	(11, 2, 6, '2018-01-07', '2018-02-07'),
	(1, 2, 6, '2018-01-07', '2018-02-07'),
	(2, 2, 8, '2018-01-07', '2018-02-07'),
	(3, 2, 8, '2018-01-07', '2018-02-07'),
	(5, 2, 5, '2017-12-12', '2018-01-12'),
	(4, 3, 3, '2018-01-09', '2018-02-09'),
	(7, 3, 2, '2018-01-03', '2018-02-03'),
	(17, 3, 2, '2018-01-03', '2018-02-03'),
	(16, 3, 4, '2018-01-03', '2018-02-03'),
	(15, 3, 4, '2018-01-03', '2018-02-03'),
	(15, 3, 7, '2018-01-03', '2018-02-03'),
	(14, 3, 4, '2018-01-03', '2018-02-03'),
	(13, 3, 7, '2018-01-03', '2018-02-03'),
	(13, 3, 2, '2018-01-03', '2018-02-03'),
	(19, 3, 2, '2017-12-12', '2018-01-12'),
	(20, 4, 3, '2018-01-03', '2018-02-03'),
	(1, 4, 2, '2018-01-12', '2018-02-12'),
	(3, 4, 7, '2018-01-03', '2018-02-03'),
	(18, 4, 7, '2018-01-03', '2018-02-03'),
	(12, 4, 2, '2018-01-04', '2018-02-04'),
	(11, 4, 3, '2018-01-15', '2018-02-15'),
	(9, 4, 3, '2018-01-15', '2018-02-15'),
	(7, 4, 7, '2018-01-01', '2018-02-02'),
	(4, 4, 3, '2018-01-01', '2018-02-02'),
	(1, 4, 3, '2017-02-02', '2018-03-02'),
	(20, 4, 3, '2018-01-03', '2018-02-03'),
	(1, 4, 2, '2018-01-12', '2018-02-12'),
	(3, 4, 7, '2018-01-13', '2018-02-13'),
	(18, 4, 7, '2018-01-13', '2018-02-13'),
	(12, 4, 2, '2018-01-14', '2018-02-14'),
	(11, 4, 3, '2018-01-15', '2018-02-15'),
	(9, 4, 3, '2018-01-15', '2018-02-15'),
	(7, 4, 7, '2018-01-19', '2018-02-19'),
	(4, 4, 3, '2018-01-19', '2018-02-19'),
	(1, 4, 3, '2018-01-22', '2018-02-22');


select * from tbl_book_loans;




insert into tbl_book_copies (book_copies_Book_ID, book_copies_Branch_ID, book_copies_No_Of_Copies)					/*insert - tbl_book_copies*/
values
	('1','1','5'),
	('2','1','5'), 
	('3','1','5'),
	('4','1','5'),
	('5','1','5'),
	('6','1','5'),
	('7','1','5'),
	('8','1','5'),
	('9','1','5'),
	('10','1','5'),
	('11','1','5'),
	('12','1','5'),
	('13','1','5'),
	('14','1','5'),
	('15','1','5'),
	('16','1','5'),
	('17','1','5'),
	('18','1','5'),
	('19','1','5'),
	('20','1','5'),
	('1','2','5'),
	('2','2','5'),
	('3','2','5'),
	('4','2','5'),
	('5','2','5'),
	('6','2','5'),
	('7','2','5'),
	('8','2','5'),
	('9','2','5'),
	('10','2','5'),
	('11','2','5'),
	('12','2','5'),
	('13','2','5'),
	('14','2','5'),
	('15','2','5'),
	('16','2','5'),
	('17','2','5'),
	('18','2','5'),
	('19','2','5'),
	('20','2','5'),
	('1','3','5'),
	('2','3','5'),
	('3','3','5'),
	('4','3','5'),
	('5','3','5'),
	('6','3','5'),
	('7','3','5'),
	('8','3','5'),
	('9','3','5'),
	('10','3','5'),
	('11','3','5'),
	('12','3','5'),
	('13','3','5'),
	('14','3','5'),
	('15','3','5'),
	('16','3','5'),
	('17','3','5'),
	('18','3','5'),
	('19','3','5'),
	('20','3','5'),
	('1','4','5'),
	('2','4','5'),
	('3','4','5'),
	('4','4','5'),
	('5','4','5'),
	('6','4','5'),
	('7','4','5'),
	('8','4','5'),
	('9','4','5'),
	('10','4','5'),
	('11','4','5'),
	('12','4','5'),
	('13','4','5'),
	('14','4','5'),
	('15','4','5'),
	('16','4','5'),
	('17','4','5'),
	('18','4','5'),
	('19','4','5'),
	('20','4','5');

select * from tbl_book_copies;




insert into tbl_book_authors (book_authors_Book_ID,book_authors_Author_Name)						/*insert - tbl_book_authors*/
values
	('1','Patrick Rothfuss'),
	('2','Stephen King'),
	('3','Stephen King'),
	('4','Frank Herbert'),
	('5','J.R.R. Tolkien'),
	('6','Christopher Paolini'),
	('6','Patrick Rothfuss'),
	('8','J.K. Rowling'),
	('9','Haruki Murakami'),
	('10','Shel Silverstein'),
	('11','Douglas Adams'),
	('12','Aldous Huxley'),
	('13','William Goldman'),
	('14','Chuck Palahniuk'),
	('15','Louis Sachar'),
	('16','J.K. Rowling'),
	('17','J.K. Rowling'),
	('18','J.R.R. Tolkien'),
	('19','George R.R. Martin'),
	('20','Mark Lee');

select * from tbl_book_authors;

END	//					-- used to denote the end of a block of code within a stored procedure



show create PROCEDURE Execute_library_management_system;

CALL Execute_library_management_system();
select * from tbl_publisher;
SELECT * FROM tbl_book;
SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_book_authors;



/* QUERY QUESTIONS */		


/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
select copies.book_copies_Branch_ID as 'Branch ID',
branch.library_branch_Branch_Name as 'Branch Name',
copies.book_copies_No_Of_Copies as 'Number of Copies',
book.book_Title as 'Book Title'
from tbl_book_copies as copies
inner join tbl_book as book on copies.book_copies_Book_ID = book.book_Book_ID
inner join tbl_library_branch as branch on book_copies_Branch_ID = branch.library_branch_Branch_ID
where book.book_Title = 'The Lost Tribe' and branch.library_branch_Branch_Name = 'Sharpstown';


/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
select copies.book_copies_Branch_ID as 'Branch ID',
branch.library_branch_Branch_Name as 'Branch Name',
copies.book_copies_No_Of_Copies as 'Number of Copies'
from tbl_book_copies as copies
inner join tbl_book as book on copies.book_copies_Book_ID = book.book_Book_ID
inner join tbl_library_branch as branch on book_copies_Branch_ID = branch.library_branch_Branch_ID
where book.book_Title = 'The Lost Tribe'


/* #3- Retrieve the names of all borrowers who do not have any books checked out. */
select borrower_Borrower_Name from tbl_borrower
where not EXISTS
(select * from tbl_book_loans
where book_loans_Card_No = borrower_Card_No);
/*gave blank column (check later)*/


/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */
SELECT branch.library_branch_Branch_Name AS 'Branch Name',
       book.book_Title AS 'Book Name',
       loans.book_loans_Date_Out AS 'Date Out',
       loans.book_loans_Due_Date AS 'Due Date'
FROM tbl_book_loans AS loans
INNER JOIN tbl_book AS book ON loans.book_loans_Book_ID = book.book_Book_ID
INNER JOIN tbl_borrower AS borrower ON loans.book_loans_Card_No = borrower.borrower_Card_No
INNER JOIN tbl_library_branch AS branch ON loans.book_loans_Branch_ID = branch.library_branch_Branch_ID
WHERE loans.book_loans_Due_Date = CURDATE()
AND branch.library_branch_Branch_Name = 'Sharpstown';
/*gave blank column (check later)*/


/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */
select branch.library_branch_Branch_Name as 'Branch Name', count (loans.book_loans_Branch_ID) as 'Total Loans'
FROM tbl_book_loans AS Loans
INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_Branch_ID = Branch.library_branch_Branch_ID
GROUP BY library_branch_Branch_Name;


/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */
SELECT Borrower.borrower_Borrower_Name AS 'Borrower Name', 
Borrower.borrower_Borrower_Address AS 'Borrower Address',
COUNT(Borrower.borrower_Borrower_Name) AS 'Books Checked Out'
FROM tbl_book_loans AS Loans
INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_Card_No = Borrower.borrower_Card_No
GROUP BY Borrower.borrower_Borrower_Name, Borrower.borrower_Borrower_Address
HAVING COUNT(Borrower.borrower_Borrower_Name) >= 5;


/* #7- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/
SELECT Branch.library_branch_Branch_Name AS 'Branch Name', Book.book_Title AS 'Title', 
Copies.book_copies_No_Of_Copies AS 'Number of Copies'
FROM tbl_book_authors AS Authors
INNER JOIN tbl_book AS Book ON Authors.book_authors_Book_ID = Book.book_Book_ID
INNER JOIN tbl_book_copies AS Copies ON Authors.book_authors_Book_ID = Copies.book_copies_Book_ID
INNER JOIN tbl_library_branch AS Branch ON Copies.book_copies_Branch_ID = Branch.library_branch_Branch_ID
WHERE Branch.library_branch_Branch_Name = 'Central' AND Authors.book_authors_Author_Name = 'Stephen King';
