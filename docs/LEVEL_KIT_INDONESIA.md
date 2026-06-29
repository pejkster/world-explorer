# Level Production Kit — INDONESIA 🇮🇩
**Everything needed to build one complete, story-driven level from your trip.**

> This doubles as the **template for every future country.** Fill the same slots,
> get the same result. Indonesia (Bali journey) is the worked example.

---

## 0. How a level is structured (the rules you're designing into)

- A level = a **continuous ~7,000–7,500px world**, played left→right, ~3–4 min.
- It's split into **6 SECTIONS** (scenes). Each section = a real place from your
  trip + one platforming idea + one story beat + one collectible moment.
- Terrain mirrors the land: you **descend** into wild/dark places and **climb** to
  the emotional peak, where the **postcard** is written.
- The game already supports: ground with gaps + stepping platforms, floating
  platforms, dark zones, story captions, collectibles with photo or emoji,
  powers that gate progress, ambient background life, per-country signature hue.

---

## 1. LEVEL IDENTITY

| Field | Indonesia |
|---|---|
| Signature hue (world only) | **Warm temple gold** `#C4892A` |
| Accent / glow | **Offering orange** `#FF8C42` |
| Mood | spiritual, sunlit, lush, alive |
| Light | bright tropical key, deep jungle shade, dawn at the summit |
| Landmark (far layer) | **Mount Batur / Agung** volcano cone |
| Ambient life | a **monkey** swinging in the trees, **birds / dragonflies** |
| Music | gamelan-tinged ambient loop, insects, distant temple bell |
| Theme key in code | new `tropical` theme (already stubbed) |

---

## 2. THE JOURNEY — 6 SECTIONS AT A GLANCE

| # | Section (real place) | Mechanic | Story beat | Collectible | Power |
|---|---|---|---|---|---|
| 1 | **Black-Sand Beach** (arrival) | walk / first jumps | "I landed on an island of volcanoes and temples…" | Sea Turtle | — |
| 2 | **Rice Terraces** (Tegallalang) | step down/up the terraces | "Farmers carved the hills into green staircases…" | Rice & Subak | — |
| 3 | **Monkey Jungle** (dense, shaded) | **Glide** across vines/gaps | "The jungle was loud and watching me…" | Macaque Monkey | **grants Glide** |
| 4 | **Water Temple** (Tirta Empul) | precision over water | "At a holy spring, people prayed in the water…" | Temple & Holy Water | — |
| 5 | **Volcano Ascent** (Mt Batur, pre-dawn) | climb + **Double Jump** | "At 3am we climbed a volcano in the dark…" | Volcano (rare) | **grants Double Jump** |
| 6 | **Summit Sunrise** (the vista) | arrival / reward | the postcard, written at sunrise | — | — |

> Powers are placed **just before they're needed**: Glide is collected on the
> monkey in the jungle, right before the vine-gaps. Double Jump comes on the
> volcano you're climbing. Learn-it-then-use-it.

---

## 3. SECTION-BY-SECTION BUILD SHEET

For each: what the player does, what art it needs, the collectible, the story, the photo.

### Section 1 — Black-Sand Beach (Arrival) · ~0–1100px
- **Play:** flat sand, gentle first jumps onto driftwood/rock. Teaches controls safely.
- **Set pieces:** surf line, a wrecked fishing boat (jukung), palms.
- **Collectible:** **Green Sea Turtle** — *"Bali's beaches are nesting grounds…"* (you write the fact)
- **Story caption:** your arrival, 1–2 sentences.
- **Photo:** you on the beach / the coastline.
- **Platforms:** 2–3 low (driftwood logs, a rock).

### Section 2 — Rice Terraces (Tegallalang) · ~1100–2600px
- **Play:** the terraces ARE the platforms — step down then back up a green staircase.
- **Set pieces:** layered rice paddies, a palm, a farmer's hut.
- **Collectible:** **Rice & the Subak system** — *"1,000-year-old water-sharing…"*
- **Story caption:** the terraces.
- **Photo:** the terraces (iconic).
- **Platforms:** terrace steps (use the platform pieces as stone/earth steps), 6–8.

