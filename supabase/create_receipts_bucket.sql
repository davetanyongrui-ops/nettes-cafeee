-- ============================================================
-- NETTE'S CAFE — Create receipts storage bucket
-- Run this in Supabase SQL Editor to fix receipt upload failures.
-- ============================================================

-- 1. Create the receipts storage bucket if it doesn't exist
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'receipts',
  'receipts',
  true,
  5242880,  -- 5MB limit
  ARRAY['image/jpeg', 'image/png', 'image/webp', 'image/heic', 'application/pdf']
)
ON CONFLICT (id) DO UPDATE SET
  public = true,
  file_size_limit = 5242880,
  allowed_mime_types = ARRAY['image/jpeg', 'image/png', 'image/webp', 'image/heic', 'application/pdf'];

-- 2. Allow anyone to upload receipts (customers are anonymous)
CREATE POLICY "Anyone can upload receipts"
  ON storage.objects FOR INSERT
  TO anon, authenticated
  WITH CHECK (bucket_id = 'receipts');

-- 3. Allow anyone to read receipts
CREATE POLICY "Anyone can read receipts"
  ON storage.objects FOR SELECT
  TO anon, authenticated
  USING (bucket_id = 'receipts');
