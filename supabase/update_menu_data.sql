-- Update Menu Categories Constraint
ALTER TABLE menu_items DROP CONSTRAINT IF EXISTS menu_items_category_check;
ALTER TABLE menu_items ADD CONSTRAINT menu_items_category_check 
CHECK (category IN (
    'soup', 'muffin', 'pie', 'wrap', 'special', 'pastry', 
    'salad_base', 'salad_protein', 'salad_dressing', 'salad_topping', 
    'coffee', 'tea', 'milkshakes', 'other_drinks', 
    'build_bowl', 'build_wrap', 'daily_special'
));

-- Clear existing menu items
DELETE FROM menu_items;

-- Insert new menu items
INSERT INTO menu_items (name, category, price, description) VALUES
-- Build your own
('Build your own Bowl', 'build_bowl', 11.90, 'Craft your perfect salad bowl with a fresh base, 4 toppings, 1 protein, 1 dressing, and a crunchy finish. Customize with more toppings for a personalised, mouthwatering meal!'),
('Build your own Wrap', 'build_wrap', 11.00, 'Create your own wrap with our fresh toppings and proteins on our tortilla wraps! Mix and match to your taste and enjoy a delicious, customised meal made just for you.'),

-- Soups
('Regular Soup (Staff)', 'soup', 5.50, ''),
('Small Soup (Staff)', 'soup', 3.50, ''),

-- Pies
('American Beef Pie', 'pie', 11.90, 'Hearty beef chunks in a savory gravy, encased in a flaky pastry. Savor it with a fresh side salad.'),
('Chicken Pot Pie', 'pie', 11.50, 'Tender chicken chunks with vegetables in a creamy sauce, topped with a golden pastry crust. Includes a fresh side salad.'),
('Chilli Crab Pot Pie', 'pie', 11.90, 'A local favorite! Succulent crab meat in a spicy, tangy sauce, under a buttery crust. Served with a side salad.'),
('Beef Rendang Pie', 'pie', 11.90, 'Savor Singapore''s rich flavor with our Beef Rendang Pot Pie! Infused with spices and tender beef, it''s a gourmet treat. Plus, enjoy a fresh side salad.'),

-- Coffee
('Latte', 'coffee', 7.00, ''),
('Flat White', 'coffee', 7.00, ''),
('Mocha', 'coffee', 7.50, ''),
('Long Black/Americano', 'coffee', 6.00, ''),
('Cappuccino', 'coffee', 7.00, ''),
('Espresso (Double Shot)', 'coffee', 5.50, ''),
('Caramel Macchiato', 'coffee', 7.50, ''),
('Espresso Tonic', 'coffee', 6.50, ''),

-- Tea
('Chai Latte', 'tea', 6.90, ''),
('Matcha Latte', 'tea', 7.00, ''),
('Dirty Matcha', 'tea', 7.50, ''),
('Dirty Chai', 'tea', 7.50, ''),
('Brewed Tea', 'tea', 4.50, 'Discover our premium brewed teas, expertly selected to elevate your tea experience with every luxurious sip.'),
('Iced Lemon Tea', 'tea', 3.00, ''),

-- Milkshakes
('Chocolate Milkshake', 'milkshakes', 8.50, ''),
('Vanilla Milkshake', 'milkshakes', 7.90, ''),
('Chai Milkshake', 'milkshakes', 8.50, ''),
('Matcha Milkshake', 'milkshakes', 8.50, ''),
('Avocado Milkshake', 'milkshakes', 8.50, ''),
('Milo Milkshake', 'milkshakes', 8.50, ''),
('Oreo Milkshake', 'milkshakes', 8.50, ''),

-- Other Drinks
('Hot Chocolate', 'other_drinks', 6.90, 'Sugar-free and sweetened with pure fruit extracts—enjoy this chocolate delight hot or cold!'),
('Honey Lemon', 'other_drinks', 3.90, ''),
('Ribena', 'other_drinks', 3.00, ''),
('Milo', 'other_drinks', 3.90, ''),
('Water', 'other_drinks', 3.00, ''),
('Citron Yuzu Spritz', 'other_drinks', 7.00, 'A light fizzy drink made with Korean citron & yuzu honey.'),

-- Pastries
('Raisin Scone', 'pastry', 5.20, ''),
('Cheese & Jalapeno Brezel', 'pastry', 5.20, ''),
('Cinnamon Swirl', 'pastry', 5.50, ''),
('Raisin Swirl', 'pastry', 5.50, ''),
('Plain Butter Croissant', 'pastry', 4.50, ''),
('Chocolate Croissant', 'pastry', 5.50, ''),

