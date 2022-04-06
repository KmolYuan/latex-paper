# 前言

以下展示論文常用的文章範例，以及查詢細節的相關連結。文章主要使用的是 Markdown 語法，LaTex 與 HTML5 語法為輔。請注意一個細節，若混合中文、英文與交互參照 (cross reference)，請使用空白分開字元，除了標點符號之外。

Markdown 語法請參考：

+ 中文：<https://markdown.tw/>
+ 英文：<https://daringfireball.net/projects/markdown/syntax>

交互參照請參考 pandoc-crossref：

+ <http://lierdakil.github.io/pandoc-crossref/>

## 交互參照與參考文獻

單一的參考使用 `@` 前綴當作符號，跟英文單字一樣，使用空白分開。多個參考則是使用中括弧 `[]` 包含。

```markdown
引用單一的參考 @vf-two @efd 和連續引用 [@vf-two;...]。
```

引用單一的參考 @vf-two @efd 和連續引用 [@vf-two;@ga;@pso;@de;@hertz1882ueber;@rosheim1994robot;@lane1998advanced;@sapietova2016analysis;@essay62109;@gravagne2002phd-thesis]。

## 圖片

單一圖片的語法如下所示。圖片代號不能重複，可用但不建議使用中文，以免取代錯誤。另外 LaTex 可識別不同的長度單位。引用 @fig:first。

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

```markdown
內嵌數學 $\alpha$。

$$
\begin{cases}
x = 10
\\
y = 20
\end{cases}
$${#eq:cases}
```

$$
\begin{cases}
x = 10
\\
y = 20
\end{cases}
$${#eq:cases}

## 表格

表格的語法如下所示。引用 @tbl:my-params。

```markdown
: My Parameters {#表格代號}

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

## 虛擬碼

虛擬碼使用 LaTex 套件 algorithm2e 達成，可混用數學，語法如下。無法引用。

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