### Section 3 — Monkey Jungle · ~2600–3900px  *(DARK-ish, shaded)*
- **Play:** denser, a couple of **wide gaps** you cross with **Glide** (collected here).
- **Set pieces:** giant vines, buttress roots, a moss temple ruin (Goa Gajah vibe).
- **Collectible:** **Long-tailed Macaque** — grants **Glide ("Vine Glide")**.
- **Ambient life:** the monkey swinging in the mid layer.
- **Story caption:** the jungle.
- **Photo:** jungle / monkey / temple ruin.
- **Platforms:** roots + a glide gap (stepping vines optional).

### Section 4 — Water Temple (Tirta Empul) · ~3900–5300px
- **Play:** precision hops across stones over a holy pool; split-level temple gates.
- **Set pieces:** split candi bentar gate, koi pool, water spouts, offerings.
- **Collectible:** **Holy Spring / Temple** — *"People bathe to purify…"*
- **Story caption:** the temple.
- **Photo:** the water temple.
- **Platforms:** stepping stones over water, 6–7.

### Section 5 — Volcano Ascent (Mt Batur, pre-dawn) · ~5300–6800px  *(DARK → dawn)*
- **Play:** a climbing staircase up; **Double Jump** (the volcano collectible) for the rare high path. Dark, head-torch pool of light.
- **Set pieces:** black volcanic rock, steam vents, a string of climbers' lights.
- **Collectible:** **Mount Batur** (rare) — grants **Double Jump ("Volcano Leap")**.
- **Story caption:** the night climb.
- **Photo:** the dark ascent / steam.
- **Platforms:** rising rock ledges, 8.

### Section 6 — Summit Sunrise (the Vista) · ~6800–7400px
- **Play:** short walk onto the summit ledge as the sky turns gold → the postcard mailbox.
- **Set pieces:** the caldera, sea of clouds, the sun cresting.
- **Collectible:** none (the view IS the reward).
- **Story caption:** the final note ("From the top, at sunrise, I wrote this…").
- **Photo:** **THE postcard photo** — you at the summit at sunrise.
- **Platforms:** 2 simple ledges → mailbox.

---

## 4. ASSET MASTER CHECKLIST + COUNTS

### Approach decision (affects count)
Our renderer currently loads **one background set per level**. Two ways to do a
multi-biome journey:

- **v1 — One unified set (recommended to start).** A single cohesive "Indonesia"
  background (distant volcano + palms + terraced hills + sky). Per-section variety
  comes from **foreground props, the dark zones, and lighting/tint** — cheaper,
  ships fast. **~19 assets.**
- **v2 — Zone backgrounds (richer, later).** Group the 6 sections into **3 visual
  zones** (Coast/Terrace · Jungle/Temple · Volcano/Summit). Share sky+far+ground;
  swap **mid + near + foreground** per zone. Needs a small renderer upgrade I can
  build. **~+6 layers (~25 total).**

### v1 asset list (build this first)

| Category | Files | Count | Size (2×) |
|---|---|---|---|
| Background layers | sky, far, mid, near, foreground, ground | **6** | per ASSET_SPEC (sky 2000×1200, far 2400×1200, mid 2800×1200, near 3600×1200, foreground 5200×1200, ground 1024×320) |
| Platform pieces | plat-step (stone), plat-bamboo, plat-rock | **3** | 360×120 each |
| Collectible plates | turtle, rice, macaque, temple, volcano (+ 1 spare) | **5–6** | 128×128 (or use real photos) |
| Ambient life | monkey, bird | **2** | silhouettes ~120×80 / 48×32 |
| Postcard photo | summit sunrise (you) | **1** | 1200×800 JPG |
| Audio | ambient loop | **1** | 60–90s mp3 |
| Story captions | 6 lines of text | (text) | — |

