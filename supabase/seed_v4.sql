-- ============================================================
-- NETTE'S CAFE — Menu Seed v4
-- Run in Supabase SQL Editor.
-- Adds a 'metadata' JSONB column to support soup size pricing.
-- ============================================================

-- 1. Add metadata column if it doesn't exist
ALTER TABLE menu_items ADD COLUMN IF NOT EXISTS metadata JSONB DEFAULT NULL;

-- 2. Insert all new menu items
-- Use ON CONFLICT DO NOTHING so re-running is safe.
INSERT INTO menu_items (name, category, price, description, is_sold_out, metadata) VALUES

-- ── DAILY SPECIALS ──────────────────────────────────────────
('Teriyaki Chicken Rice',    'special', 7.50, 'Grilled teriyaki chicken on steamed jasmine rice with sesame vegetables. Mon.',      false, NULL),
('Beef Bolognese Pasta',     'special', 7.50, 'Slow-cooked beef bolognese on al-dente spaghetti. Tue.',                            false, NULL),
('Nasi Lemak Set',           'special', 7.50, 'Fragrant coconut rice with sambal, egg & peanuts. Wed.',                            false, NULL),
('Smoked Duck Fried Rice',   'special', 7.50, 'Wok-fried rice with premium smoked duck & spring onions. Thu.',                     false, NULL),

-- ── SOUPS (stored as base with sizes in metadata) ───────────
-- Price column = Small price. metadata stores both sizes for the card to display.
('ABC Soup',            'soup', 5.50, 'Classic Chinese ABC soup with chicken, carrot, potato, and tomato.', false,
  '{"sizes": [{"label": "Small", "price": 5.50}, {"label": "Regular", "price": 6.50}]}'::jsonb),
('Lotus Root Soup',     'soup', 5.50, 'Slow-cooked pork rib and lotus root broth — great for the lungs.',   false,
  '{"sizes": [{"label": "Small", "price": 5.50}, {"label": "Regular", "price": 6.50}]}'::jsonb),
('Old Cucumber Soup',   'soup', 5.50, 'Cooling old cucumber soup with pork ribs, perfect for hot days.',    false,
  '{"sizes": [{"label": "Small", "price": 5.50}, {"label": "Regular", "price": 6.50}]}'::jsonb),
('Tofu & Mushroom Broth','soup', 5.50, 'Light and nourishing tofu and shiitake mushroom clear broth.',       false,
  '{"sizes": [{"label": "Small", "price": 5.50}, {"label": "Regular", "price": 6.50}]}'::jsonb),
('French Onion Soup',   'soup', 5.50, 'Classic caramelized onion broth with a parmesan crouton lid.',       false,
  '{"sizes": [{"label": "Small", "price": 5.50}, {"label": "Regular", "price": 6.50}]}'::jsonb),

-- ── SAVORY PIES ─────────────────────────────────────────────
('Chicken Pot Pie',     'pie', 11.90, 'Creamy chicken, peas, and mushrooms in a flaky golden crust.',       false, NULL),
('Beef Stew Pie',       'pie', 12.90, 'Rich slow-braised beef stew in a deep-dish buttery pastry.',         false, NULL),
('Chilli Crab Pie',     'pie', 12.90, 'Singapore-style chilli crab filling in a golden pastry shell.',      false, NULL),
('Salmon & Spinach Quiche', 'pie', 11.90, 'Silky baked quiche with Atlantic salmon and fresh spinach.',     false, NULL),

-- ── WRAPS ───────────────────────────────────────────────────
('Chicken Caesar Wrap', 'wrap', 11.00, 'Grilled chicken, romaine, shaved parmesan & caesar dressing.',      false, NULL),
('Veggie Hummus Wrap',  'wrap', 11.00, 'Roasted vegetables, house hummus, cucumber & herb yoghurt.',        false, NULL),
('Salmon Avocado Wrap', 'wrap', 11.00, 'Baked salmon, creamy avocado, edamame & yuzu dressing.',            false, NULL),
('Protein Power Wrap',  'wrap', 11.00, 'Your choice of protein with 6 fresh fillings & house dressing.',    false, NULL),

-- ── MUFFINS ─────────────────────────────────────────────────
('Blueberry Muffin',        'muffin', 6.90, 'Bursting with fresh blueberries in a tender vanilla crumb.',   false, NULL),
('Double Chocolate Muffin', 'muffin', 6.90, 'Rich cocoa batter with dark chocolate chip chunks.',           false, NULL),
('Banana Walnut Muffin',    'muffin', 6.90, 'Naturally sweet banana muffin with toasted walnuts.',          false, NULL),
('Yuzu Lemon Muffin',       'muffin', 6.90, 'Bright citrus muffin with yuzu zest and lemon curd swirl.',    false, NULL),
('Berry Cheese Muffin',     'muffin', 6.90, 'Mixed berry and cream cheese swirl muffin.',                   false, NULL),
('Apple Cinnamon Muffin',   'muffin', 6.90, 'Warm spiced apple muffin with a cinnamon crumble top.',        false, NULL),
('Velvet Carrot Muffin',    'muffin', 6.90, 'Moist red velvet carrot muffin with cream cheese drizzle.',    false, NULL),
('Earl Grey Muffin',        'muffin', 6.90, 'Delicately fragranced Earl Grey tea muffin.',                  false, NULL),

-- ── SALAD BAR ───────────────────────────────────────────────
('Romaine Lettuce',          'salad_base',     0.00, 'Crisp and refreshing romaine lettuce.',                 false, NULL),
('Quinoa Blend',             'salad_base',     1.50, 'Tri-colour quinoa with toasted seeds.',                 false, NULL),
('Brown Rice',               'salad_base',     1.00, 'Steamed wholesome brown rice base.',                    false, NULL),
('Multigrain Wrap Base',     'salad_base',     0.00, 'Soft multigrain tortilla for a wrap build.',            false, NULL),

('Grilled Chicken',          'salad_protein',  3.50, 'Lightly seasoned grilled chicken breast.',              false, NULL),
('Baked Salmon',             'salad_protein',  4.50, 'Omega-3 rich baked salmon fillet.',                     false, NULL),
('Organic Tofu',             'salad_protein',  2.50, 'Pan-seared organic firm tofu.',                         false, NULL),
('Hard-Boiled Egg',          'salad_protein',  1.50, 'Free-range hard-boiled egg.',                           false, NULL),

('Sesame Ginger',            'salad_dressing', 0.00, 'Light Asian sesame ginger dressing.',                   false, NULL),
('Tahini Lemon',             'salad_dressing', 0.00, 'Creamy tahini with a lemon squeeze.',                   false, NULL),
('Olive Oil & Balsamic',     'salad_dressing', 0.00, 'Extra-virgin olive oil and aged balsamic vinegar.',     false, NULL),

('Cherry Tomatoes',          'salad_topping',  0.50, 'Sweet and juicy cherry tomatoes.',                      false, NULL),
('Edamame',                  'salad_topping',  0.50, 'Lightly salted steamed edamame beans.',                 false, NULL),
('Roasted Almonds',          'salad_topping',  1.00, 'Oven-roasted crunchy almonds.',                         false, NULL),
('Avocado',                  'salad_topping',  1.50, 'Fresh creamy avocado slices.',                          false, NULL),
('Cucumber Ribbons',         'salad_topping',  0.50, 'Cool crisp cucumber ribbons.',                          false, NULL),
('Corn Kernels',             'salad_topping',  0.50, 'Sweet roasted corn kernels.',                           false, NULL)

ON CONFLICT DO NOTHING;
