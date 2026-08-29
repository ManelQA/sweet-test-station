CREATE POLICY "Authenticated read resource files" ON storage.objects
  FOR SELECT TO authenticated
  USING (bucket_id = 'resources');

CREATE POLICY "Teachers upload own resource files" ON storage.objects
  FOR INSERT TO authenticated
  WITH CHECK (bucket_id = 'resources' AND (storage.foldername(name))[1] = auth.uid()::text);

CREATE POLICY "Teachers update own resource files" ON storage.objects
  FOR UPDATE TO authenticated
  USING (bucket_id = 'resources' AND (storage.foldername(name))[1] = auth.uid()::text)
  WITH CHECK (bucket_id = 'resources' AND (storage.foldername(name))[1] = auth.uid()::text);

CREATE POLICY "Teachers delete own resource files" ON storage.objects
  FOR DELETE TO authenticated
  USING (bucket_id = 'resources' AND (storage.foldername(name))[1] = auth.uid()::text);