-- database: :memory:
--schema recipes:
CREATE TABLE recipes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(150) NOT NULL,
  slug VARCHAR(50) NOT NULL UNIQUE,
  content TEXT,
  category_id INTEGER,
  FOREIGN KEY(category_id) REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(150) NOT NULL,
  description TEXT NOT NULL
);

INSERT INTO categories (title, description) 
  VALUES
  ('Dessert', 'Les meilleurs desserts'),
  ('Entrée', 'Les meilleures entrées'),
  ('Plat', 'Les meilleurs plats');

INSERT INTO recipes (title, slug,category_id) 
  VALUES  
  ('Tarte aux pommes', 'tarte-aux-pommes', 1),
  ('Salade de tomates', 'salade-de-tomates',  2),
  ('Poulet rôti', 'poulet-roti',  3);

  --PRAGMA foreign_keys = ON;

  SELECT * 
  FROM recipes
  JOIN categories ON recipes.category_id = categories.id;


DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;




