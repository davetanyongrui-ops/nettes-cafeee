-- =============================================================
-- STEP 1: Update the category CHECK constraint on menu_items
-- =============================================================
ALTER TABLE menu_items DROP CONSTRAINT IF EXISTS menu_items_category_check;

ALTER TABLE menu_items ADD CONSTRAINT menu_items_category_check
CHECK (category IN (
  'soup', 'muffin', 'pie', 'wrap', 'special', 'pastry',
  'salad_base', 'salad_protein', 'salad_dressing', 'salad_topping'
));

-- =============================================================
-- STEP 2: Create the site_content table for the CMS
-- =============================================================
CREATE TABLE IF NOT EXISTS site_content (
  section_key TEXT PRIMARY KEY,
  content_data JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE site_content ENABLE ROW LEVEL SECURITY;

-- Anyone can read site_content (for rendering pages)
CREATE POLICY "Site content is publicly readable" ON site_content
  FOR SELECT USING (true);

-- Only admins can modify site content
CREATE POLICY "Admins can update site content" ON site_content
  FOR ALL USING (is_admin());

-- =============================================================
-- STEP 3: Seed site_content with default values
-- =============================================================
INSERT INTO site_content (section_key, content_data) VALUES
(
  'home',
  '{
    "hero_title": "Healthy Food, Healing Power.",
    "hero_subtitle": "Discover Nette''s Cafe. Real ingredients, restorative broths, and customized salads designed to fuel your day.",
    "hero_badge": "Nourishing Hospital Staff & Patients",
    "feature_1_title": "Fresh Daily",
    "feature_1_desc": "All ingredients are sourced locally and prepared fresh every morning.",
    "feature_2_title": "Healing Broths",
    "feature_2_desc": "Our soups are slow-cooked for maximum nutrition.",
    "feature_3_title": "Zero Cream",
    "feature_3_desc": "We never use heavy creams; our flavor comes from robust, natural stocks.",
    "cta_title": "Ready to order?",
    "cta_subtitle": "Choose eat-in or takeaway, and enjoy nutritious meals crafted for your well-being."
  }'
),
(
  'about',
  '{
    "title": "About Nette''s Cafe",
    "subtitle": "Our Story",
    "body": "Nette''s Cafe was founded with a simple belief: that food served in a hospital should be the healthiest food in the world. We are committed to providing nutritious, delicious, and comforting meals for hospital staff, patients, and visitors.",
    "mission_title": "Our Mission",
    "mission_body": "To nourish, comfort, and energize everyone who walks through our doors — using only real, wholesome ingredients.",
    "values": ["Fresh & Local", "Zero Cream Soups", "Customizable Salads", "Hospital-Grade Hygiene"]
  }'
),
(
  'contact',
  '{
    "title": "Get in Touch",
    "subtitle": "We are located inside the hospital campus and are happy to assist with catering and special orders.",
    "address": "Level 1, Hospital Lobby, 123 Health Avenue",
    "phone": "+65 9123 4567",
    "email": "hello@nettescafe.com",
    "hours_weekday": "7:00 AM – 7:00 PM",
    "hours_weekend": "8:00 AM – 4:00 PM"
  }'
),
(
  'menu',
  '{
    "title": "Our Menu",
    "subtitle": "Made fresh daily with the finest ingredients. Order eat-in or takeaway."
  }'
)
ON CONFLICT (section_key) DO NOTHING;
