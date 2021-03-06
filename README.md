# 簡介

主要連結：

+ Compiler: [Pandoc](https://github.com/jgm/pandoc/releases/)
+ Cross reference filter: [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref/releases/)
+ Markdown Editor: [Typora](https://typora.io/)

Pandoc 流程：Markdown 文件 `.md` 套用 filter 之後，嵌入到 LaTex 模板中成為 `.tex` 檔案，再轉換為 `.pdf`。

LaTex 為一種程式語言，支援標準庫 (Standard Libraries) 和外部程式庫 (External Libraries)，不過與一般程式語言不同的是，它可以直接表述 Tex 排版結構，類似於 PHP 之於 HTML 的概念。但是直接撰寫 LaTex 仍較複雜，因此可以藉由 Markdown 這種輕量的標註式語言先行完成文章，再交由 LaTex 排版。

LaTex 的編譯器 (Compiler) 我們選用 Pandoc（以 Haskell 程式語言實作），而上述的外部程式庫則交由其他程式管理，Ubuntu 採用 TexLive；Windows 採用 MikTex，外部程式庫通常較為龐大，因此建議 Windows 以可攜環境為主。

論文中為求品質會插入向量式圖片，通常以 SVG 為主，才不會有縮放模糊的問題。為處理向量圖檔，Pandoc 使用 RSVG 程式來轉檔，務必安裝。

# Ubuntu

執行腳本：

```bash
./compile.sh
```

## 環境設定

Pandoc 使用 dpkg 安裝；pandoc-crossref 解壓縮後複製到 `/usr/bin` 或是 `${PATH}` 可找到的目錄。

安裝 texlive 與相關字型（Nimbus Roman 對應 Times New Roman，教育部標準楷書對應標楷體）：

```bash
sudo apt install texlive texlive-xetex texlive-lang-chinese gsfonts fonts-moe-standard-kai
```

（可選但不建議）安裝 Microsoft 字型，有可能破壞原本的程式預設字型，建議只在 CI 或 docker 等虛擬環境中安裝。

```bash
sudo apt install ttf-mscorefonts-installer
```

安裝 RSVG-convert：

```bash
sudo apt install librsvg2-bin
```

# Windows

使用 Git Bash 執行腳本，`${PRO}` 為可攜版安裝位置，若無則可忽略。可攜版連接裝置後記得啟動 `miktex-portable.cmd`，使 MikTex 圖示出現在系統通知欄中。

```bash
./compile.sh ${PRO}
# For example
./compile.sh /d/miktex/
```

## 環境設定

建議使用可攜版環境。以下為從頭開始**安裝** / **更新**可攜版環境的步驟。

+ 安裝 [MikTex](http://www.texts.io/support/0002/) (Protable version)
    將安裝檔命名成 `miktex-protable.exe`，執行並安裝到指定目錄中，此目錄即為可攜裝置上的位置，如 `D:\miktex`，以下稱為 `${PRO}`。建議勾選自動安裝（安裝時需聯網）。安裝完後會出現啟動腳本 `miktex-portable.cmd`。
+ Pandoc
    直接下載 Windows 版本的 Zip 發行檔案，解壓縮到 `${PRO}`。
+ pandoc-crossref
    連結在最上方。下載後解壓縮到 `${PRO}`，注意版本是對應 Pandoc。
+ RSVG-convert
    從[此連結](https://sourceforge.net/projects/tumagcc/files/)下載執行檔，解壓縮到 `${PRO}`。

製作完後，此環境大小大約為 1.1GB。

# 檔案架構

```bash
├── compile.sh               # 編譯用腳本
├── .github/workflows
│   └── demo.yaml            # 自動發布 git tag 的 PDF，需要設定 secrets.PUBLISH_TOKEN
└── src
    ├── templates
    │   └── template_*.tex   # 論文模板
    ├── appendix
    │   └── *.md             # 附錄，請手動轉換成 tex 再 include
    ├── img
    │   └── watermark-*.pdf  # 學校提供的浮水印
    │   └── *.*              # 圖片檔案 (png, svg 等)
    ├── *.md                 # 論文檔案
    ├── refer.md             # 「參考文獻」的標題，Markdown 必須
    ├── refer.bib            # BibTex 參考文獻，可以直接使用 Google scholar 提供的
    ├── meta_ntu.yml         # 一些個人資訊以及誌謝、摘要、符號說明
    ├── meta_*.yml           # 用於中英文切換的設定檔案
    └── ieee.csl             # 修改自 IEEE 的引用格式，多支援了混合連續引用
```
