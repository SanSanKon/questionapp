# Questionapp Database (PostgreSQL)

Training project to demonstrate skills with PostgreSQL:  
    - database design,  
    - creating tables and links,  
    - writing SQL-queries (JOIN, random record selection, working with selected).  

The application models a service with dating questions: the user can receive random questions by categories and save selected.

-----

## Project structure
  - `sql/schema.sql` - creating tables (DDL)  
  - `sql/seed.sql` - test data (INSERT)  
  - `sql/queries.sql` - examples of SQL-queries
  
-----

##  Database structure

**Tables:**
  - `users` - users  
  - `categories` - question categories (Childhood, Interests, Vacation)  
  - `questions`- questions linked to categories   
  - `favorites`- user favorite questions

-----

## Setup

1. Create a database:
Run in the terminal:

   createdb questionapp

2. Run the schema:
Run in the terminal:

   psql -d questionapp -f sql/schema.sql

3. Seed with data:
Run in the terminal:

   psql -d questionapp -f sql/seed.sql

-----

## Query examples

- Random question from all categories
  
  SELECT * FROM questions ORDER BY RANDOM() LIMIT 1;

- Random question from category "Vacation"

  SELECT * FROM questions
  WHERE category_id = (SELECT id FROM categories WHERE title = 'Vacation')
  ORDER BY RANDOM() LIMIT 1;

- Add a question to favorites

  INSERT INTO favorites (user_id, question_id)
  VALUES (1, 7);

- Get all favorite questions of the user

  SELECT q.question_text, c.title AS category
  FROM favorites f
  JOIN questions q ON f.question_id = q.id
  JOIN categories c ON q.category_id = c.id
  WHERE f.user_id = 1;

-----

## Project objective:

Demonstrate ability to:

- design tables and relationships (one-to-many, many-to-many),

- use foreign keys, constraints and unique indexes,

- write SQL queries with JOIN, ORDER BY, LIMIT, RANDOM.

## More

Full query examples are available in sql/queries.sql.