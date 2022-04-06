@echo off
setlocal
set CWD=%~dp0
cd %CWD%src
set EN_FONT="Times New Roman"
set ZH_FONT="DFKai-SB"
set MONO_FONT="Consolas"

pandoc -o "../paper.pdf" metadata.yaml^
    "1-intro.md"^
    "2-section.md"^
    refer.md^
    appendix.md^
    --pdf-engine=xelatex^
    --mathjax -N --toc^
    -V papersize=a4^
    -V monofont=%MONO_FONT%^
    -V documentclass=report^
    --filter pandoc-crossref^
    --template=template.tex^
    --citeproc --bibliography=refer.bib --csl=ieee.csl^
    --toc-depth=4^
    -V mainfont=%EN_FONT%^
    -V CJKmainfont=%ZH_FONT%^
    -V fontsize=12pt^
    -V geometry:margin=1in^
    -M link-citations=true^
    -M linkReferences=true^
    -M nameInLink=true^
    -M autoEqnLabels=true^
    -M watermark=img/watermark
endlocal
