# Indonesia — Story & Level Design 🇮🇩
**Nejc's real journey: rainforest → reef → island crossing → Bali.**

> This is the most ambitious level yet: **four distinct worlds** in one trip,
> including an **underwater chapter** and a **boat ride** — two new ways to play.
> Below is the full story-to-game design, every collectible, asset, and the
> engine work each chapter needs.

---

## THE ARC (4 chapters, one continuous journey)

```
🌴 RAINFOREST ──dive in──▶ 🐠 THE REEF ──surface, board boat──▶ 🚤 THE CROSSING ──arrive──▶ 🛕 BALI ──▶ 💌 postcard
   (platformer)              (swim mode)        (boat / on-rails)            (platformer)
   primates + scuba          sharks, mantas      whale shark, leopard         monkeys, temples,
   gear (the key)            mantis shrimp,       shark, jellyfish lake        mantas, coffee, cacao
                             nudibranch
```

Each chapter is its own biome, mechanic, and mood — but they **connect on-screen**
(you dive off a cliff into the reef; you surface onto a boat; the boat lands in
Bali). The transitions are the magic — the world never "cuts."

---

## CHAPTER 1 — THE RAINFOREST 🌴
*Borneo/Sumatra jungle. Dense canopy, shafts of light, calls everywhere.*

- **Mechanic:** classic platforming — climb the canopy, swing/glide between trees.
- **Power earned:** **Gibbon → "Canopy Swing" (Glide)** — collected mid-chapter,
  used to cross the wide canopy gaps after.
- **The key item:** the final collectible is the **SCUBA GEAR** — once you have it,
  the path leads to a river cliff. You **dive off into the ocean** → Chapter 2.
- **Story role:** arrival in the wild heart of Indonesia; meeting the primates.

**Collectibles (you finalize + write facts):**
| # | Animal | Note | Power? |
|---|---|---|---|
| 1 | **Orangutan** | the icon of Borneo | — |
| 2 | **Gibbon** | the acrobat | **Glide** |
| 3 | **Proboscis Monkey** | the big-nosed one | — |
| 4 | **Hornbill** *(or slow loris)* | optional 4th | — |
| 5 | **Scuba Gear** 🤿 | the key — ends the chapter, opens the dive | *unlocks Ch.2* |

**Transition out:** stand at the river cliff with scuba gear → press down/jump →
a dive animation → screen fades through the water surface into the reef.

---

## CHAPTER 2 — THE REEF 🐠  *(NEW: swim mode)*
*Underwater. Blue light, drifting particles, coral walls.*

- **Mechanic (NEW):** **free swimming** — no gravity; move in all directions,
  gentle buoyancy/drift. Explore a reef vertically and horizontally.
- **Power (optional):** **Fins → underwater dash** for a burst.
- **Mood:** calm, weightless, wondrous. Bubbles instead of fireflies. Caustic
  light ripples. Deep-blue signature hue.
- **Story role:** the silent alien world beneath the surface.

**Collectibles:**
| # | Animal | Note |
|---|---|---|
| 1 | **Grey Reef Shark** | the patrol of the reef |
| 2 | **Manta Ray** | the gentle giant |
| 3 | **Mantis Shrimp** | the punch / the eyes |
| 4 | **Nudibranch** | the tiny jewel |
| 5 | **Green Turtle** *(optional)* | a calm companion |

**Transition out:** swim up to a light at the surface → climb onto a wooden boat → Chapter 3.

---

## CHAPTER 3 — THE CROSSING 🚤  *(NEW: boat ride)*
*Crossing the open sea between islands, sites passing by.*

- **Mechanic (NEW):** a gentle **on-rails boat ride** (auto-moves). You walk the
  deck; at each island you **look over the side** and a creature is revealed below.
  Low-pressure, story-forward — a breather between the two big chapters.
- **Mood:** sun, open water, anticipation. Birds overhead, islands sliding past.
- **Story role:** the famous Indonesian dive sites, strung together as your route.

**Stops / Collectibles (each tied to a real place):**
| # | Place | Animal |
|---|---|---|
| 1 | **Bagan fishing platforms** *(confirm: Cenderawasih / Saleh Bay)* | **Whale Shark** |
| 2 | **Sangalaki Island** (Derawan) | **Leopard Shark** |
| 3 | **Kakaban Island** | **Jellyfish Lake** (stingless jellyfish) |

**Transition out:** the boat lands on a Balinese beach → Chapter 4.

