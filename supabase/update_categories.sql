-- This script updates the check constraint on the menu_items table to allow the new categories.
-- Note: Supabase UI will complain if we try to insert these items without this alter table.

ALTER TABLE menu_items DROP CONSTRAINT menu_items_category_check;

ALTER TABLE menu_items ADD CONSTRAINT menu_items_category_check 
CHECK (category IN ('soup', 'muffin', 'salad_base', 'salad_protein', 'salad_dressing', 'salad_topping', 'special', 'pie', 'pastry', 'build_bowl', 'build_wrap', 'coffee', 'other_drinks', 'daily_special'));