-- Muffins
('Earl Grey Raisin Muffin', 'muffin', 6.90, ''),
('Cranberry Salted Caramel Muffin', 'muffin', 6.90, ''),
('Maple Walnut Muffin', 'muffin', 6.90, ''),
('Double Chocolate Muffin', 'muffin', 6.90, ''),
('Vanilla Apple Muffin', 'muffin', 6.90, ''),
('Blueberry & Cheese Muffin', 'muffin', 6.90, ''),
('Lemon Yuzu Muffin', 'muffin', 6.90, ''),
('Banana Muffin', 'muffin', 6.90, ''),

-- ingredients (Bases)
('Lettuce', 'salad_base', 0.00, ''),
('Spinach', 'salad_base', 0.00, ''),

-- ingredients (Proteins)
('Chicken Breast', 'salad_protein', 3.50, ''),
('Popcorn Chicken', 'salad_protein', 3.50, ''),
('Smoked Duck', 'salad_protein', 3.50, ''),
('Falafel', 'salad_protein', 3.50, ''),
('Teriyaki Chicken', 'salad_protein', 3.50, ''),
('Tuna Mayo', 'salad_protein', 3.50, ''),
('Tofu', 'salad_protein', 2.50, ''),
('Feta Cheese', 'salad_protein', 3.50, ''),
('Avocado', 'salad_protein', 3.50, ''),
('Chunky Tuna', 'salad_protein', 3.50, ''),
('Cajun Chicken Breast', 'salad_protein', 4.00, ''),
('Smoked Salmon', 'salad_protein', 4.50, ''),

-- ingredients (Toppings)
('Raw Onions', 'salad_topping', 1.50, ''),
('Raisins', 'salad_topping', 1.50, ''),
('Potato Wedges', 'salad_topping', 1.50, ''),
('Potato Salad', 'salad_topping', 1.50, ''),
('Onsen Egg', 'salad_topping', 1.50, ''),
('Herbed Pumpkin', 'salad_topping', 1.50, ''),
('Hard-boiled Egg', 'salad_topping', 1.50, ''),
('Egg Mayo', 'salad_topping', 1.50, ''),
('Edamame', 'salad_topping', 1.50, ''),
('Cucumber', 'salad_topping', 1.50, ''),
('Croutons', 'salad_topping', 1.50, ''),
('Corn', 'salad_topping', 1.50, ''),
('Cherry Tomato', 'salad_topping', 1.50, ''),
('Beetroot', 'salad_topping', 1.50, ''),
('Baby Radish', 'salad_topping', 1.50, ''),
('Pasta', 'salad_topping', 1.50, ''),
('Broccoli', 'salad_topping', 1.50, ''),
('Chickpeas', 'salad_topping', 1.50, ''),
('Carrot', 'salad_topping', 1.50, ''),
('Coleslaw', 'salad_topping', 1.50, ''),
('Chia Seeds', 'salad_topping', 1.50, ''),
('Pumpkin Seeds', 'salad_topping', 1.50, ''),
('Sunflower Seeds', 'salad_topping', 1.50, ''),

-- ingredients (Dressings)
('Roasted Sesame', 'salad_dressing', 0.00, ''),
('Honey Mustard', 'salad_dressing', 0.00, ''),
('Miso Ginger', 'salad_dressing', 0.00, ''),
('Pomegranate Vinaigrette', 'salad_dressing', 0.00, ''),
('Olive Oil', 'salad_dressing', 0.00, ''),
('Balsamic Vinaigrette', 'salad_dressing', 0.00, ''),
('Goma Dressing (Sesame)', 'salad_dressing', 0.00, ''),
('Kimchi Mayo', 'salad_dressing', 0.00, ''),
('Caesar Dressing', 'salad_dressing', 0.00, ''),
('Thousand Island', 'salad_dressing', 0.00, ''),
('Rosemary Olive Oil', 'salad_dressing', 0.00, ''),
('Thyme Olive Oil', 'salad_dressing', 0.00, ''),
('Sriracha Honey', 'salad_dressing', 0.00, ''),
('Mayo', 'salad_dressing', 0.00, ''),
('Wasabi Mayo', 'salad_dressing', 0.00, ''),
('Curry Mayo', 'salad_dressing', 0.00, '');
