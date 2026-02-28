# Hero Section Inspiration

Research for the Brilliant Fantastic hero section. The goal: something unlike any serious tech company, but grounded in the brilliant/fantastic duality. Looking outside tech for direction.

---

## The Big Idea

The best non-tech hero sections share one trait: **they refuse to be "just websites."** They're places, artifacts, experiences. The forgettable zone is "competent but safe." The memorable ones are either maximally restrained or maximally immersive -- no middle ground.

For BF, the dual-personality theme system is already the most interesting thing about the site. The hero should make that transformation the centerpiece.

---

## 1. Album Covers & Music Sites

### Tyler, the Creator -- Chromakopia
**URL:** https://www.chromakopia.com/
- Bold forest green background, zero visual clutter
- Modified Poleno SemiBold with custom "horns" on first/last letters
- Hover states invert colors (black bg with green text)
- Navigation fixed bottom-right (unconventional)
- **Takeaway:** A single bold color choice + custom type modification = instant identity

### Gorillaz -- Kong Studios
**URL:** https://gorillaz.com/
- The website IS a place -- characters greet you, you explore rooms
- Jamie Hewlett's illustration style permeates every pixel
- Kong Card provides personalized avatar from original art
- Gamification (Kong Racers) makes the site a destination, not a billboard
- **Takeaway:** World-building over page-building. The site is an extension of the creative universe, not separate from it

### Kendrick Lamar -- GNX
**URL:** https://my-gnx.com/
- The entire page is a single iframe to streaming links. That's it.
- Zero advance promotion, zero design -- the refusal to design IS the design
- **Takeaway:** Anti-design as power move. Confidence that the work speaks for itself

### Beyonce
**URL:** https://www.beyonce.com/
- Dark theme as canvas -- near-black background makes every photo feel exhibited
- Cowboy Carter typography: Egiziano Black, a recreation of an 1815 letterset
- **Takeaway:** Historical type references embedded in modern design. Dark backgrounds = gallery lighting

### Radiohead -- Kid A Mnesia Exhibition
**URL:** https://kida-mnesia.com/
- Free downloadable 3D art installation, not a website
- The Public Library treats decades of web presence as archive, not storefront
- **Takeaway:** The website as art object. Anti-commercial, pure expression

---

## 2. Fashion & Editorial

### Rick Owens
**URL:** https://www.rickowens.eu/
- Full-width banners that **blur at 6.1px on hover** -- you pause, engage, let the image resolve
- Header uses `mix-blend-mode: difference`, dynamically inverting against content
- Pure black, white, neutral grays only
- **Takeaway:** A single CSS interaction (blur on hover) transforms browsing into something cinematic. The web IS the runway

### Maison Margiela
**URL:** https://www.maisonmargiela.com/
- Identity built on the numbering system (0-23) -- both archive and manifesto
- Stitches "designed to be easily unpicked, rendering the item unidentifiable"
- **Takeaway:** Intentional absence as luxury. Strip away expected signifiers

### Jacquemus
**URL:** https://www.jacquemus.com/
- Futura as personality carrier -- geometric modernist meets Mediterranean warmth
- Awarded Awwwards Site of the Day
- **Takeaway:** One carefully chosen typeface does more for identity than any amount of imagery

### Vogue
**URL:** https://www.vogue.com/
- Nav vanishes on scroll-down, reappears on scroll-up -- content owns the screen
- Creates "a feeling of exclusive access" through imagery-first design
- **Takeaway:** Disappearing UI. Let the content breathe

### Dazed Digital & The Face
- **Dazed:** Modular grid system mirroring the print magazine. Editors reconfigure the homepage like laying out physical pages
- **The Face:** Three custom headline typefaces (Nice Face, Cool Face, Epic Face) by Jacob Wise. Each article gets a different typographic personality while staying on-brand
- **Takeaway:** Print-to-web parity. Custom type families give editorial range without losing identity

---

## 3. Artists & Galleries

### Studio Olafur Eliasson
**URL:** https://olafureliasson.net/
- "Your Uncertain Archive": a WebGL artwork that IS the homepage
- Users browse in "Drift" mode, following associations. Four years in development
- **Takeaway:** The homepage as explorable art piece, not page

