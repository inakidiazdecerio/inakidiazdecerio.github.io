#!/usr/bin/env python3
"""Embed i18n/es.json and i18n/eu.json into index.html.
English text lives in index.html; translations in i18n/<lang>.json. Run: python3 build.py"""
import json, re
from bs4 import BeautifulSoup, Comment
h = open('index.html', encoding='utf-8').read()
for lang in ('es', 'eu'):
    d = json.load(open(f'i18n/{lang}.json', encoding='utf-8'))
    blob = json.dumps(d, ensure_ascii=False).replace('</', '<\\/')
    h = h.replace(f'__I18N_{lang.upper()}__', blob)
    h = re.sub(rf'(<script type="application/json" id="i18n-{lang}">).*?(</script>)', lambda m: m.group(1) + blob + m.group(2), h, flags=re.S)
open('index.html', 'w', encoding='utf-8').write(h)
es = json.load(open('i18n/es.json', encoding='utf-8')); eu = json.load(open('i18n/eu.json', encoding='utf-8'))
print('keys es/eu:', len(es), len(eu), 'missing in eu:', [k for k in es if k not in eu][:5])
