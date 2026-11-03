#!/usr/bin/env bash
# Downloads the client logos from Wikimedia Commons into assets/logos/ so the site
# does not depend on external hosting. Run once from the repo root, then commit.
set -e
mkdir -p assets/logos && cd assets/logos
UA="cv-site-logo-fetch/1.0"
curl -sfL -A "$UA" -o eea.svg      "https://upload.wikimedia.org/wikipedia/commons/6/6d/Logo_of_the_European_Environment_Agency.svg"
curl -sfL -A "$UA" -o euspa.svg    "https://upload.wikimedia.org/wikipedia/commons/c/c3/EUSPA_Logo.svg"
curl -sfL -A "$UA" -o ec.svg       "https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_of_the_European_Commission_%282025%2C_English%2C_horizontal%29.svg"
curl -sfL -A "$UA" -o jrc.svg      "https://upload.wikimedia.org/wikipedia/commons/c/cd/Joint_Research_Centre_%28JRC%29.svg"
curl -sfL -A "$UA" -o op.svg       "https://upload.wikimedia.org/wikipedia/commons/d/de/EU_Publications_Office_logo.svg"
curl -sfL -A "$UA" -o eurostat.png "https://upload.wikimedia.org/wikipedia/commons/f/f6/Eurostat_Newlogo.png"
curl -sfL -A "$UA" -o eu-osha.png  "https://upload.wikimedia.org/wikipedia/commons/d/d2/EU-OSHA_Logo.png"
ls -la
cd assets/logos 2>/dev/null || true
curl -sfL -A "cv-site-logo-fetch/1.0" -o cdmx.svg    "https://upload.wikimedia.org/wikipedia/commons/4/44/Gobierno_de_la_Ciudad_de_M%C3%A9xico_%282024-2030%29.svg"
curl -sfL -A "cv-site-logo-fetch/1.0" -o navarra.svg "https://upload.wikimedia.org/wikipedia/commons/a/a4/Logotipo_del_Gobierno_de_Navarra.svg"
curl -sfL -A "cv-site-logo-fetch/1.0" -o bizkaia.png "https://upload.wikimedia.org/wikipedia/commons/b/b5/BFAikurra.png"