---

## CHAPTER 4 — BALI 🛕
*Return to land. Temples, terraces, monkeys, the sweet things.*

- **Mechanic:** platforming through temples and rice terraces (the original Bali
  design from the production kit).
- **Power:** **Double Jump** on a temple climb, if we want a rare high path.
- **Mood:** warm temple gold, offerings, sunset. The journey winds down.
- **Story role:** the gentle, human end of the trip — and a manta callback.

**Collectibles:**
| # | Subject | Note |
|---|---|---|
| 1 | **Macaque** | Ubud Monkey Forest |
| 2 | **Temple** | Tanah Lot / Uluwatu / Besakih — your pick |
| 3 | **Manta Ray** (Nusa Penida) | a callback to the reef — "I saw them again" |
| 4 | **Luwak Coffee** | the coffee story |
| 5 | **Cacao / Chocolate** | Bali's cacao |

**Ending:** walk to a vista (rice terrace at sunset / clifftop temple) → the
**postcard**, written from Bali, closing the whole Indonesian journey.

---

## NEW ENGINE WORK THIS LEVEL NEEDS

This is why Indonesia is a milestone — it adds two new ways to play:

1. **Swim mode (Chapter 2)** — gravity off, 8-direction movement, buoyancy,
   bubble particles, caustic light, blue grade. A self-contained physics mode the
   game switches into for underwater chapters. *Reusable for any future dive level.*
2. **Boat / on-rails mode (Chapter 3)** — camera auto-advances, player walks a
   moving deck, "look over the side" reveals. Lighter to build.
3. **Per-chapter backgrounds** — four biomes means the renderer must **swap the
   background set per chapter** (jungle → reef → ocean → Bali). I'll extend the
   layer loader to support chapter zones with a soft cross-fade.

These are real additions but each is self-contained; I'll build them one chapter
at a time so we always have something playable.

---

## ASSET COUNT (the whole Indonesia journey)

Backgrounds are now **per chapter** (4 sets). Characters (Tian/Tibor) are shared.

| Category | Per chapter | × chapters | Total |
|---|---|---|---|
| Background layers | ~5 (sky/far/mid/near/foreground; reef swaps for water) | ×4 | **~20** |
| Ground / terrain pieces | ~3 | ×4 (reef uses coral, boat uses deck) | **~10** |
| Collectible art (or photos) | 4–5 | ×4 | **~18** |
| Ambient life | 1–2 | ×4 | **~6** |
| FX | bubbles, caustics, light rays, petals | — | **~4** |
| Postcard photo | — | — | **1** (Bali) |
| Audio loops | jungle / underwater / ocean / Bali | — | **4** |

**Rough total: ~55 visual assets + 4 audio + ~18 story/fact texts.**
Big — but spread across four chapters built in sequence, and many can be **your
real photos** instead of painted plates.

> **Reality check:** this is ~3× a normal level. Recommend building it **chapter by
> chapter as four connected sub-levels**, shipping each as it's done, rather than
> all at once. Chapter 1 (jungle) reuses the engine we already have.

---

## PHOTOS YOU NEED
- **Essential:** the Bali **postcard** photo (you, at the closing vista).
- **Wonderful if you have them** (use as collectible photos): orangutan, gibbon,
  the reef sharks/mantas/mantis shrimp/nudibranch, whale shark at the bagan,
  leopard shark, jellyfish lake, Bali temples/monkeys/coffee/cacao.
- **Reference shots** of each biome to guide the painted backgrounds.

---

## WHAT I NEED FROM YOU TO START BUILDING

1. **Finalize the animal list** per chapter (add/remove; you mentioned "some
   others" — name them).
2. **Write the facts** for each collectible (you said you'll find the info).
3. **Write 1 short story caption per chapter section** (your voice) + the
   **postcard message**.
4. **Confirm the route geography** (esp. the bagan whale-shark location, and which
   Bali temple).

Then I build **Chapter 1 (the rainforest)** first with the engine we have, wire in
your collectibles + captions, and we expand into swim mode and the boat from there.

---

## BUILD ORDER (phased)
1. **Ch.1 Rainforest** — existing engine; gibbon→glide; scuba-gear key; dive transition.
2. **Swim mode** + **Ch.2 Reef**.
3. **Boat mode** + **Ch.3 Crossing**.
4. **Ch.4 Bali** + final postcard.
5. Per-chapter audio + ambient life + polish.
