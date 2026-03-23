-- ============================================================
-- NETTE'S CAFE — FULL DATABASE MIGRATION v3
-- Run this entire script in the Supabase SQL Editor
-- ============================================================

-- 1. Create site_settings table (flat key/value CMS)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS site_settings (
  key   TEXT PRIMARY KEY,
  value TEXT NOT NULL DEFAULT ''
);

ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Settings publicly readable" ON site_settings
  FOR SELECT USING (true);

CREATE POLICY "Admins can modify settings" ON site_settings
  FOR ALL USING (is_admin());

-- 2. Seed all site_settings keys
-- ------------------------------------------------------------
INSERT INTO site_settings (key, value) VALUES
  -- Global
  ('cafe_name',             'Nette''s Cafe'),
  ('cafe_tagline',          'Nourishing Hospital Staff & Patients'),
  -- Home page
  ('home_hero_title',       'Healthy Food,\nHealing Power.'),
  ('home_hero_subtitle',    'Real ingredients, restorative broths, and salads designed to fuel your day.'),
  ('home_cta_button',       'Order Now'),
  ('home_feature1_title',   'Fresh Daily'),
  ('home_feature1_desc',    'All ingredients are sourced locally and prepared fresh every morning.'),
  ('home_feature2_title',   'Healing Broths'),
  ('home_feature2_desc',    'Our soups are slow-cooked for hours for maximum nutrition and flavour.'),
  ('home_feature3_title',   'Zero Cream'),
  ('home_feature3_desc',    'We never use heavy creams — our flavour comes from robust, natural stocks.'),
  ('home_cta_title',        'Ready to order?'),
  ('home_cta_subtitle',     'Choose eat-in or takeaway, and enjoy nutritious meals crafted for your well-being.'),
  -- About page
  ('about_hero_tag',        'Our Story'),
  ('about_hero_title',      'About Nette''s Cafe'),
  ('about_intro',           'Nette''s Cafe was founded with a simple belief: that food served in a hospital should be the healthiest food in the world. We are committed to providing nutritious, delicious, and comforting meals for hospital staff, patients, and visitors.'),
  ('about_mission_title',   'Our Mission'),
  ('about_mission_body',    'To nourish, comfort, and energize everyone who walks through our doors — using only real, wholesome ingredients without artificial additives or heavy cream.'),
  ('about_values',          'Fresh & Local|Zero Cream Soups|Customizable Salads|Hospital-Grade Hygiene'),
  -- Menu page
  ('menu_title',            'Our Menu'),
  ('menu_subtitle',         'Made fresh daily. Order eat-in or takeaway.'),
  -- Contact page
  ('contact_title',         'Get in Touch'),
  ('contact_subtitle',      'Located inside the hospital campus. Happy to assist with catering and special orders.'),
  ('contact_address',       'Level 1, Hospital Lobby, 123 Health Avenue'),
  ('contact_phone',         '+65 9123 4567'),
  ('contact_email',         'hello@nettescafe.com'),
  ('contact_hours_weekday', '7:00 AM – 7:00 PM'),
  ('contact_hours_weekend', '8:00 AM – 4:00 PM'),
  -- Footer
  ('footer_tagline',        'Providing nutritious, delicious meals for hospital staff, patients, and visitors.')
ON CONFLICT (key) DO NOTHING;

-- 3. Update menu_items category constraint to include all needed types
-- ------------------------------------------------------------
ALTER TABLE menu_items DROP CONSTRAINT IF EXISTS menu_items_category_check;

ALTER TABLE menu_items ADD CONSTRAINT menu_items_category_check
CHECK (category IN (
  'soup', 'muffin', 'pie', 'wrap', 'special', 'pastry',
  'salad_base', 'salad_protein', 'salad_dressing', 'salad_topping'
));

-- 4. Seed menu items
-- ------------------------------------------------------------
-- Clear existing seed data if re-running
-- DELETE FROM menu_items; -- Uncomment only if you want a clean slate

