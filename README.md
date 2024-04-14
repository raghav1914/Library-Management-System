# Library-Management-System

This repository contains the SQL code for creating a MySQL database schema for a Library Management System. The database includes tables for managing publishers, books, library branches, borrowers, book loans, book copies, and book authors.

Database Schema
Tables-
tbl_publisher: Stores information about book publishers.
tbl_book: Contains details of books, including titles and publishers.
tbl_library_branch: Stores information about library branches, including names and addresses.
tbl_borrower: Contains details of borrowers, including names and contact information.
tbl_book_loans: Manages book loans, including loan IDs, book IDs, branch IDs, borrower card numbers, loan dates, and due dates.
tbl_book_copies: Tracks the number of copies of each book available at each library branch.
tbl_book_authors: Links books to their respective authors.

Populating Tables-
The SQL script includes commands to populate the tables with sample data, including publishers, books, library branches, borrowers, book loans, book copies, and book authors.

Stored Procedure-
The repository includes a stored procedure named Execute_library_management_system, which encapsulates a set of SQL commands to initialize the database and populate it with sample data. The stored procedure creates the necessary tables, inserts sample records, and performs queries to demonstrate database functionality.

Contributing-
Contributions to improve the database schema, optimize SQL queries, or add new features are welcome. Feel free to open issues or pull requests to suggest enhancements or report bugs.
