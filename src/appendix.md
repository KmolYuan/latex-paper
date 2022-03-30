\appendix
\newcounter{appendix_counter}
\setcounter{appendix_counter}{1}
\renewcommand{\thechapter}{附錄\zhnum{appendix_counter}}
\renewcommand{\thesection}{\arabic{appendix_counter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{appendix_counter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\figurename}{附圖}
\renewcommand{\tablename}{附表}
\captionsetup[figure]{list=no}
# 我的附錄

我的附錄，引用[附圖 @fig:appendix-img]。

![Ubuntu Logo](img/ubuntu-icon.svg){#fig:appendix-img width=50%}
