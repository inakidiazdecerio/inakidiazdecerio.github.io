#!/usr/bin/env python3
"""Embed i18n/es.json into index.html (between the i18n-es script tags).
Edit English text in index.html and Spanish in i18n/es.json, then run: python3 build.py"""
import json, re
from bs4 import BeautifulSoup, Comment
h = open('index.html', encoding='utf-8').read()
es = json.load(open('i18n/es.json', encoding='utf-8'))
blob = json.dumps(es, ensure_ascii=False).replace('</', '<\\/')
h = re.sub(r'(<script type="application/json" id="i18n-es">).*?(</script>)', lambda m: m.group(1) + blob + m.group(2), h, flags=re.S)
h = h.replace('__I18N__', blob)
open('index.html', 'w', encoding='utf-8').write(h)
s = BeautifulSoup(h, 'html.parser'); miss = set()
for t in s.find_all(string=True):
    if isinstance(t, Comment) or t.parent.name in ('script', 'style'): continue
    x = t.strip()
    if x and any(c.isalpha() for c in x) and x not in es: miss.add(x)
print('index.html updated. Kept in English (names/tech terms):', len(miss))
