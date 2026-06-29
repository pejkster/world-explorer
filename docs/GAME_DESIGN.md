# World Explorer — Game Design & Art Direction Plan

> A platformer where two nephews explore the real countries their Uncle Nejc
> travels to. The goal is not score — it's the feeling of *"look what Nejc is
> doing!"* The game is the envelope; the postcard inside is the point.

---

## 1. The Core Feeling (what we're really making)

Most platformers are about mastery. Ours is about **connection**. Every
mechanic should serve one of two jobs:

1. **Make the world feel worth exploring** (so the facts/photos land)
2. **Make the nephews feel capable** (6yr can finish, 11yr can master)

The reference points:

| Game | What we steal | What we leave |
|---|---|---|
| **Super Mario** | Tight, readable jumping. One mechanic taught at a time. Generous checkpoints. | Enemies-as-threat, lives, time pressure |
| **Ori and the Blind Forest** | *Movement feels emotional.* Premium parallax art. Abilities gate exploration. | Punishing difficulty, death-heavy combat |
| **Journey / Gris** | Wordless emotion, a sense of "someone made this for me" | — |

**Key research insight (Ori):** Moon Studios spent 18 months tuning the
*character controller* before designing a single final level. The movement is
the game. We should lock how it *feels to move* before building clever levels.

---

## 2. Game Mechanics — layered by age

Three difficulty layers coexist in ONE level (the brief already says both
nephews share a level). We do this with **branching paths**, not separate levels.

```
                    ┌─ HIGH PATH ── rare specimen (11yr) ── needs Double Jump
   START ───────────┤
                    └─ LOW PATH ─── common specimens (both) ── ground-level, safe
```

- **The low path** always reaches the postcard. A 6yr-old never gets stuck.
- **The high path** holds rare specimens + needs a power to reach.
- They **rejoin** regularly so the younger one is never left behind.

### Movement moveset (final target)
| Action | Input | Feel |
|---|---|---|
| Run | ← → / touch | Slight acceleration + friction (not instant) — feels alive |
| Jump | ↑ / A | Variable height (hold = higher). Coyote time + jump buffer. |
| **Coyote time** | — | Can still jump ~100ms after leaving a ledge. *This is the #1 thing that makes a platformer feel fair to kids.* |
| **Jump buffer** | — | If they press jump just before landing, it still fires. |
| Glide | hold ↑ falling | Drift — calm, floaty (Cherry Blossom / Cave Olm) |
| Double Jump | ↑ midair | Reach high path (Triglav / Fuji) |
| Dash | Z / Shift | Cross gaps, feel speed (Bullet Train) |

> **Decision needed:** add coyote time + jump buffer + acceleration to the
> controller FIRST, before designing levels. This is the Ori lesson.

### Puzzles — gentle, discovery-based (not brain-burners)
We want *"where is it?"* not *"how do I solve it?"*. Three puzzle types:

1. **Reach puzzles** — specimen is visible but high. *Which platform path gets me there?* (uses a power)
2. **Hidden nooks** — a specimen tucked behind a waterfall / inside a cave mouth / above the camera. Rewards curiosity.
3. **Sequence** — step on 3 lily pads / stones in order, a platform rises. (One per level max, optional, on the high path.)

No enemies that kill. At most: **gentle hazards** that bump you back (a goat,
a wave, a gust) — never a game-over. Falling = respawn on last platform, no penalty.

---

## 3. Level Design Recipe (per country)

Each level is a **3-act journey**, ~2–4 minutes:

```
ACT 1 — ARRIVAL (teach)
  Flat, safe ground. Introduce the country's mood. 1 easy specimen.
  If the level grants a power, the power's specimen is here, taught in a safe spot.

ACT 2 — EXPLORE (challenge)
  The path branches. Low road + high road. 2–3 specimens.
  One "wow" landmark in the background (Mt Triglav, Mt Fuji) the player walks toward.

ACT 3 — VISTA (reward)
  Path climbs to a high point with the best view + the rare specimen.
  Then the postcard mailbox. The uncle's message lands when they feel they've "arrived."
```

**Pacing rule (from research):** intense stretch → calm stretch → intense.
Never two hard jumps back-to-back for the 6yr path.

**Teaching rule (from research):** every new mechanic gets a *safe room* first
(no fall risk), THEN a challenge that uses it. e.g. Glide: first over solid
ground, then over a gap.

---

## 4. Visual & Art Direction

Locked to the **Style Brief** (6 colors, Playfair + Baloo 2, field-journal
feel). Now we extend it into *layered scenery* like Ori.

