-- Choose 6 random questions from all categories
SELECT * FROM questions ORDER BY RANDOM() LIMIT 6;

-- Choose a random question from category Vacation
SELECT * FROM questions
WHERE category_id = (SELECT id FROM categories WHERE title = 'Vacation')
ORDER BY RANDOM() LIMIT 1;

-- Add a question to favorites
INSERT INTO favorites (user_id, question_id)
VALUES (1, 7);

-- Get all favorite questions of the user
SELECT q.question_text, c.title AS category
FROM favorites f
JOIN questions q ON f.question_id = q.id
JOIN categories c ON q.category_id = c.id
WHERE f.user_id = 1;