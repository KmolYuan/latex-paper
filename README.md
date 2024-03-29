# 使用 Word？

如果你沒有在 Ubuntu 寫論文的需求，仍然可以藉由 Microsoft Word 達成 LaTex 的功能，以下是優劣比較。

| 功能 | MS Word | 這個 repo |
|:----:|:-------:|:---------:|
| 所見即所得 | GUI | 依賴外部編輯器 |
| 排版 | 自己設定 | 全自動 |
| 大綱 | GUI | Markdown 語法 |
| 交互參照 | GUI + 功能變數 | 延伸語法 |
| 數學式 | GUI | LaTex Math 語法 |
| 向量圖片 | 可插入無法修改/轉存 | 佳 | 
| 編譯 PDF | 即時 | 較久 |
| 參考文獻 | [Zotero](https://www.zotero.org/)（強烈推薦） | BibTex |

# 簡介

主要連結：

+ Compiler: [Pandoc](https://github.com/jgm/pandoc/releases/)
+ Cross reference filter: [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref/releases/)
+ Text Editor: [KDE Kate](https://kate-editor.org/)
+ 教學影片：<https://youtu.be/E8c6Tpuedok>

Pandoc 流程：Markdown 文件 `.md` 套用 filter 之後，嵌入到 LaTex 模板中成為 `.tex` 檔案，再轉換為 `.pdf`。

LaTex 為一種程式語言，支援標準庫 (Standard Libraries) 和外部程式庫 (External Libraries)，不過與一般程式語言不同的是，它可以直接表述 Tex 排版結構，類似於 PHP 之於 HTML 的概念。但是直接撰寫 LaTex 仍較複雜，因此可以藉由 Markdown 這種輕量的標註式語言先行完成文章，再交由 LaTex 排版。Markdown 是文本檔案，所以任何文字編輯器都可使用，若需要所見即所得的編輯器，坊間有很多，推薦 Typora。

LaTex 的編譯器 (Compiler) 我們選用 Pandoc（以 Haskell 程式語言實作），而上述的外部程式庫則交由其他程式管理，Ubuntu 採用 TexLive；Windows 採用 MikTex，外部程式庫通常較為龐大，因此建議 Windows 以可攜環境為主。

論文中為求品質會插入向量式圖片，通常以 SVG 為主，才不會有縮放模糊的問題。為處理向量圖檔，Pandoc 使用 RSVG 程式來轉檔，務必安裝。

# Ubuntu

編譯腳本：

```bash
./compile.sh
```

## 環境設定

Pandoc 使用 dpkg 安裝；pandoc-crossref 解壓縮後複製到 `/usr/bin` 或是 `${PATH}` 可找到的目錄。

安裝 texlive 和 RSVG-convert：

```bash
sudo apt install texlive texlive-xetex texlive-science texlive-lang-chinese librsvg2-bin
```

Ubuntu 可從本倉儲的 `fonts` 目錄安裝字型，Microsoft 允許持有 Windows 授權下任意使用標楷體與 Times New Roman。

```bash
mkdir -p ~/.local/share/fonts/
cp fonts/* ~/.local/share/fonts/
fc-cache
```

# Windows

可攜環境腳本：從可攜環境執行 `start.bat`，執行編譯腳本。

編譯腳本：

```bat
REM 可攜版
.\start.bat
REM 安裝版
.\compile.bat
```

## 環境設定

建議使用可攜版環境。以下為從頭開始**安裝** / **更新**可攜版環境的步驟。

+ 安裝 [MikTex](http://www.texts.io/support/0002/) (Protable version)
  將安裝檔命名成 `miktex-protable.exe`，執行並安裝到指定目錄中，此目錄即為可攜裝置上的位置，如 `D:\latex-env`。建議勾選自動安裝（安裝時需聯網）。安裝完後會出現啟動腳本 `miktex-portable.cmd`。
+ Pandoc
+ pandoc-crossref
+ [RSVG-convert](https://sourceforge.net/projects/tumagcc/files/)
+ 工具都齊全後，增加 `start.bat` 腳本，並將整個環境 `latex-env` 加到此倉儲中。

  安裝版能直接從命令提示字元執行，故不用此步驟。
  ```bat
  @echo off
  setlocal
  set CWD=%~dp0
  cd %CWD%
  call .\miktex-portable.cmd
  start cmd /k "set PATH=%CWD%pandoc-2.17.1.1;%CWD%texmfs\install\miktex\bin\x64;%CWD%rsvg-convert-2.40.19;%PATH% && call .\compile.bat && if %ERRORLEVEL% EQU 0 exit"
  endlocal
  ```

建議保留各工具的版本號以利追蹤相容性。製作完後，此環境大小大約為 1GB。

[現成的可攜環境](https://drive.google.com/file/d/1Z7ZMWJWszQmBCppz3DZx3tj74a5RAYTC/view?usp=sharing)

# 檔案架構

複製這個倉儲、新增圖片資源、撰寫 `*.md` 檔案、從 `refer.bib` 新增參考文獻、編譯成論文。

新增 `*.md` 檔案時要加到 `compile.sh` / `complie.bat` 裡才會被編譯，如果只要看特定章節也可移除，增加編譯速度。

另外可將輸出的檔名改成 `.docx`，變成 Microsoft Word 檔案，以供複製方程式和圖表（無法支援格式）。

```
├── compile.sh               # Ubuntu 編譯用腳本。
├── compile.bat              # Windows 編譯用腳本。
├── .github/workflows
│   └── demo.yaml            # 自動發布 git tag 的 PDF，需要設定 secrets.PUBLISH_TOKEN。
│                            # 不建議在太長的編譯啟用。
└── src
    ├── img
    │   └── watermark.pdf    # 學校提供的浮水印。
    │   └── *.*              # 圖片檔案 (png, svg 等)。
    ├── template.tex         # 論文模板。
    ├── *.md                 # 論文本文檔案，建議以數字為首命名。
    ├── refer.md             # 「參考文獻」的標題，Markdown 必須。
    ├── refer.bib            # BibTex 參考文獻，可以直接使用 Google scholar 提供的，
    │                        # 每個 reference 可以自己重新命名。
    ├── appendix.md          # 附錄，若有需要請手動增加 LOF 和 LOT。
    ├── metadata.yaml        # 一些個人資訊以及誌謝、摘要、符號說明。
    └── ieee.csl             # 修改自 IEEE 的引用格式，多支援了混合連續引用。
```
