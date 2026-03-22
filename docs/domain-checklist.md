# Domain Registration Checklist — AI Content Factory

---

## Part 1: Pre-Registration Checklist

- [ ] **Define primary brand name** — Confirm "AI Content Factory" as official project name
- [ ] **Finalize domain list** — Decide which 5 domains to register (see domain-request.md)
- [ ] **Check domain availability** — Use WHOIS / registrars to verify availability for all 5
- [ ] **Research domain history** — Avoid domains with spam/backlink history (use Wayback Machine, MOZ)
- [ ] **Verify trademark conflicts** — Search USPTO / local trademark database to avoid legal issues
- [ ] **Set budget** — Allocate $35–$80 USD for first-year registration across desired domains
- [ ] **Choose registrar** — Compare registrars below; select one that fits price + privacy needs
- [ ] **Prepare account** — Create account with chosen registrar before prices change
- [ ] **Enable auto-renew** — Prevent accidental expiration; set renewal reminder 30 days before expiry
- [ ] **Prepare payment method** — Credit card or PayPal; check for first-time discount codes

---

## Part 2: Post-Registration Checklist

### DNS Configuration

- [ ] **Set A record** — `@` → `76.76.21.21` (Vercel load balancer IP)
- [ ] **Set CNAME record** — `www` → `cname.vercel-dns.com`
- [ ] **Add TXT record** — `@` → `vercel-domain-verification=xxxxxx` (from Vercel dashboard)
- [ ] **Configure subdomains** — Set up any additional subdomains (blog., api., app.)
- [ ] **Set TTL to 3600** — Reasonable TTL for normal operations (adjust for changes)
- [ ] **Wait for DNS propagation** — Allow up to 24–48 hours; verify with `dig` or `nslookup`

### SSL / HTTPS

- [ ] **Enable auto-HTTPS** — Vercel provides free SSL automatically; verify in project settings
- [ ] **Force HTTPS redirect** — Ensure HTTP → HTTPS redirect is enabled
- [ ] **Check SSL certificate** — Visit `https://aicontentfactory.com` and confirm padlock icon
- [ ] **Renewal monitoring** — Let's Encrypt auto-renews; confirm renewal is configured

### Contact & WHOIS Information

- [ ] **Enable WHOIS privacy** — Use registrars that offer free privacy protection (redact personal info)
- [ ] **Verify contact email** — Confirm 81028360@xyz is listed as administrative contact
- [ ] **Update registrant info** — Ensure legal name / organization is correct for ownership claims
- [ ] **Add secondary contact** — Add backup email in case primary becomes inaccessible

### Registrar-Specific Setup

- [ ] **Enable two-factor authentication (2FA)** — Secure registrar account immediately
- [ ] **Review auto-renewal settings** — Confirm renewal is on; note renewal price
- [ ] **Save registrar receipt/invoice** — Keep for accounting and domain ownership proof
- [ ] **Set domain lock** — Enable " registrar lock" to prevent unauthorized transfers
- [ ] **Update nameservers if needed** — If using Cloudflare, update nameservers per Cloudflare instructions

### Brand & SEO

- [ ] **Submit to Google Search Console** — Add domain property, verify ownership, submit sitemap
- [ ] **Set canonical URL** — Ensure all pages use consistent canonical (www or non-www, pick one)
- [ ] **Configure 301 redirects** — Redirect all secondary domains to primary domain
- [ ] **Create robots.txt** — Allow crawlers; disallow admin/private paths
- [ ] **Set up custom email** — Consider Google Workspace or Proton Mail for @aicontentfactory.com emails

---

## Part 3: Registrar Comparison

| Feature | Namecheap | GoDaddy | Cloudflare Registrar | Hover |
|---------|-----------|---------|---------------------|-------|
| **Price transparency** | ✅ Clear pricing | ⚠️ Hidden fees | ✅ Transparent | ✅ Transparent |
| **.com first year** | ~$12 | ~$15 | ~$8.57 | ~$12 |
| **.com renewal** | ~$15 | ~$20+ | ~$8.57 | ~$15 |
| **WHOIS privacy** | Free | Extra cost | Free | Free |
| **2FA support** | ✅ | ✅ | ✅ | ✅ |
| **Domain lock** | ✅ | ✅ | ✅ | ✅ |
| **Interface ease** | ✅ Easy | ⚠️ Aggressive upsells | ✅ Clean | ✅ Clean |
| **Bulk discount** | ✅ | ✅ (but pricey) | ✅ Basic | ✅ |
| **Recommended use** | **Primary choice** | ❌ Not recommended | **Best for .io/.app** | Good alternative |
| **Transfer policy** | Standard | ⚠️ High unlock fees | Easy out | Standard |

### Recommendation

- **Primary domains (.com):** Use **Namecheap** — transparent pricing, free WHOIS privacy, no hidden renewal hikes
- **.io / .app / alternative TLDs:** Use **Cloudflare Registrar** — lowest prices, free privacy, simple interface
- **Avoid GoDaddy** — high renewal fees, aggressive upselling, poor value

---

## Part 4: Estimated Cost Table

| Item | Registrar | Year 1 | Year 2 | Notes |
|------|-----------|--------|--------|-------|
| aicontentfactory.com | Namecheap | ~$12 | ~$15 | Primary domain |
| aifact.co | Namecheap | ~$25 | ~$30 | Brand protection + social |
| aigenstudio.com | Namecheap | ~$12 | ~$15 | Defensive registration |
| contentai.io | Cloudflare | ~$8.57 | ~$8.57 | Low-cost alternative TLD |
| WHOIS Privacy (all) | Included | Free | Free | Namecheap/Cloudflare |
| **Total** | | **~$57** | **~$69** | |

### Optional / Premium Costs

| Item | Estimated Cost | Notes |
|------|---------------|-------|
| Premium/squat domain buyout | $100 – $5,000+ | If primary is taken |
| Google Workspace (email) | $6/user/month | Custom email @aicontentfactory.com |
| Domain appraisal | $0 – $50 | Optional for premium domains |
| Legal / trademark filing | $250 – $1,000 | If brand is contested |

---

*Last updated: 2026-03-22 — AI Content Factory*
