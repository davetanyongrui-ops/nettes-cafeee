-- Paste this entire block into the Supabase SQL Editor and click Run.
-- This inserts all menu items for Nette's Cafe.

INSERT INTO menu_items (name, category, price, description, is_sold_out) VALUES

-- Daily Specials
('Curry Chicken (Tue Special)',   'special', 7.50, 'Hearty curry chicken served with rice. Available Tuesdays.',   false),
('Ayam Pongteh (Wed Special)',    'special', 7.50, 'Nyonya braised chicken and potatoes. Available Wednesdays.',   false),
('Nasi Lemak (Thu Special)',      'special', 7.50, 'Fragrant coconut rice with classic accompaniments. Thursdays.', false),
('Smoked Duck Fried Rice (Fri Special)', 'special', 7.50, 'Wok-fried rice with smoky duck slices. Available Fridays.', false),

-- Soups (small)
('ABC Chicken Soup (Small)',    'soup', 5.50, 'Nourishing ABC chicken soup, small portion.',       false),
('Radish Soup (Small)',         'soup', 5.50, 'Comforting radish and pork rib soup, small.',       false),
('Old Cucumber Soup (Small)',   'soup', 5.50, 'Traditional old cucumber soup, small portion.',     false),
('Tofu Mushroom Soup (Small)',  'soup', 5.50, 'Light and earthy tofu mushroom broth, small.',      false),
('French Onion Soup (Small)',   'soup', 5.50, 'Classic French onion soup with crouton, small.',   false),

-- Soups (regular)
('ABC Chicken Soup (Reg)',      'soup', 6.50, 'Nourishing ABC chicken soup, regular portion.',     false),
('Radish Soup (Reg)',           'soup', 6.50, 'Comforting radish and pork rib soup, regular.',     false),
('Old Cucumber Soup (Reg)',     'soup', 6.50, 'Traditional old cucumber soup, regular portion.',   false),
('Tofu Mushroom Soup (Reg)',    'soup', 6.50, 'Light and earthy tofu mushroom broth, regular.',    false),
('French Onion Soup (Reg)',     'soup', 6.50, 'Classic French onion soup with crouton, regular.', false),

-- Pies
('American Beef Pie',           'pie', 12.90, 'Rich and hearty American-style beef pie.',          false),
('Beef Rendang Pie',            'pie', 12.90, 'Aromatic Beef Rendang encased in flaky pastry.',   false),
('Chilli Crab Pie',             'pie', 12.90, 'Singapore-style Chilli Crab in a golden pie.',     false),
('Salmon Quiche',               'pie', 11.50, 'Savory salmon and vegetable quiche.',              false),

-- Muffins
('Chocolate Muffin',   'muffin', 6.90, 'Rich and moist chocolate muffin.',                       false),
('Banana Muffin',      'muffin', 6.90, 'Classic banana muffin, naturally sweet.',                false),
('Berry Cheese Muffin','muffin', 6.90, 'Mixed berry and cream cheese muffin.',                   false),
('Yuzu Muffin',        'muffin', 6.90, 'Refreshing yuzu-flavored muffin.',                       false),
('Walnut Muffin',      'muffin', 6.90, 'Wholesome muffin packed with crunchy walnuts.',         false),
('Apple Muffin',       'muffin', 6.90, 'Warmly spiced apple muffin.',                            false),
('Velvet Carrot Muffin','muffin',6.90, 'Moist velvet carrot muffin with cream cheese drizzle.', false),
('Earl Grey Muffin',   'muffin', 6.90, 'Delicately fragranced Earl Grey tea muffin.',            false),

-- Wraps
('Protein Wrap',  'wrap', 11.00, 'Choose your protein — grilled chicken, tofu, or egg. Served with 6 fresh fillings and a dressing.', false),
('Dressing Wrap', 'wrap', 11.00, 'Ask for your preferred dressing with 6 fresh fillings of your choice.', false),

-- Pastries
('Butter Croissant',         'pastry', 4.50, 'Classic, flaky all-butter croissant.',              false),
('Chocolate Croissant',      'pastry', 5.50, 'Buttery croissant filled with rich dark chocolate.',false),
('Cheesy Jalapeño Brezel',   'pastry', 5.20, 'Soft pretzel filled with melted cheese and jalapeño.', false),
('Scones / Swirls',          'pastry', 5.50, 'Freshly baked scone or cinnamon swirl of the day.',false),

-- Salad Bar Bases
('Mixed Greens',             'salad_base',     0.00, 'A fresh blend of seasonal salad greens.', false),
('Quinoa & Kale',            'salad_base',     1.50, 'Protein-rich quinoa mixed with supergreen kale.', false),
('Brown Rice',               'salad_base',     1.00, 'Wholesome brown rice base.',               false),

-- Salad Proteins
('Grilled Chicken',          'salad_protein',  3.50, 'Lightly seasoned grilled chicken breast.', false),
('Baked Salmon',             'salad_protein',  4.50, 'Omega-3 rich baked salmon fillet.',        false),
('Organic Tofu',             'salad_protein',  2.50, 'Pan-seared organic firm tofu.',            false),
('Soft-Boiled Egg',          'salad_protein',  1.50, 'Free-range soft-boiled egg.',              false),

-- Salad Dressings
('Sesame Ginger',            'salad_dressing', 0.00, 'Light Asian sesame ginger dressing.',      false),
('Olive Oil & Lemon',        'salad_dressing', 0.00, 'Classic extra-virgin olive oil and lemon.',false),
('Balsamic Vinaigrette',     'salad_dressing', 0.00, 'Sweet and tangy balsamic dressing.',       false),

-- Salad Toppings
('Cherry Tomatoes',          'salad_topping',  0.50, 'Sweet and juicy cherry tomatoes.',         false),
('Edamame',                  'salad_topping',  0.50, 'Lightly salted steamed edamame.',          false),
('Roasted Almonds',          'salad_topping',  1.00, 'Oven-roasted crunchy almonds.',            false),
('Avocado',                  'salad_topping',  1.50, 'Fresh, creamy avocado slices.',            false),
('Corn Kernels',             'salad_topping',  0.50, 'Sweet roasted corn kernels.',              false);
