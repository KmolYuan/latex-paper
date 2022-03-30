@echo off
setlocal
set CWD=%~dp0
cd %CWD%src
set EN_FONT="Times New Roman"
set ZH_FONT="DFKai-SB"
set MONO_FONT="Consolas"

pandoc -o "../paper.pdf" metadata_ntu.yaml^
    1-intro.md^
    2-conclusion.md^
    refer.md^
    appendix.md^
    --pdf-engine=xelatex^
    --mathjax -N --toc^
    -V papersize=a4^
    -V monofont=%MONO_FONT%^
    -V documentclass=report^
    --filter pandoc-crossref^
    --template=template_ntu.tex^
    --toc-depth=4^
    -V mainfont=%EN_FONT%^
    -V CJKmainfont=%ZH_FONT%^
    -V fontsize=12pt^
    -V geometry:margin=1in^
    --citeproc --bibliography=refer.bib --csl=ieee.csl^
    -M link-citations=true^
    -M linkReferences=true^
    -M nameInLink=true^
    -M autoEqnLabels=true^
    -M watermark=img/watermark-ntu
endlocal
