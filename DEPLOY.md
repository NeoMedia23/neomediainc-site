# Deploying neomediainc.com (GitHub Pages)

This is a plain static site — no build step. It deploys exactly the way
`flatout-legal` (flatoutapp.app) already does: a GitHub repo under **NeoMedia23**,
served by GitHub Pages, pointed at your domain by the `CNAME` file in this folder.

You're signed in to GitHub as **NeoMedia23** via the `gh` tool, so publishing is
one command. **Nothing is public until you run it.**

---

## Step 1 — Publish (makes the repo + turns on Pages)

From this folder, run:

```bash
./deploy.sh
```

That creates a public repo `NeoMedia23/neomediainc-site`, pushes these files, and
switches on GitHub Pages (serving `main` branch, root). GitHub reads the `CNAME`
file and sets the custom domain to `neomediainc.com` automatically.

(Or tell Claude "go ahead and deploy" and it will run this for you.)

---

## Step 2 — Point the domain (Namecheap DNS)

In Namecheap → Domain List → `neomediainc.com` → **Manage** → **Advanced DNS**,
set these records (delete any conflicting parking/@ records first):

| Type  | Host | Value                     | TTL       |
|-------|------|---------------------------|-----------|
| A     | @    | 185.199.108.153           | Automatic |
| A     | @    | 185.199.109.153           | Automatic |
| A     | @    | 185.199.110.153           | Automatic |
| A     | @    | 185.199.111.153           | Automatic |
| CNAME | www  | neomedia23.github.io.     | Automatic |

DNS can take anywhere from a few minutes to a few hours to take effect.

---

## Step 3 — Turn on HTTPS

Once DNS resolves: GitHub → the repo → **Settings → Pages**. You should see
"Your site is live at https://neomediainc.com". Tick **Enforce HTTPS**
(may take a little while to become available while GitHub issues the certificate).

---

## Verify (the way Apple will)

- Open **https://neomediainc.com** from your phone on cellular data (not your
  home Wi-Fi) — Apple checks the site from outside your network.
- Check the footer links **Privacy** and **Support** both load.

## Before you submit the app to Apple
Add real portfolio photos first (see `photos/README.txt`). Empty frames read as
"minimal content," which Apple rejects for developer enrollment.

## Updating the site later
Edit files here, then:
```bash
git add -A && git commit -m "Update site" && git push
```
The live site updates within a minute or two.
