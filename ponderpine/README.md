# BZB Music — Ponder & Pine Landing

A tiny static site that links to BZB Music profiles (Spotify, Apple Music, TikTok, Instagram, YouTube, Bandcamp) with an earthy pine / twilight theme.

## Quick Start
1. **Edit links** in `index.html` (Spotify is prefilled; update the rest).
2. **Images** live in `images/`:
   - `banner.jpg` — the Ponder & Pine banner shown under the main title
   - `brain-logo.svg` — top-left logo that links to ben.musser.com
3. Commit & push to GitHub; Netlify will deploy automatically (if connected).

## Local Preview
Open `index.html` directly in a browser **or** run a small server:
```bash
python3 -m http.server 8080
```
Visit `http://localhost:8080`.

## Deploy (Netlify)
- **Publish directory:** `/` (repo root that contains `index.html`)
- **First deploy → Domain management**
  - Add `bzbmusic.com` (apex) and `www.bzbmusic.com`
  - In GoDaddy, add the records Netlify shows (A records for apex, CNAME for `www`)
  - Back in Netlify: **Verify → Provision certificate → set `www` as Primary** (redirect apex → `www`)

## Project Structure
```
/
├── index.html
├── style.css
└── images/
    ├── banner.jpg
    └── brain-logo.svg
```

## Customize Styles
Edit CSS tokens at the top of `style.css` (under `:root`) to tweak colors:
```css
:root {
  --bg-start: #0b1630; /* twilight blue */
  --bg-end:   #08111f; /* night blue */
  --text:     #EAF1F7; /* starlight */
  --pine-600: #145341; /* pine */
  /* ... */
}
```

## Troubleshooting Images
- Paths are **case-sensitive** on Netlify. `images/banner.jpg` ≠ `Images/Banner.JPG`.
- Ensure the file exists in the published folder (same folder where `index.html` lives).
- You can verify by opening `https://YOUR-SITE.netlify.app/images/banner.jpg`.
- After renaming/moving images, use **Deploys → Clear cache and deploy site** in Netlify.

## License
Private (© Ben Musser). Change to MIT if you decide to open source.
