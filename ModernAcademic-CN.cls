%% ModernAcademic-CN.cls
%% A modern, professional LaTeX class for academic papers (Chinese version)
%% Designed for XeLaTeX compilation
%% https://github.com/NTU-AI4X/AI4XTemplate
%% License: MIT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ModernAcademic-CN}[2026/05/09 v2.0 Modern Academic Paper Class (Chinese)]

%% ============================================================================
%% 1. CLASS OPTIONS
%% ============================================================================

\newif\if@twocol
\@twocolfalse

\DeclareOption{singlecolumn}{\@twocolfalse}
\DeclareOption{twocolumn}{\@twocoltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}

\ExecuteOptions{singlecolumn}
\ProcessOptions\relax

\if@twocol
  \LoadClass[a4paper,10pt,twocolumn]{ctexart}
\else
  \LoadClass[a4paper,11pt]{ctexart}
\fi

%% ============================================================================
%% 2. TEMPLATE TYPOGRAPHY AND SPACING CONFIGURATION
%% ============================================================================

% Page layout
\newcommand{\MA@page@top}{2.35cm}
\newcommand{\MA@page@bottom}{2.85cm}
\newcommand{\MA@page@left}{2.5cm}
\newcommand{\MA@page@right}{2.5cm}
\newcommand{\MA@page@headheight}{14pt}
\newcommand{\MA@page@headsep}{0.5cm}
\newcommand{\MA@page@footskip}{1cm}
\newcommand{\MA@columnsep}{1.5em}

% Body text
\newcommand{\MA@body@stretch}{1.12}
\newcommand{\MA@body@parindent}{0pt}
\newcommand{\MA@body@parskip}{0.15\baselineskip}

% Lists
\newcommand{\MA@list@leftmargin}{4ex}

% Header, captions, and bibliography
\newcommand{\MA@header@font}{\small\kaishu}
\newcommand{\MA@caption@font}{small}
\newcommand{\MA@subcaption@font}{footnotesize}
\newcommand{\MA@caption@skip}{8pt}
\newcommand{\MA@bib@font}{\small}
\newcommand{\MA@bib@stretch}{0.95}
\newcommand{\MA@bib@sep}{0.15\baselineskip}

% Abstract/title block
\newcommand{\MA@abstractbox@left}{12pt}
\newcommand{\MA@abstractbox@right}{12pt}
\newcommand{\MA@abstractbox@top}{10pt}
\newcommand{\MA@abstractbox@bottom}{10pt}
\newcommand{\MA@abstractbox@font}{\small}
\newcommand{\MA@abstractbox@beforeskip}{1em}
\newcommand{\MA@abstractbox@afterskip}{1.5em}
\newcommand{\MA@title@font}{\huge\bfseries\sffamily}
\newcommand{\MA@author@font}{\large}
\newcommand{\MA@affiliation@font}{\small\itshape}
\newcommand{\MA@email@font}{\small\ttfamily}
\newcommand{\MA@title@author@skip}{1.2em}
\newcommand{\MA@author@affiliation@skip}{0.4em}
\newcommand{\MA@affiliation@email@skip}{0.2em}
\newcommand{\MA@author@abstract@preskip}{0em}
\newcommand{\MA@author@abstract@postskip}{0em}

