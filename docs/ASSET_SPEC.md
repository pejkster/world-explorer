# World Explorer — Asset Production Spec

> The build-ready art list. Every asset below maps to a real slot already
> rendered in code. Make these and the world goes from "impressive shapes" to
> "magical place." Read **Section 0 first** — it's the glue that makes every
> asset feel part of one hand.

---

## 0. THE ART BIBLE (read before making anything)

If assets are made to look good *individually* they will clash. Cohesion comes
from obeying five shared rules across **every** asset, every country.

### 0.1 One technique: painted, soft, no hard outlines
- **Medium feel:** hand-painted **gouache / soft digital paint** — like a
  naturalist's field-journal plate brought to life. Visible soft brush, not
  vector flat, not pixel art, not glossy 3D.
- **Environments:** *no black outlines.* Forms read by value and color.
- **Characters & collectibles:** allowed a soft dark edge for readability, but
  painterly, never a hard cartoon stroke.

### 0.2 Aerial perspective is the depth law
This single rule creates the Ori "window" feeling. As layers recede:

| | Saturation | Value | Hue shift | Contrast | Detail |
|---|---|---|---|---|---|
| **Far** | low (washed) | lighter | toward sky hue (blue/haze) | low | silhouette only |
| **Mid** | medium | medium | neutral | medium | shapes, little texture |
| **Near** | high | darker | toward ground hue | high | some texture |
| **Foreground** | near-black silhouette | darkest | — | extreme | pure shape |

> Make far layers feel like they're *behind glass and mist.* Make foreground
> feel *right against the lens, out of focus, almost black.*

