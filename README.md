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

安裝 texlive：

```bash
sudo apt install texlive texlive-xetex texlive-lang-chinese
```

安裝 RSVG-convert：

```bash
sudo apt install librsvg2-bin
```

# Windows

使用 Git Bash 執行腳本，`${PRO}` 為可攜版安裝位置，若無則可忽略。

```bash
./compile.sh ${PRO}
# For example
./compile.sh /d/miktex/
```

## 環境設定

建議使用可攜版環境。以下為從頭開始**安裝** / **更新**可攜版環境的步驟。

+ 安裝 Miktex (Protable version)

    <http://www.texts.io/support/0002/>

    將安裝檔命名成 `miktex-protable.exe`，執行並安裝到指定目錄中，此目錄即為可攜裝置上的位置，如 `D:\miktex`，以下稱為 `${PRO}`。建議勾選自動安裝（安裝時需聯網）。安裝完後會出現啟動腳本 `miktex-portable.cmd`。

+ Pandoc
    直接下載 Windows 版本的 Zip 發行檔案，解壓縮到 `${PRO}`。
+ pandoc-crossref
    連結在最上方。下載後解壓縮到 `${PRO}`，注意版本是對應 Pandoc。
+ RSVG-convert
    從以下連結下載執行檔，解壓縮到 `${PRO}`。
    <https://sourceforge.net/projects/tumagcc/files/>
