# 前言

以下展示論文常用的文章範例，以及查詢細節的相關連結。文章主要使用的是 Markdown 語法，LaTex 與 HTML5 語法為輔。若混合中文、英文與交互參照 (cross reference)，請使用空白分開字元，以免產生不確定的斷字方式，除了標點符號之外。

Markdown 語法請參考：

+ 中文：<https://markdown.tw/>
+ 英文：<https://daringfireball.net/projects/markdown/syntax>

交互參照請參考 pandoc-crossref：

+ <http://lierdakil.github.io/pandoc-crossref/>

## 段落

基本段落以空行分段，相連的行會被視作同段落而被合併。

Pandoc 對於條列的規則比較嚴格，縮進要 4 個空白而非 2 個，且不可和段落相連，也僅支援寬鬆排版（無視緊湊條列間的分段）。

1. 條列1。
    1. 條列 1.1。
    + 條列 1.2。
1. 條列2。

其他基本規則一致，詳情請參考 Markdown 的規則。

## 交互參照與參考文獻

定義參考使用 `#` 作為前綴，單一的參考引用使用 `@` 前綴。引用跟英文單字一樣，使用空白分開。多個參考則是使用中括弧 `[]`。

章節使用 `sec`、圖片使用 `fig`、方程式使用 `eq`、表格使用 `tbl` 作為代號前綴。參考文獻沒有前綴，跟 BibTex 裡的名稱一致。代號不能重複，可用但不建議使用中文，以免取代錯誤。

```markdown
引用單一的參考 @vf-two @efd 和連續引用 [@vf-two;...]。
```

引用單一的參考 @vf-two 與 @efd 和連續引用 [@vf-two;@ga;@pso;@de;@hertz1882ueber;@rosheim1994robot;@lane1998advanced;@sapietova2016analysis;@essay62109;@gravagne2002phd-thesis]。

## 圖片

單一圖片的語法如下所示。自定寬度時 LaTex 可識別不同的長度單位，如 cm、mm、in 等。引用 @fig:first。

```markdown
![圖片標題](圖片連結){#fig:圖片代號 width=圖片寬度}
```

![Ubuntu Logo 1](img/ubuntu-icon.svg){#fig:first width=5cm}

多子圖片的語法如下所示。必須使用 HTML 的 div tag 包裝，不支援特定的排版。引用 @fig:a、@fig:b 和 @fig:main。

```markdown
<div id="fig:圖片代號">
![圖片標題1](img/ubuntu-icon.svg){#fig:圖片代號-1 width=圖片寬度1}
\hspace{0.5cm}
![圖片標題2](img/ubuntu-icon.svg){#fig:圖片代號-2 width=圖片寬度2}

圖片標題
</div>
```

<div id="fig:main">
![Ubuntu Logo 1](img/ubuntu-icon.svg){#fig:a width=5cm}
\hspace{0.5cm}
![Ubuntu Logo 2](img/ubuntu-icon.svg){#fig:b width=5cm}

主要的圖說
</div>

## 方程式

內嵌數學 $\alpha$ 使用兩組 `$` 符號，完整的方程式使用兩組 `$$` 符號當作括弧。引用 @eq:cases。

LaTex 數學可以使用線上工具預覽：<https://latex.codecogs.com/eqneditor/editor.php>

```markdown
內嵌數學 $\alpha$。

$$
\begin{cases}
x = 10
\\
y = 20
\end{cases}
$${#eq:方程式代號}
```

$$
\begin{cases}
x = 10
\\
y = 20
\\
C = \boldsymbol{\mathit{I}}A \times B
\end{cases}
$${#eq:cases}

## 表格

表格的語法如下所示。引用 @tbl:my-params。

```markdown
: 表格標題 {#tbl:表格代號}

| A | B |
|:---:|:--:|
| 10 | 20 |
| 30 | 40 |
```

: My Parameters {#tbl:my-params}

| A | B |
|:---:|:--:|
| 10 | 20 |
| 30 | 40 |

## 偽代碼

使用 LaTex 套件 algorithm2e 達成，可混用數學，有自己的編碼方式。無法引用。

套件語法請參考：<https://www.ctan.org/pkg/algorithm2e>

```markdown
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Write here the result}
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Write here the input}
\Output{Write here the output}
\BlankLine
\While{While condition}{
    instructions\;
    \eIf{condition}{
        instructions1\;
        instructions2\;
    }{
        instructions3\;
    }
}
\caption{While loop with If/Else condition}
\end{algorithm}
```

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Write here the result}
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Write here the input}
\Output{Write here the output}
\BlankLine
\While{While condition}{
    instructions\;
    \eIf{condition}{
        instructions1\;
        instructions2\;
    }{
        instructions3\;
    }
}
\caption{While loop with If/Else condition}
\end{algorithm}
