%% ModernAcademic-CN.cls
%% 现代学术论文 LaTeX 类文件（中文版）
%% 设计用于 XeLaTeX 编译
%% https://github.com/lartpang/ModernAcademic-LaTeX
%% 许可: MIT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ModernAcademic-CN}[2026/01/28 v1.0 现代学术论文类 (中文版)]

%% ============================================================================
%% 1. 类选项
%% ============================================================================

\newif\if@twocol
\@twocolfalse

\DeclareOption{singlecolumn}{\@twocolfalse}
\DeclareOption{twocolumn}{\@twocoltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}

\ExecuteOptions{singlecolumn}
\ProcessOptions\relax

% 加载基础类 (ctexart 提供完整中文支持)
\if@twocol
  \LoadClass[a4paper,10pt,twocolumn,zihao=-4]{ctexart}
\else
  \LoadClass[a4paper,zihao=-4]{ctexart}
\fi

%% ============================================================================
%% 2. 必需宏包
%% ============================================================================

% --- 字符串操作（用于主题色解析）---
\RequirePackage{xstring}

% --- 页面布局 ---
\RequirePackage[
  a4paper,
  top=2.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm,
  headheight=14pt,
  headsep=0.5cm,
  footskip=1cm
]{geometry}

% --- 排版微调 ---
\RequirePackage{setspace}

% --- 数学支持 ---
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% --- 字体配置 (XeLaTeX) ---
% 英文字体（若未安装则使用默认字体）
\RequirePackage{fontspec}
\IfFontExistsTF{Libertinus Serif}{
  \setmainfont{Libertinus Serif}
  \setsansfont{Libertinus Sans}
}{}
\IfFontExistsTF{Inconsolata}{
  \setmonofont{Inconsolata}
}{}

% --- 颜色 ---
\RequirePackage[table,xcdraw]{xcolor}

% 默认主题色
\definecolor{academicblue}{HTML}{1a2a6c}
\definecolor{linkblue}{HTML}{1a2a6c}
\definecolor{citegreen}{HTML}{2d5a27}
\definecolor{urlpurple}{HTML}{5c3566}
\definecolor{abstractbg}{HTML}{f8f9fa}
\definecolor{abstractborder}{HTML}{e9ecef}

