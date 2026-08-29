CREATE TYPE public.resource_category AS ENUM ('cours', 'exercices');

CREATE TABLE public.resources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  teacher_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  level_id uuid REFERENCES public.levels(id) ON DELETE SET NULL,
  category public.resource_category NOT NULL,
  title text NOT NULL,
  description text,
  file_path text NOT NULL,
  file_name text NOT NULL,
  mime_type text,
  file_size bigint,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.resources TO authenticated;
GRANT ALL ON public.resources TO service_role;

ALTER TABLE public.resources ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated read resources" ON public.resources
  FOR SELECT TO authenticated USING (true);

CREATE POLICY "Teachers insert own resources" ON public.resources
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = teacher_id);

CREATE POLICY "Teachers update own resources" ON public.resources
  FOR UPDATE TO authenticated USING (auth.uid() = teacher_id) WITH CHECK (auth.uid() = teacher_id);

CREATE POLICY "Teachers delete own resources" ON public.resources
  FOR DELETE TO authenticated USING (auth.uid() = teacher_id OR public.has_role(auth.uid(), 'super_admin'));

CREATE INDEX resources_level_category_idx ON public.resources (level_id, category);

CREATE TRIGGER update_resources_updated_at
  BEFORE UPDATE ON public.resources
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();