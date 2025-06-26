create schema library;
create table book(
Book_id int primary key,
Book_name varchar(250),
available_books int,
total_books int,
author_name varchar(100));
-- The member table contains information about the members, 
-- which helps identify who belongs to the library.

create table members(
member_id int primary key,
name varchar(100) not null,
book_id int ,
phone_number int ,
address TEXT,
email varchar(100));
-- The borrow table contains the book_id and member_id, which help identify who has borrowed 
-- books from the library. It also helps determine who hasn't returned books by the due date.
CREATE TABLE borrow (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    foreign key(member_id) references  members(member_id),
	foreign key (book_id) references book(book_id));
    -- The fine table contains the borrow_id, which helps identify users who have 
    -- not returned the book. This allows us to easily track those who haven't returned books by the due date."
create table fine(
    book_id int,
    book_name varchar(100),
    member_id int,
    borrow_id int,
    fine_amount decimal(10,2),
    fine_amount_duedate int,
    paid boolean default false,
    foreign key(borrow_id) references borrow (borrow_id));
    