% 主题色配置接口
% 用法: \setthemecolor{b91c1c} (十六进制) 或 \setthemecolor{185,28,28} (RGB)
\newcommand{\setthemecolor}[1]{%
  \IfSubStr{#1}{,}{% RGB 格式: R,G,B
    \definecolor{academicblue}{RGB}{#1}%
    \definecolor{linkblue}{RGB}{#1}%
  }{% 十六进制格式: RRGGBB（不含 #）
    \definecolor{academicblue}{HTML}{#1}%
    \definecolor{linkblue}{HTML}{#1}%
  }%
}

% 功能色配置接口
% 用法: \setlinkcolor{0000FF}
\newcommand{\setlinkcolor}[1]{\definecolor{linkblue}{HTML}{#1}}
\newcommand{\setcitecolor}[1]{\definecolor{citegreen}{HTML}{#1}}
\newcommand{\seturlcolor}[1]{\definecolor{urlpurple}{HTML}{#1}}

% --- 彩色框 ---
\RequirePackage[most]{tcolorbox}

% --- 社交链接图标 ---
\RequirePackage{fontawesome5}

% --- TikZ 图形 ---
\RequirePackage{tikz}

% --- 表格与图形 ---
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{caption}
\RequirePackage{subcaption}

\captionsetup{
  font={small},
  labelfont={bf, color=academicblue},
  labelsep=period,
  skip=8pt,
}

\captionsetup[sub]{
  font={footnotesize},
  labelfont={bf},
}

% --- 超链接与引用 ---
\RequirePackage[
  colorlinks=true,
  linkcolor=academicblue,
  citecolor=citegreen,
  urlcolor=urlpurple,
  bookmarks=true,
  bookmarksnumbered=true,
  pdfstartview=FitH,
]{hyperref}

\RequirePackage[nameinlink, noabbrev]{cleveref}

% --- 参考文献 ---
\RequirePackage{natbib}
\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}

% --- 页眉页脚 ---
\RequirePackage{fancyhdr}

% --- 摘要 ---
\RequirePackage{abstract}

% --- 章节标题 ---
\RequirePackage{titlesec}

%% ============================================================================
%% 3. 页面样式
%% ============================================================================

\newcommand{\@shorttitle}{}
\newcommand{\@shortauthor}{}

% 首页样式（可选页眉 Logo）
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% 首页样式（页眉右侧带 Logo）
\fancypagestyle{firstpageheaderlogo}{%
  \fancyhf{}
  \fancyhead[R]{\@titlelogo}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{mainmatter}{%
  \fancyhf{}
  \fancyhead[L]{\small\kaishu\@shorttitle}
  \fancyhead[R]{\small\kaishu\@shortauthor}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{mainmatter}

%% ============================================================================
%% 4. 标题与作者命令
%% ============================================================================

\newcommand{\@affiliation}{\@empty}
\newcommand{\@email}{\@empty}
\newcommand{\@keywords}{\@empty}
\newcommand{\@abstract}{\@empty}
\newcommand{\@titlepreskip}{0pt}
\newcommand{\@titlelogo}{\@empty}
\newcommand{\@titlelogogap}{0.3em}

% Logo 与标题间距设置器
\newcommand{\settitlelogogap}[1]{\renewcommand{\@titlelogogap}{#1}}

% Logo 位置开关：三个独立开关（默认均为 false）
% 每个位置可以独立启用，多个位置可以同时激活
\newif\if@logointitle
\newif\if@logoinheader
\newif\if@logoinabstract
\@logointitlefalse
\@logoinheaderfalse
\@logoinabstractfalse

% 用户命令：在特定位置启用/禁用 Logo
\newcommand{\showlogointitle}{\@logointitletrue}
\newcommand{\hidelogointitle}{\@logointitlefalse}
\newcommand{\showlogoinheader}{\@logoinheadertrue}
\newcommand{\hidelogoinheader}{\@logoinheaderfalse}
\newcommand{\showlogoinabstract}{\@logoinabstracttrue}
\newcommand{\hidelogoinabstract}{\@logoinabstractfalse}

% 社交链接存储（{图标}{文字}{链接} 三元组列表）
\newcommand{\@sociallinks}{}
% 添加社交链接: \addsociallink{\faGithub}{GitHub}{https://github.com/user/repo}
\newcommand{\addsociallink}[3]{%
  \g@addto@macro\@sociallinks{\@socialitem{#1}{#2}{#3}}%
}
% 内部：渲染单个社交链接项
\newcommand{\@socialitem}[3]{%
  \href{#3}{#1\,#2}\hspace{1em}%
}
% 清除所有社交链接
\newcommand{\clearsociallinks}{\renewcommand{\@sociallinks}{}}

% 关键词可见性开关
\newif\ifshowkeywords
% 默认不显示关键词块。当用户调用 `\keywords{...}` 时，
% 下面的宏将设置内容并启用关键词显示。
\showkeywordsfalse

% 控制摘要脚注是否启用（启用时加载 footnote 包）
\newif\ifabstractfootnotes
\abstractfootnotestrue
\newcommand{\disableabstractfootnotes}{\abstractfootnotesfalse}

\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}
\newcommand{\shortauthor}[1]{\renewcommand{\@shortauthor}{#1}}
\newcommand{\affiliation}[1]{\renewcommand{\@affiliation}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}\showkeywordstrue}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}

% 标题前间距配置（用于 Logo/机构标志上方空间）
% 用法: \settitlepreskip{2cm}
\newcommand{\settitlepreskip}[1]{\renewcommand{\@titlepreskip}{#1}}

% 标题 Logo 内容配置（标题上方的机构标志）
% 用法: \titlelogocontent{\includegraphics[height=1.2cm]{logo.png}}
%       或 \titlelogocontent{...TikZ 代码...}
\newcommand{\titlelogocontent}[1]{\renewcommand{\@titlelogo}{#1}}

%% ============================================================================
%% 5. 标题页设计
%% ============================================================================

% 基础摘要框样式
\tcbset{
  abstractboxbase/.style={
    enhanced,
    colback=abstractbg,
    colframe=abstractborder,
    boxrule=0.5pt,
    arc=4pt,
    left=12pt,
    right=12pt,
    top=10pt,
    bottom=10pt,
    fontupper=\small,
    before skip=1em,
    after skip=1.5em,
  }
}

% 无装饰摘要框
\newtcolorbox{abstractbox}{abstractboxbase}

% 仅社交链接摘要框（左下角）
\newtcolorbox{abstractboxsocial}{
  abstractboxbase,
  overlay={
    \node[anchor=south west, inner sep=0pt, xshift=12pt, yshift=8pt, font=\footnotesize]
      at (frame.south west) {\@sociallinks};
  }
}

% 仅 Logo 摘要框（右下角）
\newtcolorbox{abstractboxlogo}{
  abstractboxbase,
  overlay={
    \node[anchor=south east, inner sep=0pt, xshift=-12pt, yshift=8pt]
      at (frame.south east) {\@titlelogo};
  }
}

% 社交链接（左下角）和 Logo（右下角）摘要框
\newtcolorbox{abstractboxboth}{
  abstractboxbase,
  overlay={
    \node[anchor=south west, inner sep=0pt, xshift=12pt, yshift=8pt, font=\footnotesize]
      at (frame.south west) {\@sociallinks};
    \node[anchor=south east, inner sep=0pt, xshift=-12pt, yshift=8pt]
      at (frame.south east) {\@titlelogo};
  }
}

% 可选：允许摘要框内的脚注作为普通页面脚注排版
% 仅在 abstractfootnotes 为 true 时加载 `footnote` 包并启用保存
\ifabstractfootnotes
  \RequirePackage{footnote}
  \makesavenoteenv{abstractbox}
  \makesavenoteenv{abstractboxsocial}
  \makesavenoteenv{abstractboxlogo}
  \makesavenoteenv{abstractboxboth}
\fi

% 内部命令：渲染摘要框内容
\newcommand{\@abstractboxcontent}{%
  \begin{center}
    {\large\@author}%
    \ifx\@affiliation\@empty\else
      \\[0.4em]
      {\small\kaishu\@affiliation}%
    \fi
    \ifx\@email\@empty\else
      \\[0.2em]
      {\small\ttfamily\@email}%
    \fi
  \end{center}

  \ifx\@abstract\@empty\else
    \vspace{0.5em}
    {\centering\textcolor{abstractborder}{\rule{0.3\textwidth}{0.4pt}}\par}
    \vspace{0.5em}

    \noindent\textbf{\sffamily\color{academicblue}摘要：}\quad
    \@abstract

    \ifshowkeywords
      \ifx\@keywords\@empty\else
        \vspace{0.6em}

        \noindent\textbf{\sffamily\color{academicblue}关键词：}\quad\@keywords
      \fi
    \fi
  \fi

  % 如果存在社交链接或摘要 Logo，添加垂直空间
  \ifx\@sociallinks\@empty\else
    \vspace{1.2em}
  \fi
  \if@logoinabstract
    \ifx\@titlelogo\@empty\else
      \vspace{1.2em}
    \fi
  \fi
}

\newcommand{\@maketitleblock}{%
  % 标题前空间和 Logo（仅在标题位置启用时）
  \if@logointitle
    \ifx\@titlelogo\@empty\else
      \vspace*{\@titlepreskip}
      {%
        \centering
        \@titlelogo\par
      }%
      \vspace{\@titlelogogap}
    \fi
  \else
    \ifdim\@titlepreskip>0pt
      \vspace*{\@titlepreskip}
    \fi
  \fi
  \begin{center}
    {\LARGE\bfseries\heiti\color{academicblue}\@title\par}
    \vspace{1.2em}
  \end{center}

  % 根据配置选择适当的摘要框
  \if@logoinabstract
    % Logo 在摘要框中启用
    \ifx\@titlelogo\@empty
      % 未定义 Logo
      \ifx\@sociallinks\@empty
        \begin{abstractbox}\@abstractboxcontent\end{abstractbox}
      \else
        \begin{abstractboxsocial}\@abstractboxcontent\end{abstractboxsocial}
      \fi
    \else
      % 已定义 Logo
      \ifx\@sociallinks\@empty
        \begin{abstractboxlogo}\@abstractboxcontent\end{abstractboxlogo}
      \else
        \begin{abstractboxboth}\@abstractboxcontent\end{abstractboxboth}
      \fi
    \fi
  \else
    % Logo 不在摘要框中
    \ifx\@sociallinks\@empty
      \begin{abstractbox}\@abstractboxcontent\end{abstractbox}
    \else
      \begin{abstractboxsocial}\@abstractboxcontent\end{abstractboxsocial}
    \fi
  \fi
}

% 辅助：根据 Logo 位置选择首页样式
\newcommand{\@selectfirstpagestyle}{%
  \if@logoinheader
    \ifx\@titlelogo\@empty
      \thispagestyle{plain}%
    \else
      \thispagestyle{firstpageheaderlogo}%
    \fi
  \else
    \thispagestyle{plain}%
  \fi
}

\if@twocol
  \renewcommand{\maketitle}{%
    \twocolumn[%
      \@maketitleblock
    ]%
    \@selectfirstpagestyle
  }
\else
  \renewcommand{\maketitle}{%
    \@maketitleblock
    \@selectfirstpagestyle
  }
\fi

%% ============================================================================
%% 6. 章节格式
%% ============================================================================

\titleformat{\section}
{\normalfont\large\bfseries\heiti\color{academicblue}}
{\thesection}{1em}{}

\titleformat{\subsection}
{\normalfont\normalsize\bfseries\heiti}
{\thesubsection}{1em}{}

\titleformat{\subsubsection}
{\normalfont\normalsize\kaishu}
{\thesubsubsection}{1em}{}

\titlespacing*{\section}{0pt}{2ex plus 1ex minus .2ex}{1ex plus .2ex}
\titlespacing*{\subsection}{0pt}{1.5ex plus 1ex minus .2ex}{0.8ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{1ex plus 0.5ex minus .2ex}{0.5ex plus .2ex}

%% ============================================================================
%% 7. 定理环境
%% ============================================================================

\theoremstyle{plain}
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{proposition}[theorem]{命题}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例}

\theoremstyle{remark}
\newtheorem*{remark}{注}

%% ============================================================================
%% 8. 实用设置
%% ============================================================================

\setstretch{1.25}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.3ex plus 0.1ex minus 0.1ex}

\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.8}

\if@twocol
  \setlength{\columnsep}{1.5em}
\fi

%% ============================================================================
%% 9. cleveref 中文配置
%% ============================================================================

\crefformat{figure}{图~#2#1#3}
\crefformat{table}{表~#2#1#3}
\crefformat{equation}{式~(#2#1#3)}
\crefformat{section}{第~#2#1#3~节}
\crefformat{theorem}{定理~#2#1#3}
\crefformat{lemma}{引理~#2#1#3}
\crefformat{corollary}{推论~#2#1#3}
\crefformat{proposition}{命题~#2#1#3}
\crefformat{definition}{定义~#2#1#3}
\crefformat{example}{例~#2#1#3}
\crefformat{algorithm}{算法~#2#1#3}

\endinput
