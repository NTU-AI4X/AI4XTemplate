<p align="center">
  <img src="assets/logo.png" alt="ModernAcademic Logo" height="120">
</p>

# ModernAcademic LaTeX Templates

Modern, professional LaTeX templates for academic papers. Available in English and Chinese versions.

## Versions

| Version   | Class File              | Example                 | Compiler |
| --------- | ----------------------- | ----------------------- | -------- |
| 🇬🇧 English | `ModernAcademic-EN.cls` | `ModernAcademic-EN.tex` | pdfLaTeX |
| 🇨🇳 中文    | `ModernAcademic-CN.cls` | `ModernAcademic-CN.tex` | XeLaTeX  |

## Features

- 🎨 Customizable theme colors (hex or RGB)
- 📐 Flexible logo positioning (title, header, abstract box)
- 🔗 Social links support (GitHub, website, etc.)
- 📚 Bibliography management (natbib + bibtex)
- 📝 Pre-defined theorem environments
- 📊 Professional tables and figures

## Quick Start

### English Version

```latex
\documentclass[singlecolumn]{ModernAcademic-EN}

\title{Your Paper Title}
\author{Author Name}
\abstract{Your abstract...}

\begin{document}
\maketitle
\section{Introduction}
Content...
\bibliography{references}
\end{document}
```

Compile:
```bash
pdflatex document.tex
bibtex document
pdflatex document.tex
pdflatex document.tex
```

### 中文版

```latex
\documentclass[singlecolumn]{ModernAcademic-CN}

\title{论文标题}
\author{作者姓名}
\abstract{摘要内容...}

\begin{document}
\maketitle
\section{引言}
正文...
\bibliography{references}
\end{document}
```

编译：
```bash
xelatex document.tex
bibtex document
xelatex document.tex
xelatex document.tex
```

## Configuration

```latex
% Theme color
\setthemecolor{1a2a6c}

% Logo
\titlelogocontent{\includegraphics[height=1.5cm]{logo.png}}
\showlogointitle
\showlogoinheader
\showlogoinabstract

% Social links
\addsociallink{\faGithub}{Code}{https://github.com/...}

% Metadata
\shorttitle{Short Title}
\shortauthor{Author et al.}
\affiliation{University}
\email{email@example.org}
\keywords{keyword1, keyword2}
```

## License

MIT License
