# AI Content Factory — Landing Page Design Decisions

## Overview

This document records the design decisions made for the AI Content Factory landing page (`index.html`).

## Design System

### Color Palette

| Role | Color | Hex |
|------|-------|-----|
| Background Primary | Deep Navy | `#0a0e1a` |
| Background Secondary | Dark Slate | `#111827` |
| Card Background | Navy Gray | `#1a2236` |
| Accent Primary | Indigo | `#6366f1` |
| Accent Secondary | Purple | `#8b5cf6` |
| Accent Tertiary | Violet | `#a855f7` |
| Text Primary | Near White | `#f8fafc` |
| Text Secondary | Slate Gray | `#94a3b8` |
| Text Muted | Gray | `#64748b` |
| Border | Dark Border | `#1e293b` |
| Success | Emerald | `#10b981` |

**Rationale:** Deep blue/purple tones convey technology, trust, and innovation — ideal for an AI-powered SaaS product. The dark theme feels premium and modern while reducing eye strain.

### Typography

- **Font Family:** Inter (Google Fonts)
- **Fallbacks:** -apple-system, BlinkMacSystemFont, sans-serif
- **Weights Used:** 400 (regular), 500 (medium), 600 (semibold), 700 (bold), 800 (extrabold)

**Rationale:** Inter is optimized for screen readability, clean, professional, and widely recognized in tech. It works well at all sizes from small body text to large display headings.

### Spacing System

- Container max-width: 1200px
- Section padding: 100px vertical
- Card padding: 32px
- Border radius: 8px (sm), 12px (md), 16px (lg), 24px (xl)
- Gap units: 8px base (8, 12, 16, 24, 32, 40, 48, 64, 80)

### Shadows & Effects

- **Card hover shadow:** `0 20px 40px rgba(0, 0, 0, 0.3)`
- **Button glow:** `0 4px 20px rgba(99, 102, 241, 0.4)`
- **Featured card glow:** `0 0 40px rgba(99, 102, 241, 0.2)`
- **Background radial gradient:** `radial-gradient(ellipse at center top, rgba(99, 102, 241, 0.15) 0%, transparent 60%)`

## Page Sections

### 1. Navigation (Sticky)

- Fixed position with blur backdrop
- Logo + nav links + CTA button
- Mobile: hamburger menu hidden (simplified for MVP)

### 2. Hero Section

**Elements:**
- Badge (AI model notification)
- H1 headline with gradient text
- Subtitle paragraph
- Two CTAs (primary: "Start Free Trial", secondary: "See How It Works")
- Three stat boxes (500K+ pieces, 50K+ creators, 4.9/5 rating)

**Design choices:**
- Radial gradient background effect adds depth
- Stats create social proof immediately
- Badge creates urgency (shows latest AI models)

### 3. Features Section (4 Cards)

| Feature | Icon | Description |
|---------|------|-------------|
| AI-Powered Writing | ✍️ | 50+ tone settings, brand voice matching |
| Smart Scheduling | 📅 | Content calendar, auto-post to 20+ platforms |
| Multi-Language | 🔄 | 30+ languages for global reach |
| SEO Optimization | 📊 | Keywords, meta descriptions, readability |

**Card hover effects:** translateY(-4px) + border color change + shadow

### 4. How It Works (3 Steps)

Connected by gradient line (desktop only):
1. Describe Your Content
2. AI Generates Magic
3. Publish & Scale

### 5. Pricing (3 Tiers)

| Tier | Price | Key Limits |
|------|-------|------------|
| Starter | $29/mo | 5K words, 10 types, 3 voices, 5 accounts |
| Professional (Featured) | $99/mo | 50K words, all types, unlimited voices, 20 accounts, API |
| Agency | $299/mo | Unlimited, white-label, dedicated manager |

**Design choices:**
- "Most Popular" badge on Professional tier
- Featured tier has purple glow border
- All features listed with checkmarks
- Stacked layout on mobile (single column)

### 6. FAQ Accordion

5 questions with smooth expand/collapse animation:
- Uses CSS max-height transition for smooth animation
- Plus icon rotates to X on open
- JavaScript handles toggle + smooth close others

### 7. Footer

- Brand logo + tagline
- 3-column link grid (Product, Company, Legal)
- Copyright + social links
- Responsive: stacks on mobile

## Responsive Breakpoints

| Breakpoint | Behavior |
|------------|----------|
| 1200px+ | Full desktop layout |
| 768px-1199px | Features 2-column, steps vertical, pricing stacked |
| 480px-767px | Full mobile, nav links hidden, buttons full-width |

## JavaScript Features

1. **FAQ Accordion** — Click to toggle, smooth animation, one-open-at-a-time
2. **Smooth Scroll** — All anchor links scroll smoothly to sections

## Accessibility Considerations

- Semantic HTML (`<nav>`, `<section>`, `<footer>`, `<button>`)
- Color contrast ratios meet WCAG AA
- Focus states on interactive elements
- `aria-label` on social link icons
- Button and links have clear text

## Future Improvements

- [ ] Add mobile hamburger menu
- [ ] Add testimonial section
- [ ] Add demo video embed
- [ ] Add live chat widget
- [ ] Add trust badges (security certifications)
- [ ] Add case study showcase
- [ ] Add team/company photos section

## Technical Notes

- Single HTML file with embedded CSS and JS (no build step required)
- Google Fonts loaded via `<link>` preconnect for performance
- No external JS dependencies
- CSS custom properties for easy theming
- BEM-like class naming for clarity

---

*Last updated: 2026-03-22*