% Section headings
\newcommand{\MA@section@scale}{1.3}
\newcommand{\MA@subsection@scale}{1.2}
\newcommand{\MA@subsubsection@scale}{1.1}
\newcommand{\MA@section@font}{\normalfont\normalsize\scalefont{\MA@section@scale}\bfseries\sffamily}
\newcommand{\MA@subsection@font}{\normalfont\normalsize\scalefont{\MA@subsection@scale}\bfseries\sffamily}
\newcommand{\MA@subsubsection@font}{\normalfont\normalsize\scalefont{\MA@subsubsection@scale}\bfseries\sffamily}
\newcommand{\MA@section@beforeskip}{2ex plus 1ex minus .2ex}
\newcommand{\MA@section@afterskip}{1ex plus .2ex}
\newcommand{\MA@subsection@beforeskip}{1.5ex plus 1ex minus .2ex}
\newcommand{\MA@subsection@afterskip}{0.8ex plus .2ex}
\newcommand{\MA@subsubsection@beforeskip}{1ex plus 0.5ex minus .2ex}
\newcommand{\MA@subsubsection@afterskip}{0.5ex plus .2ex}
\newcommand{\MA@section@needspace}{8\baselineskip}
\newcommand{\MA@subsection@needspace}{5\baselineskip}
\newcommand{\MA@subsubsection@needspace}{4\baselineskip}

%% ============================================================================
%% 3. REQUIRED PACKAGES
%% ============================================================================

% --- String manipulation (for theme color parsing) ---
\RequirePackage{xstring}

% --- Page Layout ---
\RequirePackage[
  a4paper,
  top=\MA@page@top,
  bottom=\MA@page@bottom,
  left=\MA@page@left,
  right=\MA@page@right,
  headheight=\MA@page@headheight,
  headsep=\MA@page@headsep,
  footskip=\MA@page@footskip
]{geometry}

% --- Typography ---
\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{scalefnt}

% --- Colors (load before font packages that may use xcolor) ---
\RequirePackage[table,xcdraw]{xcolor}

% --- Mathematics ---
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% --- Fonts (XeLaTeX compatible) ---
\RequirePackage{fontspec}
\RequirePackage{inter}
\RequirePackage{newpxtext}
\RequirePackage{newpxmath}
\RequirePackage[varqu,varl]{inconsolata}
\IfFontExistsTF{Inconsolatazi4}{%
  \setmonofont{Inconsolatazi4}[Scale=MatchLowercase]%
}{}

% Default theme colors
\definecolor{academicblue}{HTML}{1a2a6c}
\definecolor{linkblue}{HTML}{1a2a6c}
\definecolor{citegreen}{HTML}{2d5a27}
\definecolor{urlpurple}{HTML}{5c3566}
\definecolor{abstractbg}{HTML}{f8f9fa}
\definecolor{abstractborder}{HTML}{e9ecef}

