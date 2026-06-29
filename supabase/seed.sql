-- ════════════════════════════════════════════════════════
--  SEED DATA — Slovenia + Japan
--  Run AFTER schema.sql. Safe to re-run (upserts).
-- ════════════════════════════════════════════════════════

insert into levels (id, name, emoji, theme, unlocked, map_x, map_y, postcard_msg, sort_order) values
('slovenia','Slovenia','🇸🇮','forest', true, 51, 30,
 'Hey guys! I''m writing this from a tiny village surrounded by mountains and forest. Yesterday I saw a deer right outside my window. The people here make incredible honey and the rivers are the most amazing shade of turquoise. One day I''ll take you both to Lake Bled — you can row a little wooden boat to an island with a church on it. Can''t wait to explore more of the world with you!', 1),
('japan','Japan','🇯🇵','coastal', true, 80, 32,
 'Hello from Japan! I''m in a tiny ramen shop eating noodles while snow falls outside. The city is electric — millions of people, vending machines everywhere, a bullet train that blurs the trees. I went to a Shinto shrine at sunrise and it was the most peaceful place I''ve ever stood. I wish you could see the cherry blossoms in spring — the whole city turns pink. Sending so much love!', 2)
on conflict (id) do update set
  name=excluded.name, emoji=excluded.emoji, theme=excluded.theme,
  unlocked=excluded.unlocked, map_x=excluded.map_x, map_y=excluded.map_y,
  postcard_msg=excluded.postcard_msg, sort_order=excluded.sort_order;

-- Slovenia collectibles
insert into collectibles (level_id, name, latin_name, emoji, fact, x, y, for_age, rare, power, power_name, power_desc, power_emoji, sort_order) values
('slovenia','Brown Bear','Ursus arctos','🐻','Slovenia has one of the densest brown bear populations in Europe — over 1,000 bears live in the forests here!',320,300,'both',false,'','','','',1),
('slovenia','Carniolan Honey','Apis mellifera carnica','🍯','Beekeeping is a protected cultural heritage in Slovenia. The Carniolan bee is famous all over the world for being calm and incredibly hardworking.',620,240,'both',false,'','','','',2),
('slovenia','Cave Olm','Proteus anguinus','🦎','The olm is a blind cave salamander found only in Slovenian caves. It can survive without food for 10 years and live to over 100!',900,280,'both',false,'glide','Cave Glide','Hold ↑ while falling to drift slowly like a cave creature.','🌊',3),
('slovenia','Lake Bled','Lacus Bledensis','🏔️','Lake Bled has a tiny island in the middle with a church. You have to row a wooden pletna boat to reach it — there is no motor boat allowed!',1180,220,'both',false,'','','','',4),
('slovenia','Mount Triglav','Mons Tricornis','⛰️','Triglav is Slovenia''s highest peak at 2,864 metres. Every Slovenian is expected to climb it at least once in their lifetime!',1480,140,'11',true,'double_jump','Mountain Leap','Press ↑ again in the air to leap a second time — like jumping from peak to peak.','⛰️',5);

-- Japan collectibles
insert into collectibles (level_id, name, latin_name, emoji, fact, x, y, for_age, rare, power, power_name, power_desc, power_emoji, sort_order) values
('japan','Torii Gate','Porta Shinto','⛩️','Torii gates mark the entrance to Shinto shrines. They are painted red because in Japan, red keeps away evil spirits and bad luck!',300,280,'both',false,'','','','',1),
('japan','Cherry Blossom','Prunus serrulata','🌸','Every spring, Japan''s cherry trees bloom for just one or two weeks. Families sit under them for picnics — a tradition called hanami, or ''flower viewing''.',580,230,'both',false,'glide','Blossom Float','Hold ↑ while falling to drift slowly down like a petal.','🌸',2),
('japan','Nigiri Sushi','Oryza cum pisce','🍣','Sushi was originally street food in Japan in the 1800s. The chef would prepare it right in front of you in seconds. Today it is eaten all around the world!',860,260,'both',false,'','','','',3),
('japan','Bullet Train','Shinkansen velocissimus','🚅','Japan''s bullet trains travel at 320 km/h — faster than a cheetah! In 60 years of running, they have never had a single fatal accident.',1150,200,'both',false,'dash','Bullet Dash','Press Z or Shift to burst forward at bullet-train speed.','⚡',4),
('japan','Mount Fuji','Fujiyama sacra','🗻','Mount Fuji is Japan''s highest mountain and an active volcano. About 200,000 people climb it every year — even children your age!',1460,150,'11',true,'double_jump','Fuji Leap','Press ↑ again in the air for a second jump — like leaping between cloud levels.','🗻',5);
