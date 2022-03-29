#!/usr/bin/env bash

BASEDIR="$(dirname "${0}")"
cd "${BASEDIR}/src" || exit

EN_FONT="Nimbus Roman"
ZH_FONT="MoeStandardKai.ttf"
MONO_FONT="DejaVu Sans Mono"

pandoc -o "../report.pdf" meta_zh.yml meta_ntu.yml \
    intro.md \
    conclusion.md \
    --pdf-engine=xelatex \
    --mathjax -N --toc \
    -V papersize=a4 \
    -V monofont="${MONO_FONT}" \
    -V documentclass=report \
    --filter pandoc-crossref \
    --template=templates/template_ntu.tex \
    --toc-depth=4 \
    -V mainfont="${EN_FONT}" \
    -V CJKmainfont="${ZH_FONT}" \
    -V fontsize=12pt \
    -V geometry:margin=1in \
    --citeproc --bibliography=refer.bib --csl=ieee.csl \
    -M link-citations=true \
    -M linkReferences=true \
    -M nameInLink=true \
    -M autoEqnLabels=true \
    -M watermark=img/watermark-ntu