% Theme color configuration interface
% Usage: \setthemecolor{b91c1c} (hex) or \setthemecolor{185,28,28} (RGB)
\newcommand{\setthemecolor}[1]{%
  \IfSubStr{#1}{,}{%
    \definecolor{academicblue}{RGB}{#1}%
    \definecolor{linkblue}{RGB}{#1}%
  }{%
    \definecolor{academicblue}{HTML}{#1}%
    \definecolor{linkblue}{HTML}{#1}%
  }%
}

% Color configuration interfaces for functional colors
\newcommand{\setlinkcolor}[1]{\definecolor{linkblue}{HTML}{#1}}
\newcommand{\setcitecolor}[1]{\definecolor{citegreen}{HTML}{#1}}
\newcommand{\seturlcolor}[1]{\definecolor{urlpurple}{HTML}{#1}}

% --- Colored Boxes ---
\RequirePackage[most]{tcolorbox}

% --- Tables and Figures ---
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{caption}
\RequirePackage{subcaption}

\captionsetup{
  font={\MA@caption@font},
  labelfont={bf, color=academicblue},
  labelsep=period,
  skip=\MA@caption@skip,
}

\captionsetup[sub]{
  font={\MA@subcaption@font},
  labelfont={bf},
}

% --- Hyperlinks and References ---
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

% --- Bibliography ---
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\renewcommand{\bibfont}{\MA@bib@font\setstretch{\MA@bib@stretch}}
\setlength{\bibsep}{\MA@bib@sep}

% --- Header and Footer ---
\RequirePackage{fancyhdr}

% --- Section Titles ---
\RequirePackage{titlesec}
\RequirePackage{needspace}
\RequirePackage{etoolbox}

% --- Lists ---
\RequirePackage{enumitem}
\setlist{nosep,leftmargin=\MA@list@leftmargin}

%% ============================================================================
%% 4. PAGE STYLE
%% ============================================================================

\newcommand{\@shorttitle}{}
\newcommand{\@shortauthor}{}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{firstpageheaderlogo}{%
  \fancyhf{}
  \fancyhead[R]{\@titlelogo}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{mainmatter}{%
  \fancyhf{}
  \fancyhead[L]{\MA@header@font\@shorttitle}
  \fancyhead[R]{\MA@header@font\@shortauthor}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{mainmatter}

%% ============================================================================
%% 5. TITLE AND AUTHOR COMMANDS
%% ============================================================================

\newcommand{\@affiliation}{\@empty}
\newcommand{\@email}{\@empty}
\newcommand{\@abstract}{\@empty}
\newcommand{\@titlepreskip}{0pt}
\newcommand{\@titlelogo}{\@empty}
\newcommand{\@titlelogogap}{0.3em}
\newsavebox{\MA@titlelogo@box}
\newlength{\MA@titlelogo@headheight}
\setlength{\MA@titlelogo@headheight}{\MA@page@headheight}

\newcommand{\MA@measuretitlelogo}{%
  \ifx\@titlelogo\@empty
    \setlength{\MA@titlelogo@headheight}{\MA@page@headheight}%
  \else
    \sbox{\MA@titlelogo@box}{\@titlelogo}%
    \setlength{\MA@titlelogo@headheight}{%
      \dimexpr\ht\MA@titlelogo@box+\dp\MA@titlelogo@box+5pt\relax
    }%
    \ifdim\MA@titlelogo@headheight<\MA@page@headheight
      \setlength{\MA@titlelogo@headheight}{\MA@page@headheight}%
    \fi
  \fi
}

\newcommand{\MA@syncfirstpageheadheight}{%
  \if@logoinheader
    \MA@measuretitlelogo
    \setlength{\headheight}{\MA@titlelogo@headheight}%
  \else
    \setlength{\headheight}{\MA@page@headheight}%
  \fi
}

\newcommand{\settitlelogogap}[1]{\renewcommand{\@titlelogogap}{#1}}

\newif\if@logointitle
\newif\if@logoinheader
\@logointitlefalse
\@logoinheaderfalse

\newcommand{\showlogointitle}{\@logointitletrue}
\newcommand{\hidelogointitle}{\@logointitlefalse}
\newcommand{\showlogoinheader}{\@logoinheadertrue\MA@syncfirstpageheadheight}
\newcommand{\hidelogoinheader}{\@logoinheaderfalse\MA@syncfirstpageheadheight}

\newif\ifabstractfootnotes
\abstractfootnotestrue
\newcommand{\disableabstractfootnotes}{\abstractfootnotesfalse}

\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}
\newcommand{\shortauthor}[1]{\renewcommand{\@shortauthor}{#1}}
\newcommand{\affiliation}[1]{\renewcommand{\@affiliation}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}

\newcommand{\settitlepreskip}[1]{\renewcommand{\@titlepreskip}{#1}}
\newcommand{\titlelogocontent}[1]{%
  \renewcommand{\@titlelogo}{#1}%
  \MA@syncfirstpageheadheight
}

%% ============================================================================
%% 6. TITLE PAGE DESIGN
%% ============================================================================

\tcbset{
  abstractboxbase/.style={
      enhanced,
      colback=abstractbg,
      colframe=abstractborder,
      boxrule=0.5pt,
      arc=4pt,
      left=\MA@abstractbox@left,
      right=\MA@abstractbox@right,
      top=\MA@abstractbox@top,
      bottom=\MA@abstractbox@bottom,
      fontupper=\MA@abstractbox@font,
      before skip=\MA@abstractbox@beforeskip,
      after skip=\MA@abstractbox@afterskip,
    }
}

\newtcolorbox{abstractbox}{abstractboxbase}

% By default, footnotes inside the abstract box are saved and emitted as normal
% page footnotes. If disabled in the preamble, tcolorbox keeps them at the
% bottom of the abstract box.
\RequirePackage{footnote}
\AtBeginDocument{%
  \ifabstractfootnotes
    \makesavenoteenv{abstractbox}%
  \fi
}

\newcommand{\@abstractboxcontent}{%
  \begin{center}
    {\MA@author@font\@author}%
    \ifx\@affiliation\@empty\else
      \\[\MA@author@affiliation@skip]
      {\MA@affiliation@font\@affiliation}%
    \fi
    \ifx\@email\@empty\else
      \\[\MA@affiliation@email@skip]
      {\MA@email@font\@email}%
    \fi
  \end{center}

  \ifx\@abstract\@empty\else
    \vspace{\MA@author@abstract@preskip}
    {\centering\textcolor{abstractborder}{\rule{0.3\textwidth}{0.4pt}}\par}
    \vspace{\MA@author@abstract@postskip}

    \noindent\@abstract
  \fi
}

\newcommand{\@maketitleblock}{%
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
    {\MA@title@font\color{academicblue}\@title\par}
    \vspace{\MA@title@author@skip}
  \end{center}

  \begin{abstractbox}\@abstractboxcontent\end{abstractbox}
}

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
%% 7. SECTION FORMATTING
%% ============================================================================

\titleformat{\section}
{\MA@section@font\color{academicblue}}
{\thesection}{1em}{}

\titleformat{\subsection}
{\MA@subsection@font}
{\thesubsection}{1em}{}

\titleformat{\subsubsection}
{\MA@subsubsection@font}
{\thesubsubsection}{1em}{}

\titlespacing*{\section}{0pt}{\MA@section@beforeskip}{\MA@section@afterskip}
\titlespacing*{\subsection}{0pt}{\MA@subsection@beforeskip}{\MA@subsection@afterskip}
\titlespacing*{\subsubsection}{0pt}{\MA@subsubsection@beforeskip}{\MA@subsubsection@afterskip}

\pretocmd{\section}{\Needspace{\MA@section@needspace}}{}{}
\pretocmd{\subsection}{\Needspace{\MA@subsection@needspace}}{}{}
\pretocmd{\subsubsection}{\Needspace{\MA@subsubsection@needspace}}{}{}

%% ============================================================================
%% 8. THEOREM ENVIRONMENTS
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
%% 9. UTILITY SETTINGS
%% ============================================================================

\setstretch{\MA@body@stretch}
\setlength{\parindent}{\MA@body@parindent}
\setlength{\parskip}{\MA@body@parskip}
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.8}

\if@twocol
  \setlength{\columnsep}{\MA@columnsep}
\fi

%% ============================================================================
%% 10. CHINESE CLEVER REFERENCES
%% ============================================================================

\crefname{section}{第~}{~节}
\Crefname{section}{第~}{~节}
\crefname{figure}{图}{图}
\Crefname{figure}{图}{图}
\crefname{table}{表}{表}
\Crefname{table}{表}{表}
\crefname{equation}{式}{式}
\Crefname{equation}{式}{式}
\crefname{theorem}{定理}{定理}
\Crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\Crefname{lemma}{引理}{引理}
\crefname{corollary}{推论}{推论}
\Crefname{corollary}{推论}{推论}
\crefname{proposition}{命题}{命题}
\Crefname{proposition}{命题}{命题}
\crefname{definition}{定义}{定义}
\Crefname{definition}{定义}{定义}
\crefname{example}{例}{例}
\Crefname{example}{例}{例}
\crefname{algorithm}{算法}{算法}
\Crefname{algorithm}{算法}{算法}
\crefname{listing}{代码}{代码}
\Crefname{listing}{代码}{代码}

\endinput
