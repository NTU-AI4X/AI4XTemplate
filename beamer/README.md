# ModernAcademic Beamer Templates

This folder contains the Beamer version of ModernAcademic. The example decks are also small tutorials: they demonstrate the theme commands together with common Beamer structures such as columns, lists, overlays, blocks, figures, tables, equations, theorem environments, and closing pages.

本目录包含 ModernAcademic 的 Beamer 幻灯片模板。示例文件同时也是一个简短教程：它们展示主题命令，也展示常见 Beamer 排版结构，例如 columns、列表、覆盖层、block、图片、表格、公式、定理环境和结束页。

## Files

- `EN.tex`: English example deck, compiled with pdfLaTeX
- `CN.tex`: Chinese example deck, compiled with XeLaTeX and `ctexbeamer`
- `beamerthemeModernAcademic-EN.sty`: English theme wrapper
- `beamerthemeModernAcademic-CN.sty`: Chinese theme wrapper
- `beamerthemeModernAcademicBase.sty`: shared theme foundation

## Quick Start

Compile from this directory so the local theme files are found automatically.

```bash
cd beamer
pdflatex EN.tex
pdflatex EN.tex
```

```bash
cd beamer
xelatex CN.tex
xelatex CN.tex
```

从本目录内编译可以自动找到本地主题文件。英文示例使用 pdfLaTeX，中文示例使用 XeLaTeX。

## Minimal English Deck

```latex
\documentclass[aspectratio=169,10pt]{beamer}
\usetheme{ModernAcademic-EN}

\title{Your Talk Title}
\subtitle{Optional subtitle}
\author{Author Name}
\shorttitle{Short Talk Title}
\shortauthor{Author}
\affiliation{Institution Name}
\email{author@example.org}
\titlelogocontent{\includegraphics[height=2.4em]{../assets/logo.png}}
\showlogointitle
\hidelogoinheader

\begin{document}
\begin{frame}[plain,noframenumbering]
  \titlepage
\end{frame}

\begin{frame}{Motivation}
  Your slide content.
\end{frame}
\end{document}
```

## 中文最小示例

```latex
\documentclass[aspectratio=169,10pt]{ctexbeamer}
\usetheme{ModernAcademic-CN}

\title{报告标题}
\subtitle{可选副标题}
\author{作者姓名}
\shorttitle{短标题}
\shortauthor{作者}
\affiliation{机构名称}
\email{author@example.org}
\titlelogocontent{\includegraphics[height=2.4em]{../assets/logo.png}}
\showlogointitle
\hidelogoinheader

\begin{document}
\begin{frame}[plain,noframenumbering]
  \titlepage
\end{frame}

\begin{frame}{研究动机}
  幻灯片内容。
\end{frame}
\end{document}
```

## Theme Commands

Metadata commands:

- `\title{...}` and `\subtitle{...}`
- `\author{...}`, `\shortauthor{...}`, and `\affiliation{...}`
- `\shorttitle{...}`, `\templatename{...}`, `\email{...}`, and `\date{...}`

Logo commands:

- `\titlelogocontent{...}` defines reusable logo content
- `\showlogointitle` and `\hidelogointitle` control the title-page logo
- `\showlogoinheader` and `\hidelogoinheader` control the content-page header logo

Layout commands:

- `\usemodernacademiclayout{standard}` selects a layout preset
- `\usemodernacademiclayout{compact}`, `\usemodernacademiclayout{dense}`, and `\usemodernacademiclayout{spacious}` provide alternate densities
- `\settitlepageregionlayout{...}`, `\setsectionpageregionlayout{...}`, `\setcontentpageregionlayout{...}`, and `\settailpageregionlayout{...}` adjust title, section, content, and closing pages independently
- `\showsectionframes`, `\hidesectionframes`, and `\setsectionname{...}` control automatic section divider pages
- `\tailpage[Title]{Body text}` creates a closing or contact slide

Color commands:

- `\setthemecolor{1a2a6c}`
- `\setthemecolor{185,28,28}`
- `\setlinkcolor{1a2a6c}`
- `\setcitecolor{2d5a27}`
- `\seturlcolor{5c3566}`

## Beamer Basics Used in the Examples

Use ordinary Beamer frames for simple slides:

```latex
\begin{frame}{Frame Title}
  Content.
\end{frame}
```

Use `academicframe` when you want the ModernAcademic title and subtitle interface:

```latex
\begin{academicframe}[Frame subtitle]{Frame Title}
  Content.
\end{academicframe}
```

Use `columns` for side-by-side content:

```latex
\begin{columns}[T,onlytextwidth]
  \begin{column}{.48\linewidth}
    Left column.
  \end{column}
  \begin{column}{.48\linewidth}
    Right column.
  \end{column}
\end{columns}
```

Use overlays for staged explanations:

```latex
\begin{itemize}
  \item First point
  \pause
  \item<2-> Second point
  \item<3-> \alert{Emphasized point}
\end{itemize}
```

Use regular LaTeX structures for figures, tables, and equations:

```latex
\includegraphics[width=.6\linewidth]{../assets/logo.png}

\begin{equation}
  y = X\beta + \varepsilon
\end{equation}
```

## 示例文件内容

`EN.tex` 和 `CN.tex` 的内容保持一致，分别面向英文和中文编译环境。它们依次展示元信息、标题页 Logo、基础帧、columns、多种列表、覆盖层、block、定理与证明、图片、表格、页面区域命令、章节页和结束页。

如果需要修改主题样式，优先改 `beamerthemeModernAcademicBase.sty`；如果只是调整中英文默认文案、字体或默认颜色，分别修改 `beamerthemeModernAcademic-EN.sty` 与 `beamerthemeModernAcademic-CN.sty`。
