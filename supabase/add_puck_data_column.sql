-- Migration: add content_json column for Puck visual editor output
-- The content_json column stores the full Puck Data object (blocks + order)
-- The legacy `blocks` column is preserved for backwards compatibility
ALTER TABLE custom_pages ADD COLUMN IF NOT EXISTS content_json JSONB DEFAULT NULL;
-- Also clean up the puck_data column from an earlier migration if it exists
ALTER TABLE custom_pages DROP COLUMN IF EXISTS puck_data;
