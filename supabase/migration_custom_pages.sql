-- custom_pages table
CREATE TABLE IF NOT EXISTS custom_pages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    slug TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    blocks JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS
ALTER TABLE custom_pages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Custom pages are viewable by everyone." ON custom_pages FOR SELECT USING (true);
CREATE POLICY "Admins can insert custom pages" ON custom_pages FOR INSERT WITH CHECK (is_admin());
CREATE POLICY "Admins can update custom pages" ON custom_pages FOR UPDATE USING (is_admin());
CREATE POLICY "Admins can delete custom pages" ON custom_pages FOR DELETE USING (is_admin());

-- Seed example page
INSERT INTO custom_pages (slug, title, blocks) VALUES (
    'our-story', 
    'Our Story', 
    '[
        {"id": "1", "type": "text", "content": "Welcome to our story...", "style": {"fontSize": "2xl", "color": "emerald-900", "textAlign": "center"}},
        {"id": "2", "type": "text", "content": "We started this cafe to bring healthy food to the neighborhood.", "style": {"fontSize": "base", "color": "stone-600", "textAlign": "center"}}
    ]'::jsonb
) ON CONFLICT (slug) DO NOTHING;
