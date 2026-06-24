CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    available_copies INT
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO books VALUES
(1, 'Java Basics', 'James', 5),
(2, 'Python Guide', 'Guido', 3),
(3, 'SQL Learning', 'John', 4);

INSERT INTO students VALUES
(101, 'Ram'),
(102, 'Sai'),
(103, 'Ravi');

INSERT INTO issued_books VALUES
(1, 101, 1, '2025-06-01'),
(2, 102, 2, '2025-06-02');

-- View all books
SELECT * FROM books;

-- View all students
SELECT * FROM students;

-- View issued books
SELECT * FROM issued_books;

-- Find books issued by students
SELECT s.student_name, b.title, i.issue_date
FROM issued_books i
JOIN students s ON i.student_id = s.student_id
JOIN books b ON i.book_id = b.book_id;