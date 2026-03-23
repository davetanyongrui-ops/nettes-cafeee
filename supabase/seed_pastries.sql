-- ============================================================
-- NETTE'S CAFE — Pastry Items Seed
-- Run in Supabase SQL Editor to populate the Pastries tab.
-- ============================================================

INSERT INTO menu_items (name, category, price, description, is_sold_out) VALUES
-- ── PASTRIES ───────────────────────────────────────────────
('Butter Croissant',           'pastry',  4.90, 'Flaky, golden French butter croissant — light and airy with a crisp shell.',                  false),
('Almond Croissant',           'pastry',  5.90, 'Croissant filled with frangipane and topped with toasted almond flakes.',                     false),
('Pain au Chocolat',           'pastry',  5.50, 'French chocolate croissant with two bars of rich dark chocolate inside.',                     false),
('Cinnamon Roll',              'pastry',  5.90, 'Fluffy cinnamon swirl with cream cheese glaze — baked fresh each morning.',                   false),
('Danish Pastry (Mixed Berry)','pastry',  5.50, 'Buttery puff pastry filled with seasonal mixed berries and vanilla custard.',                false),
('Egg Tart',                   'pastry',  4.50, 'Silky baked egg custard in a crumbly shortcrust shell — a local favourite.',                  false),
('Scone (Plain)',              'pastry',  4.90, 'Classic English scone served with butter and housemade strawberry jam.',                      false),
('Scone (Cranberry)',          'pastry',  5.50, 'Tender cranberry-studded scone with a light sugar glaze.',                                   false),
('Matcha Swiss Roll',          'pastry',  6.90, 'Light sponge infused with premium matcha and filled with fresh cream.',                      false),
('Kouign-Amann',               'pastry',  6.50, 'Caramelised Breton pastry — crispy, buttery layers with a toffee crust.',                    false),
('Portuguese Custard Tart',    'pastry',  5.50, 'Crispy puff pastry cup with caramelised egg custard — pastel de nata inspired.',              false),
('Pandan Coconut Roll',        'pastry',  5.90, 'Fragrant pandan sponge rolled with grated coconut and gula melaka cream.',                   false)
ON CONFLICT DO NOTHING;
