<p align="center">
  <img src="assets/logo.png" alt="ModernAcademic Logo" height="120">
</p>

# ModernAcademic LaTeX Templates

ModernAcademic provides paired English and Chinese LaTeX classes for compact academic papers, technical reports, and template demonstrations. Version 2 keeps the English and Chinese public interfaces aligned while preserving language-specific bibliography and compilation choices.

ModernAcademic 提供英文和中文两套 LaTeX 类文件，适用于紧凑型学术论文、技术报告和模板功能展示。v2 版本统一了中英文公开接口，同时保留各自的编译方式和参考文献样式。

## Version 2

English version:

- Class file: `ModernAcademic-EN.cls`
- Example file: `ModernAcademic-EN.tex`
- Compiler: pdfLaTeX
- Bibliography: `natbib` with `unsrtnat`
- Placeholder text: `lipsum`

中文版本：

- 类文件：`ModernAcademic-CN.cls`
- 示例文件：`ModernAcademic-CN.tex`
- 编译器：XeLaTeX
- 参考文献：`natbib` 与 `gbt7714-numerical`
- 占位文本：`zhlipsum`

## Beamer Support

Beamer slide templates are available in `beamer/`. See `beamer/README.md` for slide-specific usage, layout controls, and compilation commands.

Beamer 幻灯片模板位于 `beamer/` 目录。具体用法、页面区域控制和编译命令请见 `beamer/README.md`。

## Features

Both class files provide the same core interface:

- `singlecolumn` and `twocolumn` class options
- Title metadata through `\title`, `\author`, `\shorttitle`, `\shortauthor`, `\affiliation`, `\email`, and `\abstract`
- Reusable logo content through `\titlelogocontent`
- Independent logo placement with `\showlogointitle` and `\showlogoinheader`
- Automatic first-page header height adjustment when a header logo is enabled
- Theme colors through `\setthemecolor`, `\setlinkcolor`, `\setcitecolor`, and `\seturlcolor`
- Abstract box built with `tcolorbox`
- Abstract footnote mode controlled by `\disableabstractfootnotes`
- Theorem, lemma, corollary, proposition, definition, example, and remark environments
- `hyperref` and `cleveref` cross-references
- Tables, long tables, figures, subfigures, captions, and compact lists
- Numeric citation workflow based on BibTeX

两套类文件提供一致的核心接口：

- `singlecolumn` 与 `twocolumn` 类选项
- 通过 `\title`、`\author`、`\shorttitle`、`\shortauthor`、`\affiliation`、`\email` 和 `\abstract` 设置标题元信息
- 通过 `\titlelogocontent` 定义可复用 Logo 内容
- 通过 `\showlogointitle` 和 `\showlogoinheader` 独立控制 Logo 位置
- 启用首页页眉 Logo 时自动根据 Logo 高度调整页眉高度
- 通过 `\setthemecolor`、`\setlinkcolor`、`\setcitecolor` 和 `\seturlcolor` 设置主题与链接颜色
- 基于 `tcolorbox` 的摘要框
- 通过 `\disableabstractfootnotes` 控制摘要脚注模式
- 定理、引理、推论、命题、定义、例和注环境
- 基于 `hyperref` 与 `cleveref` 的交叉引用
- 表格、长表格、图、子图、图表标题和紧凑列表
- 基于 BibTeX 的数字引用流程

## Abstract Footnotes

By default, footnotes written inside `\abstract{...}` are promoted from the abstract box to the normal page footnote area. This is useful for project notes, funding notes, equal-contribution notes, or short data statements that should follow ordinary page-footnote typography.

Use this command in the preamble to keep abstract footnotes inside the abstract box:

```latex
\disableabstractfootnotes
```

After calling `\disableabstractfootnotes`, abstract footnotes stay at the bottom of the abstract box. Body footnotes are not affected.

默认情况下，写在 `\abstract{...}` 内部的脚注会从摘要框中提升到普通页面脚注区域。这适合基金项目、同等贡献、数据说明等需要按普通页面脚注排版的短注释。

如果希望摘要脚注保留在摘要框内部，请在导言区使用：

```latex
\disableabstractfootnotes
```

调用后，摘要脚注会留在摘要框底部。正文中的普通脚注不受影响。

## Logo Configuration

Define logo content once:

```latex
\titlelogocontent{\includegraphics[height=3em]{assets/logo.png}}
```

Enable title and first-page header placement independently:

```latex
\showlogointitle
\showlogoinheader
```

The class keeps a compact fallback header height when no first-page header logo is shown. If `\showlogoinheader` is enabled, the logo is measured and the header height is increased only when necessary.

只需定义一次 Logo 内容：

```latex
\titlelogocontent{\includegraphics[height=3em]{assets/logo.png}}
```

标题上方和首页页眉位置可以独立启用：

```latex
\showlogointitle
\showlogoinheader
```

未启用首页页眉 Logo 时，类文件使用紧凑的默认页眉高度。启用 `\showlogoinheader` 后，类文件会测量 Logo 实际高度，并仅在需要时自动增加页眉高度。

## English Quick Start

```latex
\documentclass[singlecolumn]{ModernAcademic-EN}

\title{Your Paper Title}
\author{Author Name}
\shorttitle{Short Title}
\shortauthor{Author}
\affiliation{Institution Name}
\email{author@example.org}
\abstract{A concise abstract.}

\begin{document}
\maketitle
\section{Introduction}
\lipsum[1]
\bibliography{references}
\end{document}
```

Compile with:

```bash
pdflatex ModernAcademic-EN.tex
bibtex ModernAcademic-EN
pdflatex ModernAcademic-EN.tex
pdflatex ModernAcademic-EN.tex
```

## 中文快速开始

```latex
\documentclass[singlecolumn]{ModernAcademic-CN}

\title{论文标题}
\author{作者姓名}
\shorttitle{短标题}
\shortauthor{作者}
\affiliation{机构名称}
\email{author@example.org}
\abstract{摘要内容。}

\begin{document}
\maketitle
\section{引言}
\zhlipsum[1]
\bibliography{references}
\end{document}
```

编译命令：

```bash
xelatex ModernAcademic-CN.tex
bibtex ModernAcademic-CN
xelatex ModernAcademic-CN.tex
xelatex ModernAcademic-CN.tex
```

## Theme Configuration

```latex
\setthemecolor{1a2a6c}
\setthemecolor{185,28,28}
\setlinkcolor{1a2a6c}
\setcitecolor{2d5a27}
\seturlcolor{5c3566}
```

The first form uses HTML hex without `#`; the second form uses an RGB triplet. Link, citation, and URL colors can be configured separately.

第一种写法使用不带 `#` 的 HTML 十六进制颜色；第二种写法使用 RGB 三元组。内部链接、引用链接和 URL 链接颜色可以分别配置。

## Example Documents

The example files are intended to be visual test documents rather than minimal papers. They demonstrate metadata, logo placement, theme colors, abstract footnote modes, cross-references, mathematics, theorem environments, figures, subfigures, tables, long tables, algorithms, code listings, citations, and bibliography formatting.

示例文件更接近可视化测试文档，而不是最小论文。它们用于展示标题元信息、Logo 位置、主题颜色、摘要脚注模式、交叉引用、数学排版、定理环境、图、子图、表格、长表格、算法、代码清单、引用和参考文献排版。

## License

MIT License.