### The parallax stack (every level, back → front)
```
Layer 0  SKY        flat gradient (Cartographic → theme)         [static]
Layer 1  FAR        silhouette mountains / skyline                [moves 0.1x]   ← the "landmark"
Layer 2  MID        hills, forest mass, temple roofs              [moves 0.3x]
Layer 3  PLAY       platforms + ground the player stands on       [moves 1.0x]
Layer 4  DETAIL     grass tufts, foreground leaves, fireflies     [moves 1.2x]
Layer 5  ATMOS      light rays, fog, particles (subtle)           [overlay]
```

This depth is what separates "premium" (Ori) from "flat kids app." It's mostly
free — same shapes, different scroll speeds — but it needs **real art assets**
to sing instead of canvas rectangles.

### Per-country art identity (within the 6 colors)
| Country | Far layer | Mid | Mood / light |
|---|---|---|---|
| Slovenia 🇸🇮 | Julian Alps + Triglav silhouette | pine forest, Lake Bled island | dawn mist, fireflies, Botanical greens |
| Japan 🇯🇵 | Mt Fuji + city skyline | torii gates, cherry trees | dusk pink, falling petals, lanterns |
| *(future)* | — | — | — |

### Incorporating real photos & locations
Two places photos appear — keep the game *illustrated*, the photos *precious*:
1. **Specimen card** — the 128px real photo (already built). The reveal moment.
2. **Postcard screen** — a real landscape photo of you *there* as the left panel
   background. *This* is the "look what Nejc is doing!" beat. (To build.)

> Photos are rewards, not wallpaper. The world is drawn; the truth is photographed.

---

## 5. Asset List (what to create)

Priority order. Format notes assume the canvas renderer.

### A. Characters (highest priority — the movement star)
Each nephew needs a sprite sheet. Recommended: **PNG strip, ~64×64 per frame**.
| Animation | Frames | Notes |
|---|---|---|
| Idle | 2–4 | gentle breathing/bob |
| Run | 6–8 | the one players see most |
| Jump (rising) | 1–2 | arms up |
| Fall | 1–2 | |
| Glide | 1 | arms out / scarf flares |
| Collect (cheer) | 2–3 | plays on specimen pickup |

Two characters → 2 sheets. *Tool: Piskel (free), Aseprite ($20), or commission.*

### B. Tilesets / platforms (per theme)
Reusable across countries that share a theme.
| Theme | Pieces |
|---|---|
| Forest | grass-top ground tile, dirt body, wooden plank platform (L/M/R caps), rock |
| Coastal | sand ground, coral-rock platform, stone temple block |
| Tropical | jungle ground, vine, stone step |
Each as ~**48–64px tiles**, PNG, transparent.

### C. Background layers (per country, the "premium" cost)
- **Far silhouette** — one wide PNG (e.g. 1600×400) of the country's skyline/mountains
- **Mid layer** — forest mass / temple row, semi-transparent PNG
- **Foreground** — grass/leaf strip that overlays the bottom
*These can also be SVG or even layered canvas shapes if you'd rather not draw —
but hand-painted = the Ori feeling.*

### D. Collectible icons (optional — emoji works as fallback)
128px hand-drawn "specimen illustration" per collectible (field-journal ink
style). You already have emoji as the baseline; upgrade favorites over time.

### E. Atmosphere / particles (small, high impact)
- Firefly / petal / dust sprite (8×8 glowing dot is enough)
- Light-ray overlay (soft diagonal gradient PNG)

### F. Audio (later, but plan for it)
- 1 ambient loop per theme (forest birds, ocean, city hum) — sets mood hugely
- Soft "collect" chime, jump *whff*, postcard "stamp" thunk
- Keep it gentle (6yr-old). *Source: freesound.org, or simple.*

---

## 6. Build Order (proposed — before we code)

1. **Controller feel pass** — coyote time, jump buffer, run accel, variable jump.
   Tune it with the current rectangles. *(Ori's lesson: feel first.)*
2. **Asset pipeline** — make the renderer load PNG sprite sheets + background
   layers instead of drawing shapes. You start drawing/ commissioning assets.
3. **Level authoring** — extend the admin so platforms & paths are data too
   (right now platforms are hardcoded). Then levels become fully content-driven.
4. **Branching paths + gentle hazards** — the low/high road system.
5. **Photo postcard** — real landscape photo as postcard background.
6. **Polish** — particles, ambient audio, transitions.

---

## 7. Decisions (made 2026-06)
- **Art route:** AI-generated base art, then hand-tweaked. Renderer must load PNG sprite sheets + layered backgrounds.
- **Level authoring:** layouts stay in code (hand-crafted). Collectibles/photos/text editable in admin.
- **Audio:** basic from the start — synthesized SFX + gentle ambient, mute toggle.
- **Postcard:** real landscape photo of Nejc at the location (TBD which photo per country).

## 8. Build Log
- ✅ Controller feel pass: run acceleration/friction, variable jump height, coyote time, jump buffer, proper timed dash. Synthesized audio + ambient pad, M to mute.
