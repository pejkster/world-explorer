-- ════════════════════════════════════════════════════════
--  WORLD EXPLORER — Database Schema
--  Run this in Supabase → SQL Editor → New query → Run
-- ════════════════════════════════════════════════════════

-- ── LEVELS ──────────────────────────────────────────────
create table if not exists levels (
  id            text primary key,           -- e.g. "slovenia"
  name          text not null,
  emoji         text default '🌍',
  theme         text default 'forest',      -- forest | coastal | tropical
  unlocked      boolean default true,
  map_x         real default 50,            -- % position on world map
  map_y         real default 30,
  postcard_msg  text default '',
  sort_order    int default 0,
  created_at    timestamptz default now()
);

-- ── COLLECTIBLES ────────────────────────────────────────
create table if not exists collectibles (
  id          uuid primary key default gen_random_uuid(),
  level_id    text references levels(id) on delete cascade,
  name        text not null,
  latin_name  text default '',
  emoji       text default '⭐',
  fact        text default '',
  photo_url   text default '',              -- Supabase Storage public URL
  x           int default 400,              -- pixel position in level
  y           int default 250,
  for_age     text default 'both',          -- both | 6 | 11
  rare        boolean default false,
  power       text default '',              -- '' | double_jump | glide | dash
  power_name  text default '',
  power_desc  text default '',
  power_emoji text default '',
  sort_order  int default 0,
  created_at  timestamptz default now()
);

-- ── NEPHEW SAVES (cloud progress) ──────────────────────
create table if not exists saves (
  nephew_id   text not null,                -- "tian" | "nephew2"
  level_id    text not null,
  item_ids    text[] default '{}',          -- collected collectible ids
  powers      text[] default '{}',
  updated_at  timestamptz default now(),
  primary key (nephew_id, level_id)
);

-- ════════════════════════════════════════════════════════
--  ROW LEVEL SECURITY
-- ════════════════════════════════════════════════════════
alter table levels       enable row level security;
alter table collectibles enable row level security;
alter table saves        enable row level security;

-- Anyone (the nephews, no login) can READ levels + collectibles
create policy "public read levels"       on levels       for select using (true);
create policy "public read collectibles" on collectibles for select using (true);

-- Only logged-in users (you) can WRITE levels + collectibles
create policy "auth write levels ins"  on levels       for insert to authenticated with check (true);
create policy "auth write levels upd"  on levels       for update to authenticated using (true);
create policy "auth write levels del"  on levels       for delete to authenticated using (true);
create policy "auth write coll ins"    on collectibles for insert to authenticated with check (true);
create policy "auth write coll upd"    on collectibles for update to authenticated using (true);
create policy "auth write coll del"    on collectibles for delete to authenticated using (true);

-- Saves: anyone can read + write their own progress (no login for nephews)
create policy "public read saves"  on saves for select using (true);
create policy "public write saves" on saves for insert with check (true);
create policy "public upd saves"   on saves for update using (true);

-- ════════════════════════════════════════════════════════
--  STORAGE BUCKET for collectible photos
-- ════════════════════════════════════════════════════════
insert into storage.buckets (id, name, public)
values ('collectible-photos', 'collectible-photos', true)
on conflict (id) do nothing;

-- Public read, authenticated upload
create policy "public read photos"
  on storage.objects for select
  using (bucket_id = 'collectible-photos');

create policy "auth upload photos"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'collectible-photos');

create policy "auth update photos"
  on storage.objects for update to authenticated
  using (bucket_id = 'collectible-photos');

create policy "auth delete photos"
  on storage.objects for delete to authenticated
  using (bucket_id = 'collectible-photos');
