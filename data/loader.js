// ════════════════════════════════════════════════════════
//  Loads levels from Supabase, maps to the game's LEVELS shape.
//  Falls back to the static window.LEVELS (data/levels.js) if
//  Supabase is unreachable or empty.
// ════════════════════════════════════════════════════════
let sb = null;

async function loadLevelsFromSupabase() {
  // Keep the static array as the offline fallback
  const fallback = window.STATIC_LEVELS || [];

  if (!window.supabase) return fallback;
  try {
    sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

    const [{ data: levels, error: e1 }, { data: colls, error: e2 }] = await Promise.all([
      sb.from('levels').select('*').order('sort_order'),
      sb.from('collectibles').select('*').order('sort_order'),
    ]);

    if (e1 || e2 || !levels || levels.length === 0) return fallback;

    return levels.map(l => ({
      id:          l.id,
      name:        l.name,
      emoji:       l.emoji,
      theme:       l.theme,
      unlocked:    l.unlocked,
      mapPosition: { x: l.map_x, y: l.map_y },
      postcard:    { message: l.postcard_msg, backgroundColour: '#2D6A4F' },
      collectibles: colls
        .filter(c => c.level_id === l.id)
        .map(c => ({
          id:         c.id,
          name:       c.name,
          latinName:  c.latin_name,
          emoji:      c.emoji,
          fact:       c.fact,
          photoUrl:   c.photo_url,
          x:          c.x,
          y:          c.y,
          forAge:     c.for_age,
          rare:       c.rare,
          power:      c.power || null,
          powerName:  c.power_name,
          powerDesc:  c.power_desc,
          powerEmoji: c.power_emoji,
        })),
    }));
  } catch (err) {
    console.warn('Supabase load failed, using local data:', err);
    return fallback;
  }
}

// ── Cloud save helpers (nephews, no login) ──
async function cloudSaveProgress(nephewId, levelId, itemIds, powers) {
  if (!sb) return;
  try {
    await sb.from('saves').upsert({
      nephew_id: nephewId, level_id: levelId,
      item_ids: itemIds, powers: powers, updated_at: new Date().toISOString(),
    });
  } catch (e) { /* offline — localStorage still has it */ }
}

async function cloudLoadProgress(nephewId) {
  if (!sb) return null;
  try {
    const { data } = await sb.from('saves').select('*').eq('nephew_id', nephewId);
    return data || null;
  } catch (e) { return null; }
}