### 0.3 Light has one warm direction
- Key light is **warm**, coming from the **upper sky** (sun/dusk glow).
- Shadowed sides drift **cool** (toward the country's blue/violet).
- The **collectibles and the player are the brightest things on screen.**
  Everything else yields to them.

### 0.4 Silhouette-first
Every character, creature, and collectible must be **instantly recognizable as a
black shape at 48px.** If you can't tell what it is from silhouette alone, the
design is wrong. Test: fill it 100% black, shrink to 48px — still readable?

### 0.5 Per-country signature hue (already set in code)
Everything in a country bends toward its hue. UI never does.

| Country | Signature | Mood | Key light | Accent / glow |
|---|---|---|---|---|
| **Slovenia** 🇸🇮 | cool mossy green | ancient, quiet, dusk forest | low gold sun | firefly gold `#F4C842` |
| **Japan** 🇯🇵 | sakura silver-pink | refined, seasonal, twilight | soft pink dusk | lantern warm `#F5EFE0` |
| *(Bali, future)* | warm temple gold | spiritual, sunlit, lush | bright amber | offering orange `#FF8C42` |

### 0.6 The fixed UI palette is sacred (never bend these)
`Ink #1B2A3B · Botanical #2D6A4F · Cartographic #1A3A5C · Specimen #F5EFE0 ·
Amber #D4874A · Expedition Red #C0392B`. Specimen cards, postcard, HUD, journal
stay 100% on these six. Only the **world** expands.

---

## 1. CANVAS & COORDINATE FACTS (so art fits perfectly)

- Game canvas: **900 × 600** (3:2). Design everything at **2×** for crispness → reference 1800×1200.
- A level is **2100px wide**. Ground sits at **y = 512**. Player ≈ 34×48px.
- Export **PNG-24 with transparency** (except the sky, which is full-frame opaque).
- Background layers should be **horizontally seamless (tileable)** OR ≥ the
  scroll width below, so they never run out as the camera pans.

**Minimum width per layer = 900 + (2100 × parallaxSpeed):**

| Layer | Parallax | Min width | Recommend (2×) |
|---|---|---|---|
| Sky | 0.05 | 1005 | 2000 × 1200 |
| Far | 0.10 | 1110 | tileable, 2400 × 700 |
| Mid | 0.24 | 1404 | tileable, 3000 × 800 |
| Near | 0.55 | 2055 | tileable, 4200 × 700 |
| Play (platforms) | 1.00 | 2100 | tile set, see §4 |
| Foreground | 1.25 | 2625 | tileable, 5200 × 1000 |

---

## ★ FINAL ASSET SIZES (authoritative — use these exact numbers)

All authored at 2×. PNG, transparent EXCEPT `sky` (opaque) and photos (JPG).

**Background layers — all the SAME height (1200), horizon in the bottom ~15%, transparent above.** Same height = horizons line up across layers.

| File | Size | Seamless L-R? |
|---|---|---|
| `sky.png` | 2000 × 1200 (opaque) | — |
| `far.png` | 2400 × 1200 | yes (avoids seam) |
| `mid.png` | 2800 × 1200 | yes |
| `near.png` | 3600 × 1200 | helpful |
| `foreground.png` | 5200 × 1200 | helpful |

**Ground — a dedicated painted floor layer (NOT a platform tile). One long horizontal strip, the grass/surface at the TOP edge, earth/roots/foliage filling down. Seamless left-right so it repeats invisibly across the whole floor.**

| File | Size | Tileable? |
|---|---|---|
| `ground.png` | 1024 × 320 (seamless L-R) | YES — spans the entire floor |

> Authoring note: the **walkable surface = the very top of the image**. Everything
> below is earth/roots that fills to the bottom of the screen. It draws at full
> play-layer speed (1.0), grass line locked to ground level.

**Floating platform pieces — the three share ONE size & aspect (3:1) so they read as a family. Single centered object, flat walkable top ~25% down from the top edge, transparent around it.**

| File | Size | Tileable? |
|---|---|---|
| `plat-log.png` | 360 × 120 | no — single object |
| `plat-rock.png` | 360 × 120 | no — single object |
| `plat-plank.png` | 360 × 120 | no — single object |

**Characters** (per nephew, each frame): 96 × 128, transparent, centered, facing right.
**Collectible plates**: 128 × 128, transparent. **Postcard photo**: 1200 × 800, JPG.

---

## 2. PER-COUNTRY BACKGROUND LAYERS

Each country needs this stack. Filenames are what the renderer will look for.

```
assets/levels/<country>/
  sky.png            full-frame gradient sky + soft clouds/glow      (opaque)
  far.png            distant silhouette range + LANDMARK             (transparent)
  mid.png            hills / forest mass / temple rooftops           (transparent)
  near.png           detailed closer foliage / rocks                 (transparent)
  foreground.png     near-black out-of-focus framing plants          (transparent)
  platforms.png      tile set — ground cap, dirt, plank/stone, rock  (transparent)
```

### 2.1 SLOVENIA — paste-ready generation prompts

> Generate all six in one session with a consistent style reference so they
> match. Append this **style suffix** to every prompt:
> *"hand-painted gouache, soft brush, no outlines, muted naturalist field-journal
> palette, cinematic depth, dusk light, cohesive — :: 3:2"*

- **sky.png** — *"Twilight forest sky over the Julian Alps, deep teal-blue at top fading to soft moss-green and warm gold near the horizon, faint mist, a few soft clouds, calm and ancient."*
- **far.png** — *"Distant silhouette of jagged snow-capped Triglav mountain range, heavily desaturated cool blue-green, hazy aerial perspective, almost flat, no detail, sitting on a misty horizon, transparent sky."*
- **mid.png** — *"Rolling pine-forest hills and a glimpse of Lake Bled's island church, muted botanical greens, soft shapes, gentle mist between hills, mid-distance, transparent above."*
- **near.png** — *"Closer mossy limestone outcrops and pine trees, richer saturated forest green, some bark and moss texture, darker values, transparent above."*
- **foreground.png** — *"Near-black silhouettes of pine boughs and ferns framing the edges, out of focus, no detail, pure dark shapes against transparency."*
- **platforms.png** — *"Tile set on transparent background: a mossy grass-topped earth ledge, a fallen mossy log platform, a grey limestone rock block, and a wooden plank — hand-painted, top-lit warm, 4 separate pieces in a row."*

### 2.2 JAPAN — paste-ready generation prompts

> Style suffix: *"hand-painted gouache, soft brush, no outlines, refined muted
> sakura palette, cinematic depth, pink-silver dusk light, cohesive — :: 3:2"*

- **sky.png** — *"Twilight Japanese sky, deep indigo top fading to soft sakura pink and silver near horizon, a faint pale moon, calm and refined, drifting haze."*
- **far.png** — *"Distant silhouette of symmetrical snow-capped Mount Fuji, desaturated dusky violet-blue, hazy aerial perspective, flat and serene, on a misty horizon, transparent sky."*
- **mid.png** — *"Mid-distance hills with a red torii gate and rooftops of a Shinto shrine among cherry trees, muted dusty pinks and slate, soft mist, transparent above."*
- **near.png** — *"Closer blossoming cherry trees and stone lanterns, richer pink and warm grey, some bark texture, darker values, transparent above."*
- **foreground.png** — *"Near-black silhouettes of cherry branches and bamboo framing the edges, out of focus, pure dark shapes, transparent."*
- **platforms.png** — *"Tile set on transparent background: a grass-and-stone temple step, a carved grey stone block, a dark wooden engawa plank, and a mossy rock — hand-painted, soft dusk light, 4 separate pieces in a row."*

---

## 3. THE NEPHEW CHARACTERS (highest priority — the star)

Two sprite sheets. **Silhouette-first** (§0.4). Readable at 48px against any background.

```
assets/characters/
  tian.png        sprite sheet, horizontal strip
  explorer2.png   sprite sheet (rename to the older nephew's name)
```

**Sheet layout** — one row, each frame **96 × 128px** (2× of 48×64 on-screen):

| State | Frames | Notes |
|---|---|---|
| Idle | 4 | gentle breathing / look around |
| Run | 6 | the cycle players see most — make it bouncy & joyful |
| Jump (rise) | 2 | arms up, hopeful |
| Fall | 2 | |
| Glide | 1 | arms out / scarf flares like a wing |
| Collect (cheer) | 3 | a little celebration on pickup |

Total ≈ 18 frames → sheet **1728 × 128** (or wrap to 2 rows of 9).

**Design briefs:**

- **Tian (6)** — *rounder head, larger curious eyes, shorter bouncier legs, an
  explorer's cap and a little backpack. Soft Miyazaki proportions. Warm —
  accented in Amber `#D4874A`. Carries a faint warm glow (he is the light in a
  new place).* Silhouette = small + round + cap.
- **Explorer 2 (11)** — *slightly taller, confident stance, longer stride, a
  rolled map or compass on the belt, hood or windswept hair. Cool — accented in
  Cartographic blue `#1A3A5C`, faint teal glow.* Silhouette = taller + angular +
  map roll.

> Both should look like **the same two kids in every country** — they're the
> constant. The world changes around them.

**Generation note:** sprite sheets are hard for AI to keep consistent frame-to-frame.
Best path: generate **one clean character portrait/turnaround** per nephew with
AI, then animate the frames by hand in **Aseprite** or **Piskel** (or commission
just the animation). Lock the design first, animate second.

---

## 4. PLATFORM / GROUND TILE SET (per theme, reusable)

Covered by `platforms.png` above, but the cutting spec:

- 4 pieces per theme, each **128 × 64px** (2×), transparent.
- **Ground cap** (grass/stone top, ~16px lip + body below), **mid platform**
  (log / temple step), **rock block**, **plank**.
- Must **tile horizontally** for long ground. Top edge warm-lit, underside cool.
- The goal (Ori block #1): platforms feel **of the place** — a mossy log, a
  temple step — *never a generic floating bar.*

---

## 5. COLLECTIBLE SPECIMEN ILLUSTRATIONS (128×128)

Optional but high-impact — they upgrade the emoji in the specimen card. Match the
**field-journal plate** look: the thing painted on aged `Specimen #F5EFE0` paper.

```
assets/collectibles/<id>.png    128 × 128, transparent, soft drop of shadow
```

**Style suffix:** *"single natural-history specimen illustration, hand-painted
gouache on cream paper, soft shadow, centered, field-journal plate, no text — ::
1:1"*

Current items needing plates (id → subject):

**Slovenia:** `brown_bear` (brown bear), `honey` (jar of honey + honeycomb),
`proteus` (pale cave olm salamander), `lake_bled` (island church on a lake),
`triglav` (snow mountain, **rare** — give it a faint red-edged glow).

**Japan:** `torii_gate` (red torii), `cherry_blossom` (sakura sprig),
`sushi` (two nigiri), `shinkansen` (bullet train nose), `mt_fuji` (Fuji, **rare**).

> These are also the perfect place for **your real travel photos** — the admin
> already supports a photo per collectible. Rule: *if you have a real photo, use
> it; otherwise the painted plate; emoji is the final fallback.*

---

## 6. AMBIENT LIFE SPRITES (the "look at that!" layer)

Currently the bear and birds are code-drawn shapes. Optional upgrade to painted
silhouette sprites (they live in the mid/far layers, so **silhouette only**):

```
assets/levels/slovenia/life-bear.png    ~120×80, dark moss-green silhouette, side profile
assets/levels/japan/life-bird.png        ~48×32, dark silhouette, wings mid-flap (2 frames)
```

Future per-country ambient ideas (1–2 each, never interactive):
Slovenia → bear, fireflies (have), distant deer. Japan → birds, drifting petals
(have), a paper lantern swaying. Bali → a monkey on temple stones. Okinawa → a
sea turtle in a water layer.

---

## 7. PARTICLES (tiny, big payoff)

Mostly code-drawn already. Optional 1 sprite each for richness:

```
assets/fx/firefly.png   16×16 soft amber glow dot
assets/fx/petal.png     16×16 single sakura petal
assets/fx/dust.png      16×16 faint mote
assets/fx/godray.png    512×512 soft diagonal light gradient (optional overlay)
```

---

## 8. THE POSTCARD PHOTO (the emotional payload)

The "look what Nejc is doing!" beat. Per country, one **real landscape photo of
you there**, used as the left panel of the postcard.

```
assets/levels/<country>/postcard-photo.jpg   1200 × 800, landscape, you in the scene
```

Treatment in code (to build): slight warm grade + a thin Ink border + the country
name in Playfair over a darkened lower third. Keep the photo *real* — it's the one
place the truth breaks through the illustration.

---

## 9. AUDIO (gentle — youngest player is 6)

```
assets/audio/
  ambient-forest.mp3     60–90s seamless loop — birdsong, wind, distant stream
  ambient-coastal.mp3    60–90s — soft waves, gulls, wind
  ambient-tropical.mp3   60–90s — insects, leaves, far temple bell
  (sfx are synthesized in-code already; real ones optional)
```
Source: **freesound.org** (CC0). Keep it soft, no sudden sounds. Currently the
game uses a synthesized ambient pad — these would replace it per theme.

---

## 10. PRODUCTION ORDER (do it in this sequence)

1. **Lock the two nephew designs** (portraits). They appear in every screen — get
   them right first. → §3
2. **Slovenia full layer set** (sky→foreground + platforms). Prove the pipeline on
   one country end-to-end. → §2.1, §4
3. **I wire the asset loader** so Slovenia renders with your art (shapes stay as
   fallback). We look at it together, tune.
4. **Slovenia collectible plates + postcard photo.** → §5, §8
5. **Japan full set** (now the pattern is proven). → §2.2
6. **Ambient life + audio polish.** → §6, §9

---

## 11. NAMING & HAND-OFF CHECKLIST

- Folders exactly as written (lowercase country id matching `levels.id`).
- PNG-24 + transparency; sky and photos may be JPG.
- Backgrounds horizontally seamless where noted.
- Drop everything into `assets/` and tell me — I extend the loader to use it,
  with the current code-drawn version as automatic fallback so nothing ever breaks.

> **Cohesion test before you ship a country:** put all six layers on screen
> together, squint. Does it read as *one painting at different depths* — or six
> images stacked? If it's six images, push far layers lighter/hazier and
> foreground darker until they melt into one place. That melt **is** the magic.
