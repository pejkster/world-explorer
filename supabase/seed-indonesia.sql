-- ════════════════════════════════════════════════════════
--  INDONESIA — Chapter 1: The Rainforest
--  Run AFTER schema.sql (and the main seed). Safe to re-run.
--  Edit the facts/photos later in the admin panel.
-- ════════════════════════════════════════════════════════

insert into levels (id, name, emoji, theme, unlocked, map_x, map_y, postcard_msg, sort_order) values
('indonesia','Indonesia','🇮🇩','jungle', true, 79, 62,
 '(Chapter 1 ends here for now — the reef, the islands, and Bali come next.)', 3)
on conflict (id) do update set
  name=excluded.name, emoji=excluded.emoji, theme=excluded.theme,
  unlocked=excluded.unlocked, map_x=excluded.map_x, map_y=excluded.map_y,
  postcard_msg=excluded.postcard_msg, sort_order=excluded.sort_order;

-- Remove any earlier Indonesia collectibles so re-runs don't duplicate
delete from collectibles where level_id='indonesia';

insert into collectibles (level_id, name, latin_name, emoji, fact, x, y, for_age, rare, power, power_name, power_desc, power_emoji, sort_order) values
('indonesia','Orangutan','Pongo pygmaeus','🦧','(Add your orangutan story here.)',780,250,'both',false,'','','','',1),
('indonesia','Proboscis Monkey','Nasalis larvatus','🐒','(Add your proboscis monkey story here.)',1260,240,'both',false,'','','','',2),
('indonesia','Gibbon','Hylobatidae','🐒','(Add your gibbon story here.)',2100,180,'both',false,'glide','Canopy Swing','Hold ↑ while falling to glide between the trees.','🌿',3),
('indonesia','Scuba Gear','','🤿','(The key to the deep — with this I could dive into the reef.)',3420,260,'both',false,'','','','',4);
