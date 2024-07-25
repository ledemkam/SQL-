-- database: :memory:
-- :memory: is a special database name that creates a temporary database in memory

PRAGMA foreign_keys = ON;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE recipes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  titel TEXT NOT NULL,
  slug TEXT NOT NULL,
  date DATE NOT NULL,
  zeit DATETIME NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE ingredients (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);
 
 CREATE TABLE recipe_ingredients (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  recipe_id INTEGER NOT NULL,
  ingredient_id INTEGER NOT NULL,
  FOREIGN KEY(recipe_id) REFERENCES recipes(id),
  FOREIGN KEY(ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE categories(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  titel TEXT NOT NULL
);

CREATE TABLE recipe_categories(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  recipe_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  FOREIGN KEY(recipe_id) REFERENCES recipes(id),
  FOREIGN KEY(category_id) REFERENCES categories(id)
);


INSERT INTO categories (titel) 
  VALUES
  ('Dessert'),
  ('Entrée'),
  ('Plat');
 
INSERT INTO user (username, email)
  VALUES
  ('admin','admin@mail.com'), 
  ('user','user@mail.com'), 
  ('GUEST','guest@mail.com');  

INSERT INTO recipes (titel, slug, date, zeit, user_id)
  VALUES
  ('Tarte aux pommes', 'tarte-aux-pommes', '2021-01-01', '2021-01-01 12:00:00', 1),
  ('Salade de tomates', 'salade-de-tomates', '2021-01-01', '2021-01-01 12:00:00', 2),
  ('Poulet rôti', 'poulet-roti', '2021-01-01', '2021-01-01 12:00:00', 3);

INSERT INTO ingredients (name)
  VALUES
  ('pommes'),
  ('tomates'),
  ('poulet');

INSERT INTO recipe_ingredients (recipe_id, ingredient_id)
  VALUES
  (1, 1),
  (2, 2),
  (3, 3);

INSERT INTO recipe_categories (recipe_id, category_id)
  VALUES
  (1, 1),
  (2, 2),
  (3, 3);

SELECT *
FROM recipes
JOIN user ON recipes.user_id = user.id;

SELECT *
FROM recipes
JOIN recipe_ingredients ON recipes.id = recipe_ingredients.recipe_id;

SELECT *
FROM ingredients
JOIN recipe_ingredients ON ingredients.id = recipe_ingredients.ingredient_id;

SELECT *
FROM categories
JOIN recipe_categories ON categories.id = recipe_categories.category_id;

SELECT *
FROM recipes
JOIN recipe_categories ON recipes.id = recipe_categories.recipe_id;