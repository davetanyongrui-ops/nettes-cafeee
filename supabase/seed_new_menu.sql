-- Seed the complete Nette's Cafe menu
INSERT INTO menu_items (name, description, category, price, image_url)
VALUES
  ('Build your own Bowl', 'Craft your perfect salad bowl with a fresh base, 4 toppings, 1 protein, 1 dressing, and a crunchy finish. Customize with more toppings for a personalised, mouthwatering meal!', 'build_bowl', 11.90, '/images/menu/placeholder.jpg'),
  ('Build your own Wrap', 'Create your own wrap with our fresh toppings and proteins on our tortilla wraps! Mix and match to your taste and enjoy a delicious, customised meal made just for you.', 'build_wrap', 11.00, '/images/menu/placeholder.jpg'),
  ('Daily Special', NULL, 'daily_special', 7.90, '/images/menu/placeholder.jpg'),
  ('Regular Soup (Staff)', NULL, 'soup', 5.50, '/images/menu/placeholder.jpg'),
  ('Small Soup (Staff)', NULL, 'soup', 3.50, '/images/menu/placeholder.jpg'),
  ('Maple Walnut Muffin', NULL, 'pastry', 6.90, '/images/menu/placeholder.jpg'),
  ('Banana Muffin', NULL, 'pastry', 6.90, '/images/menu/placeholder.jpg'),
  ('Long Black/Americano', NULL, 'coffee', 6.00, '/images/menu/placeholder.jpg'),
  ('Cappuccino', NULL, 'coffee', 7.00, '/images/menu/placeholder.jpg'),
  ('Flat White', NULL, 'coffee', 7.00, '/images/menu/placeholder.jpg'),
  ('Matcha Latte', NULL, 'coffee', 7.00, '/images/menu/placeholder.jpg'),
  ('Chai Latte', NULL, 'coffee', 6.90, '/images/menu/placeholder.jpg'),
  ('Honey Lemon', NULL, 'other_drinks', 3.90, '/images/menu/placeholder.jpg');