### teamLab
**URL:** https://www.teamlab.art/
- The installations are so spectacular that the site just needs to showcase them at max fidelity
- "ON VIEW" / "PERMANENT" status labels create urgency
- **Takeaway:** When the work is strong enough, minimalism is the correct design choice

### &Walsh (Jessica Walsh)
**URL:** https://andwalsh.com/
- The ampersand animates (rotation + scale) -- the brand mark IS the interaction
- Custom SVG cursor (circular crosshair) signals "this is a designed experience"
- Near-black background (#060509)
- **Takeaway:** Animate the logo/brand mark itself. Custom cursor as statement

### Gagosian
**URL:** https://gagosian.com/
- Dark backgrounds make each artwork feel museum-lit
- Generous whitespace mimics walking through gallery spaces
- **Takeaway:** Dark palette as gallery walls. Space = reverence

---

## 4. Film & Entertainment

### A24 Promotional Sites
The gold standard for "the website is a fiction":

- **Bugonia** (humanresistancehq.com): Deliberately lo-fi 1990s conspiracy site. Hidden coordinates for fan screenings. The low-tech aesthetic IS the point
- **Materialists** (menofny.com): NYSE ticker simulation displaying bachelors' "romantic value." Went viral because users experience the film's premise firsthand
- **The Drama**: Countdown site presented as a fictional relationship milestone

**Takeaway:** In-universe world-building. The marketing site pretends it isn't one

### Sundance Film Festival
**URL:** https://www.sundance.org/
- Logo functions as a 16:9 viewfinder frame overlaid on footage
- Every image becomes a cinematic moment through framing
- **Takeaway:** The logo AS a compositional device, not just an identifier

---

## 5. Techniques That Work

### Video Heroes
- **Premium vs cheap:** Slow deliberate pacing, seamless loops (10-30s), proper color grading, silence
- **Cinemagraphs** outperform full video for elegance -- mostly still with one subtle element moving
- File size: 2-5 MB ideal, use poster image during load
- Format: MP4 (H.264) + WebM fallback

### Typography as Hero
- **Viewport-filling scale** -- at large enough sizes, letters become abstract shapes
- **Kinetic deformation** -- letters shape-shift on hover/scroll (DEMO Festival, Safari Riot)
- **Interactive distortion** -- cursor-reactive type (Marx Design, Redo Bureau)
- **GSAP SplitText** is the dominant tool for character-level animation
- **Variable fonts** enable weight/width animation from a single file

### Interactive/Generative
- **Bruno Simon** (bruno-simon.com): Physics-based 3D toy truck navigation. The portfolio IS a game
- **Species in Pieces** (species-in-pieces.com): 30 endangered animals from pure CSS clip-path polygons. No canvas, no WebGL
- **Bon Iver Viisualiizer**: GLSL shader converts everything into a matrix of the letter "i". Constraint becomes creative engine
- **Codrops** (tympanus.net/codrops): 1,000+ open-source demos for Three.js, particles, scroll, typography

### The "WTF" Factor
Bold choices work when:
1. Confusion is brief (under 3 seconds)
2. There's a reward for figuring it out
3. The unconventional element IS the message
4. A clear fallback exists (scroll down = traditional content)

---

## 6. Dual Personality / Mode-Switching

This is the most directly relevant category. True dual-personality sites beyond light/dark are **rare**, which makes the concept inherently novel.

### Key References

- **Yalamps** (yalamps.com): Illustrated landscape transforms from daytime to Van Gogh-esque starlit night. Closest analog to brilliant/fantastic. Three.js + GSAP
- **Takuya Oshima**: Dark mode reveals "ethereal glowing flowers." Light mode shows "scattered dots." Completely different visual language per mode
- **Kevin Hilgendorf**: 3D sculptural form appears dark in light mode, glows in dark mode -- visual inversion of the same element
- **Blck Creative Studio**: "Turn off the lights" toggle swaps light portraits for dramatic shadow versions. Content changes, not just wrapper colors
- **Pizza Punk**: Animated dot patterns only exist in dark mode -- animation exclusive to one personality

### Why Dual-Personality Works

1. **The transformation IS the feature**, not an accommodation
2. **Content participates** in the switch, not just chrome
3. Each mode has **its own internal logic** -- not one mode with another bolted on
4. **The transition is choreographed** with easing, staged reveals, particles
5. The two modes express **different emotional registers**

---

## 7. What's Fresh vs Played Out (2025-2026)

### Fresh
- **Typography as hero** -- large expressive fonts as primary visual element
- **Anti-design / tactile rebellion** -- imperfection, lo-fi, hand-made feel
- **Immersive world-building** over landing pages
- **Expressive minimalism** -- clean but with personality (Rick Owens' blur, &Walsh's animated &)
- **Editorial composition** -- asymmetric grids, cinematic framing from print
- **Scroll-triggered storytelling** as brand identity

### Played Out
- Cluttered hero sections with multiple CTAs and busy video
- Generic stock photography
- Heavy parallax for its own sake
- Center-aligned safe layouts
- Clever-but-vague wordplay headlines
- Over-polished AI perfection (backlash toward honest imperfection)

---

## 8. Directions for Brilliant Fantastic

Based on all this research, here are potential directions:

### Direction A: The Transformation IS the Hero
Make the theme toggle the centerpiece. The hero is relatively simple -- large "Brilliant Fantastic" typography -- but switching themes triggers a dramatic, choreographed transformation. Brilliant: measured, editorial, clean type. Fantastic: the same words gain kinetic energy, distortion, particle effects. **The surprise is the switch.**

### Direction B: Full-Bleed Visual (Video or Cinemagraph)
A carefully art-directed hero image/video that communicates creative energy. Brilliant mode: clean, high-contrast editorial photography (think Gagosian gallery lighting). Fantastic mode: the same imagery transformed -- colorized, distorted, collaged, or overlaid with generative effects.

### Direction C: Typography as Art Object
"Brilliant Fantastic" rendered at massive scale where the letterforms become abstract visual elements. OmnesPro and Okkult are both distinctive display faces. At hero scale, they could fill the viewport. Brilliant: perfectly set, measured, perhaps with subtle construction lines. Fantastic: the Okkult blackletter animated, deformed, alive.

### Direction D: Interactive/Generative Canvas
A generative artwork behind the hero text that responds to mouse/scroll. Brilliant: geometric, precise, blueprint-like constructions. Fantastic: organic, particle-based, noisy, colorful. Think Species in Pieces meets the dual-personality system.

### Direction E: The World-Building Approach
Don't make a hero section -- make a *place*. Like Gorillaz Kong Studios or A24's in-universe sites. The homepage is an environment that changes personality with the toggle. This is the most ambitious but also the most memorable.

### Direction F: The Anti-Hero
Take the Kendrick approach. No hero at all. Just the name, the toggle, and then straight into content. Let the work speak. The surprise is the lack of spectacle (until you hit the toggle and the world transforms).

---

## Reference URLs (Quick Access)

| Site | URL | Why It Matters |
|------|-----|----------------|
| Chromakopia | chromakopia.com | Bold color + custom type |
| Gorillaz | gorillaz.com | World-building |
| Rick Owens | rickowens.eu | Blur-on-hover, blend modes |
| &Walsh | andwalsh.com | Animated brand mark |
| Yalamps | yalamps.com | Dual-mode illustrated landscape |
| Bruno Simon | bruno-simon.com | Gamified WebGL portfolio |
| Species in Pieces | species-in-pieces.com | Pure CSS generative art |
| Bon Iver Viisualiizer | boniver.withspotify.com | Constraint as creative engine |
| A24 Bugonia | humanresistancehq.com | In-universe fiction |
| Sundance | sundance.org | Logo as compositional device |
| Obys Agency | obys.agency | Typography as identity |
| teamLab | teamlab.art | Minimal UI, max imagery |
| Gagosian | gagosian.com | Dark palette as gallery |
| Locomotive | locomotive.ca | Controlled scroll-jacking |
| Codrops | tympanus.net/codrops | 1,000+ open-source demos |
