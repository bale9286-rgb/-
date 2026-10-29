-- CAREER-FLOW NEXUS v4 cloud record table
-- Run this in the Supabase SQL Editor for your project.
create table if not exists public.careerflow_records (
  user_id uuid not null references auth.users(id) on delete cascade,
  record_key text not null default 'main',
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, record_key)
);

alter table public.careerflow_records enable row level security;

grant select, insert, update, delete on table public.careerflow_records to authenticated;

drop policy if exists "read own careerflow records" on public.careerflow_records;
drop policy if exists "insert own careerflow records" on public.careerflow_records;
drop policy if exists "update own careerflow records" on public.careerflow_records;
drop policy if exists "delete own careerflow records" on public.careerflow_records;

create policy "read own careerflow records" on public.careerflow_records
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own careerflow records" on public.careerflow_records
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own careerflow records" on public.careerflow_records
  for update to authenticated using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
create policy "delete own careerflow records" on public.careerflow_records
  for delete to authenticated using ((select auth.uid()) = user_id);
