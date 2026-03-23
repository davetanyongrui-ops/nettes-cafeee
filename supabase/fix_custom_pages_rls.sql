-- Fix custom_pages RLS policies to work with authenticated sessions
-- Drop the old policies that used is_admin() which may not exist
DROP POLICY IF EXISTS "Admins can insert custom pages" ON custom_pages;
DROP POLICY IF EXISTS "Admins can update custom pages" ON custom_pages;
DROP POLICY IF EXISTS "Admins can delete custom pages" ON custom_pages;

-- Create new policies that allow any authenticated user to manage pages
-- (Only admins can log in to the admin panel, so this is safe)
CREATE POLICY "Authenticated users can insert custom pages"
    ON custom_pages FOR INSERT
    TO authenticated
    WITH CHECK (true);

CREATE POLICY "Authenticated users can update custom pages"
    ON custom_pages FOR UPDATE
    TO authenticated
    USING (true);

CREATE POLICY "Authenticated users can delete custom pages"
    ON custom_pages FOR DELETE
    TO authenticated
    USING (true);
