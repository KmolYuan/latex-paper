#!/usr/bin/env bash

BASEDIR="$(dirname "${0}")"
cd "${BASEDIR}/src" || exit
EN_FONT="Nimbus Roman"
ZH_FONT="MoeStandardKai.ttf"
MONO_FONT="DejaVu Sans Mono"

pandoc -o "../paper.pdf" metadata.yaml \
    "1-intro.md" \
    "2-section.md" \
    refer.md \
    appendix.md \
    --pdf-engine=xelatex \
    --mathjax -N --toc \
    -V papersize=a4 \
    -V monofont="${MONO_FONT}" \
    -V documentclass=report \
    --filter pandoc-crossref \
    --template=template.tex \
    --citeproc --bibliography=refer.bib --csl=ieee.csl \
    --toc-depth=4 \
    -V mainfont="${EN_FONT}" \
    -V CJKmainfont="${ZH_FONT}" \
    -V fontsize=12pt \
    -V geometry:margin=1in \
    -M link-citations=true \
    -M linkReferences=true \
    -M nameInLink=true \
    -M autoEqnLabels=true \
    -M watermark=img/watermark
