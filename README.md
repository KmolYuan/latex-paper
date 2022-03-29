# 簡介

主要連結：

+ Compiler: [Pandoc](https://github.com/jgm/pandoc/releases/)
+ Cross reference filter: [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref/releases/)
+ Markdown Live Editor: [Typora](https://typora.io/)

Pandoc 流程：Markdown 文件 `.md` 套用 filter 之後，嵌入到 LaTex 模板中成為 `.tex` 檔案，再轉換為 `.pdf`。

LaTex 為一種程式語言，支援標準庫 (Standard Libraries) 和外部程式庫 (External Libraries)，不過與一般程式語言不同的是，它可以直接表述 Tex 排版結構，類似於 PHP 之於 HTML 的概念。但是直接撰寫 LaTex 仍較複雜，因此可以藉由 Markdown 這種輕量的標註式語言先行完成文章，再交由 LaTex 排版。Markdown 是文本檔案，所以任何文字編輯器都可使用，若需要所見即所得的編輯器，坊間有很多，上面推薦 Typora。

LaTex 的編譯器 (Compiler) 我們選用 Pandoc（以 Haskell 程式語言實作），而上述的外部程式庫則交由其他程式管理，Ubuntu 採用 TexLive；Windows 採用 MikTex，外部程式庫通常較為龐大，因此建議 Windows 以可攜環境為主。

論文中為求品質會插入向量式圖片，通常以 SVG 為主，才不會有縮放模糊的問題。為處理向量圖檔，Pandoc 使用 RSVG 程式來轉檔，務必安裝。

# Ubuntu

編譯腳本：

```bash
./compile.sh
```

## 環境設定

Pandoc 使用 dpkg 安裝；pandoc-crossref 解壓縮後複製到 `/usr/bin` 或是 `${PATH}` 可找到的目錄。

安裝 texlive、相關字型（Nimbus Roman 對應 Times New Roman，教育部標準楷書對應標楷體）和 RSVG-convert：

```bash
sudo apt install texlive texlive-xetex texlive-lang-chinese gsfonts fonts-moe-standard-kai librsvg2-bin
```

（可選但不建議）安裝 Microsoft 字型，有可能破壞原本的程式預設字型，建議只在 CI 或 docker 等虛擬環境中安裝。

```bash
sudo apt install ttf-mscorefonts-installer
```

# Windows

可攜環境腳本：從可攜環境執行 `start.bat`，彈出命令提示字元後，使用 `cd` / `x:` 指令切換到此模板的目錄和磁碟，執行編譯腳本。

編譯腳本：

```bash
.\compile.bat
```

## 環境設定

建議使用可攜版環境。以下為從頭開始**安裝** / **更新**可攜版環境的步驟。

+ 安裝 [MikTex](http://www.texts.io/support/0002/) (Protable version)
  將安裝檔命名成 `miktex-protable.exe`，執行並安裝到指定目錄中，此目錄即為可攜裝置上的位置，如 `D:\latex-env`。建議勾選自動安裝（安裝時需聯網）。安裝完後會出現啟動腳本 `miktex-portable.cmd`。
+ Pandoc
+ pandoc-crossref
+ [RSVG-convert](https://sourceforge.net/projects/tumagcc/files/)
+ 工具都齊全後，增加 `start.bat` 腳本將執行檔路徑加入 `PATH`。

  安裝版能直接從命令提示字元執行，故不用此步驟。
  ```bat
  @echo off
  set CWD=%~dp0
  start cmd /k "set PATH=%CWD%pandoc-2.17.1.1;%CWD%texmfs\install\miktex\bin\x64;%CWD%rsvg-convert-2.40.19;%PATH%"
  miktex-portable.cmd
  ```

建議保留各工具的版本號以利追蹤相容性。製作完後，此環境大小大約為 1GB。

[現成的可攜環境](https://drive.google.com/file/d/1Z7ZMWJWszQmBCppz3DZx3tj74a5RAYTC/view?usp=sharing)

# 檔案架構

複製這個倉儲、新增圖片資源、撰寫 `*.md` 檔案、從 `refer.bib` 新增參考文獻、編譯成論文。

新增 `*.md` 檔案時要加到 `compile.sh` / `complie.bat` 裡才會被編譯，如果只要看特定章節也可移除，增加編譯速度。

```
├── compile.sh               # 編譯用腳本
├── .github/workflows
│   └── demo.yaml            # 自動發布 git tag 的 PDF，需要設定 secrets.PUBLISH_TOKEN
└── src
    ├── templates
    │   └── template_*.tex   # 論文模板
    ├── img
    │   └── watermark-*.pdf  # 學校提供的浮水印
    │   └── *.*              # 圖片檔案 (png, svg 等)
    ├── *.md                 # 論文檔案，建議以數字為首命名
    ├── refer.md             # 「參考文獻」的標題，Markdown 必須
    ├── refer.bib            # BibTex 參考文獻，可以直接使用 Google scholar 提供的
    ├── appendix.md          # 附錄，若有需要請手動增加 LOF 和 LOT
    ├── meta_ntu.yaml        # 一些個人資訊以及誌謝、摘要、符號說明
    ├── meta_*.yaml          # 用於中英文切換的設定檔案
    └── ieee.csl             # 修改自 IEEE 的引用格式，多支援了混合連續引用
```