INSERT INTO menu_items (name, category, price, description, is_sold_out) VALUES
-- Daily Specials
('Curry Chicken',              'special', 7.50, 'Fragrant curry chicken with steamed jasmine rice. Available Tuesdays.',          false),
('Ayam Pongteh',               'special', 7.50, 'Nyonya braised chicken with potatoes in savoury sauce. Wednesdays.',             false),
('Nasi Lemak',                 'special', 7.50, 'Coconut rice with sambal, egg, and classic accompaniments. Thursdays.',          false),
('Smoked Duck Fried Rice',     'special', 7.50, 'Wok-fried rice with premium smoked duck slices. Fridays.',                       false),
-- Soups (small)
('ABC Chicken Soup',           'soup',    5.50, 'Nourishing Chinese ABC chicken soup. Small portion.',                            false),
('Radish & Pork Rib Soup',     'soup',    5.50, 'Comforting slow-cooked radish with pork ribs. Small portion.',                   false),
('Old Cucumber Soup',          'soup',    5.50, 'Classic cooling soup great for hot days. Small portion.',                        false),
('Tofu Mushroom Soup',         'soup',    5.50, 'Light and earthy broth with silken tofu. Small portion.',                        false),
('French Onion Soup',          'soup',    5.50, 'Classic caramelized onion broth with crouton. Small portion.',                   false),
-- Soups (regular — same names, we distinguish in description)
('ABC Chicken Soup (Reg)',     'soup',    6.50, 'Nourishing Chinese ABC chicken soup. Regular portion.',                          false),
('Radish & Pork Rib (Reg)',    'soup',    6.50, 'Comforting slow-cooked radish with pork ribs. Regular portion.',                 false),
('Old Cucumber Soup (Reg)',    'soup',    6.50, 'Classic cooling soup great for hot days. Regular portion.',                      false),
('Tofu Mushroom Soup (Reg)',   'soup',    6.50, 'Light and earthy broth with silken tofu. Regular portion.',                      false),
('French Onion Soup (Reg)',    'soup',    6.50, 'Classic caramelized onion broth with crouton. Regular portion.',                 false),
-- Pies
('American Beef Pie',         'pie',    12.90, 'Hearty American-style minced beef in flaky pastry.',                             false),
('Beef Rendang Pie',          'pie',    12.90, 'Aromatic slow-cooked beef rendang encased in golden pastry.',                    false),
('Chilli Crab Pie',           'pie',    12.90, 'Singapore-style chilli crab filling in a buttery crust.',                        false),
('Salmon Quiche',             'pie',    11.90, 'Silky baked quiche with salmon and seasonal vegetables.',                        false),
-- Muffins
('Chocolate Muffin',          'muffin',  6.90, 'Rich and moist double-chocolate muffin.',                                       false),
('Banana Muffin',             'muffin',  6.90, 'Naturally sweet banana muffin with walnut bits.',                               false),
('Berry Cheese Muffin',       'muffin',  6.90, 'Mixed berry and cream cheese swirl muffin.',                                    false),
('Yuzu Muffin',               'muffin',  6.90, 'Refreshing yuzu-flavoured muffin with citrus zest.',                            false),
('Walnut Muffin',             'muffin',  6.90, 'Wholesome muffin packed with roasted walnuts.',                                 false),
('Apple Muffin',              'muffin',  6.90, 'Warmly spiced apple and cinnamon muffin.',                                      false),
('Velvet Carrot Muffin',      'muffin',  6.90, 'Moist red velvet carrot muffin with cream cheese drizzle.',                    false),
('Earl Grey Muffin',          'muffin',  6.90, 'Delicately fragranced Earl Grey tea muffin.',                                   false),
-- Wraps
('Chicken Caesar Wrap',       'wrap',   11.00, 'Grilled chicken, romaine lettuce, parmesan, and caesar dressing.',              false),
('Salmon & Avocado Wrap',     'wrap',   11.00, 'Baked salmon, creamy avocado, cucumber, and yuzu dressing.',                   false),
('Tofu & Edamame Wrap',       'wrap',   11.00, 'Pan-seared tofu, edamame, mixed greens, and sesame ginger dressing.',          false),
('Protein Power Wrap',        'wrap',   11.00, 'Your choice of protein with 6 fresh fillings and house dressing.',             false),
-- Salad Bar Bases
('Mixed Greens',              'salad_base',     0.00, 'A fresh blend of seasonal salad greens.', false),
('Quinoa & Kale',             'salad_base',     1.50, 'Protein-rich quinoa mixed with supergreen kale.', false),
('Brown Rice',                'salad_base',     1.00, 'Wholesome steamed brown rice base.', false),
-- Salad Proteins
('Grilled Chicken',           'salad_protein',  3.50, 'Lightly seasoned grilled chicken breast.', false),
('Baked Salmon',              'salad_protein',  4.50, 'Omega-3 rich baked salmon fillet.', false),
('Organic Tofu',              'salad_protein',  2.50, 'Pan-seared organic firm tofu.', false),
('Soft-Boiled Egg',           'salad_protein',  1.50, 'Free-range soft-boiled egg.', false),
-- Salad Dressings
('Sesame Ginger',             'salad_dressing', 0.00, 'Light Asian sesame ginger dressing.', false),
('Olive Oil & Lemon',         'salad_dressing', 0.00, 'Extra-virgin olive oil with fresh lemon.', false),
('Balsamic Vinaigrette',      'salad_dressing', 0.00, 'Sweet and tangy balsamic dressing.', false),
-- Salad Toppings
('Cherry Tomatoes',           'salad_topping',  0.50, 'Sweet and juicy cherry tomatoes.', false),
('Edamame',                   'salad_topping',  0.50, 'Lightly salted steamed edamame.', false),
('Roasted Almonds',           'salad_topping',  1.00, 'Oven-roasted crunchy almonds.', false),
('Avocado',                   'salad_topping',  1.50, 'Fresh, creamy avocado slices.', false)
ON CONFLICT DO NOTHING;