**v1 total ≈ 6 + 3 + 6 + 2 + 1 = 18 image assets + 1 audio.**
**v2 adds ≈ 6 background layers → ~24 image assets.**

> Characters (Tian, Tibor) are **shared across all levels** — not counted per level.

---

## 5. COLLECTIBLES — fill these in (admin panel)

Each needs: name, latin name (optional), emoji (fallback), the **fun fact (your
words)**, rare?, power?, and ideally a **real photo**. Suggested set:

| Name | Emoji | Rare | Power | Fact (you write) |
|---|---|---|---|---|
| Green Sea Turtle | 🐢 | no | — | … |
| Rice & Subak | 🌾 | no | — | … |
| Long-tailed Macaque | 🐒 | no | **Glide** | … |
| Frangipani (Jepun) | 🌺 | no | — | … (optional 6th) |
| Tirta Empul Temple | 🛕 | no | — | … |
| Mount Batur | 🌋 | **yes** | **Double Jump** | … |

> 5 collectibles is the sweet spot (one per section 1–5; section 6 is the postcard).

---

## 6. STORY CAPTIONS — write 6 (your voice)

One short line per section, fades in as the player passes. This is the soul.

```
1. Beach:    "…"
2. Terraces: "…"
3. Jungle:   "…"
4. Temple:   "…"
5. Ascent:   "…"
6. Summit:   "…"  (leads into the postcard)
```

Plus the **postcard message** (~60–80 words) written from the summit.

---

## 7. PHOTOS YOU NEED

| Use | Photo |
|---|---|
| Postcard (essential) | **you at the Batur summit at sunrise** |
| Collectible photos (optional, lovely) | turtle/beach, terraces, monkey, temple, volcano |
| Reference for the painter (AI) | a few of your own shots per scene to guide the art |

---

## 8. PRODUCTION ORDER

1. **Write the 6 story beats + postcard** (you — this drives everything).
2. **Pick the 5–6 collectibles + facts**, add them in the admin (with photos).
3. **Generate the v1 background set** (6 layers) using the Art Director prompt,
   Indonesia hue. Drop in `assets/levels/indonesia/`.
4. **3 platform pieces** (stone step / bamboo / rock).
5. **I author the journey layout in code** (`LAYOUTS.indonesia`): section widths,
   ground gaps + stepping stones, platform staircases, collectible positions,
   story captions, dark zones (jungle + pre-dawn ascent).
6. **Ambient monkey + bird, audio loop, postcard photo.**
7. Playtest → tune gaps & pacing → (later) v2 zone backgrounds.

---

## 9. THE TOTALS (quick answer)

- **Sections:** 6
- **New image assets (v1):** ~18  (6 background + 3 platform + 5–6 collectibles + 2 ambient + 1 postcard photo)
- **Audio:** 1 loop
- **Story text:** 6 captions + 1 postcard message
- **Collectibles:** 5 (one per section 1–5)
- **Powers introduced:** 2 (Glide in jungle, Double Jump on volcano)
- **Photos:** 1 essential (summit) + up to 5 optional collectible photos

---

## 10. BLANK WORKSHEET (copy this for any future country)

```
COUNTRY: ________   Signature hue: ______   Landmark: ______   Music: ______

SECTION 1 (Arrival)  place:____  story:____________  collectible:____  mechanic:____  photo:____
SECTION 2            place:____  story:____________  collectible:____  mechanic:____  photo:____
SECTION 3            place:____  story:____________  collectible:____  power:____    photo:____
SECTION 4            place:____  story:____________  collectible:____  mechanic:____  photo:____
SECTION 5 (Ascent)   place:____  story:____________  collectible:____  power:____    photo:____
SECTION 6 (Summit)   the postcard. message:_______________________________  photo:____

ASSETS: 6 background + 3 platform + 5 collectibles + 2 ambient + 1 postcard + 1 audio
```
