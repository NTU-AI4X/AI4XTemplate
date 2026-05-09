%% ModernAcademic-EN.cls
%% A modern, professional LaTeX class for academic papers (English version)
%% Designed for pdfLaTeX compilation
%% https://github.com/NTU-AI4X/AI4XTemplate
%% License: MIT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ModernAcademic-EN}[2026/05/09 v2.0 Modern Academic Paper Class (English)]

%% ============================================================================
%% 1. CLASS OPTIONS
%% ============================================================================

\newif\if@twocol
\@twocolfalse

\DeclareOption{singlecolumn}{\@twocolfalse}
\DeclareOption{twocolumn}{\@twocoltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{singlecolumn}
\ProcessOptions\relax

% Load base class
\if@twocol
  \LoadClass[a4paper,10pt,twocolumn]{article}
\else
  \LoadClass[a4paper,11pt]{article}
\fi

%% ============================================================================
%% 2. TEMPLATE TYPOGRAPHY AND SPACING CONFIGURATION
%% ============================================================================

% Page layout
\newcommand{\MA@page@top}{2.35cm}                % Top page margin.
\newcommand{\MA@page@bottom}{2.85cm}             % Bottom page margin.
\newcommand{\MA@page@left}{2.5cm}                % Left page margin.
\newcommand{\MA@page@right}{2.5cm}               % Right page margin.
\newcommand{\MA@page@headheight}{14pt}           % Fallback header box height when no header logo is shown.
\newcommand{\MA@page@headsep}{0.5cm}             % Distance between header and text body.
\newcommand{\MA@page@footskip}{1cm}              % Distance from text body to footer baseline.
\newcommand{\MA@columnsep}{1.5em}                % Gap between columns in twocolumn mode.

% Body text
\newcommand{\MA@body@stretch}{1}               % Global line-spacing multiplier.
\newcommand{\MA@body@parindent}{0pt}             % Paragraph first-line indentation.
\newcommand{\MA@body@parskip}{0.3\baselineskip}  % Extra vertical space between paragraphs.

% Lists
\newcommand{\MA@list@leftmargin}{4ex}            % Default itemize/enumerate left indentation.

% Header, captions, and bibliography
\newcommand{\MA@header@font}{\small\itshape}     % Running header font for \shorttitle and \shortauthor.
\newcommand{\MA@caption@font}{small}             % Figure/table caption body font size.
\newcommand{\MA@subcaption@font}{footnotesize}   % Subfigure/subtable caption font size.
\newcommand{\MA@caption@skip}{8pt}               % Space between float content and caption.
\newcommand{\MA@bib@font}{\small}                % Bibliography entry font size.
\newcommand{\MA@bib@stretch}{0.95}               % Line-spacing multiplier inside each bibliography entry.
\newcommand{\MA@bib@sep}{0.15\baselineskip}      % Space between bibliography entries.

% Abstract/title block
\newcommand{\MA@abstractbox@left}{12pt}          % Abstract box left inner padding.
\newcommand{\MA@abstractbox@right}{12pt}         % Abstract box right inner padding.
\newcommand{\MA@abstractbox@top}{10pt}           % Abstract box top inner padding.
\newcommand{\MA@abstractbox@bottom}{10pt}        % Abstract box bottom inner padding.
\newcommand{\MA@abstractbox@font}{\small}        % Base font size inside the abstract box.
\newcommand{\MA@abstractbox@beforeskip}{1em}     % Space before the abstract box.
\newcommand{\MA@abstractbox@afterskip}{1.5em}    % Space after the abstract box.
\newcommand{\MA@title@font}{\huge\bfseries\sffamily} % Paper title font.
\newcommand{\MA@author@font}{\large}             % Author names font.
\newcommand{\MA@affiliation@font}{\small\itshape} % Affiliation line font.
\newcommand{\MA@email@font}{\small\ttfamily}     % Email line font.
\newcommand{\MA@title@author@skip}{1.2em}        % Space between title and author block.
\newcommand{\MA@author@affiliation@skip}{0.4em}  % Space between author names and affiliation.
\newcommand{\MA@affiliation@email@skip}{0.2em}   % Space between affiliation and email.
\newcommand{\MA@author@abstract@preskip}{0em}    % Space before divider between author block and abstract.
\newcommand{\MA@author@abstract@postskip}{0em}   % Space after divider before abstract text.

% Section headings
\newcommand{\MA@section@scale}{1.3}             % Section title size multiplier relative to body text.
\newcommand{\MA@subsection@scale}{1.2}          % Subsection title size multiplier relative to body text.
\newcommand{\MA@subsubsection@scale}{1.1}       % Subsubsection title size multiplier relative to body text.
\newcommand{\MA@section@font}{\normalfont\normalsize\scalefont{\MA@section@scale}\bfseries\sffamily} % Section title font.
\newcommand{\MA@subsection@font}{\normalfont\normalsize\scalefont{\MA@subsection@scale}\bfseries\sffamily} % Subsection title font.
\newcommand{\MA@subsubsection@font}{\normalfont\normalsize\scalefont{\MA@subsubsection@scale}\bfseries\sffamily} % Subsubsection title font.
\newcommand{\MA@section@beforeskip}{2ex plus 1ex minus .2ex} % Space before section headings.
\newcommand{\MA@section@afterskip}{1ex plus .2ex} % Space after section headings.
\newcommand{\MA@subsection@beforeskip}{1.5ex plus 1ex minus .2ex} % Space before subsection headings.
\newcommand{\MA@subsection@afterskip}{0.8ex plus .2ex} % Space after subsection headings.
\newcommand{\MA@subsubsection@beforeskip}{1ex plus 0.5ex minus .2ex} % Space before subsubsection headings.
\newcommand{\MA@subsubsection@afterskip}{0.5ex plus .2ex} % Space after subsubsection headings.
\newcommand{\MA@section@needspace}{8\baselineskip}
\newcommand{\MA@subsection@needspace}{5\baselineskip}
\newcommand{\MA@subsubsection@needspace}{4\baselineskip}

%% ============================================================================
%% 3. REQUIRED PACKAGES
%% ============================================================================

% --- Encoding ---
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

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

% --- Mathematics (load before newpxmath to avoid conflicts) ---
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% --- Fonts (pdfLaTeX compatible) ---
\RequirePackage{inter}
\RequirePackage{newpxtext}
\RequirePackage{newpxmath}
\RequirePackage[varqu,varl]{inconsolata}

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
  \IfSubStr{#1}{,}{% RGB format: R,G,B
    \definecolor{academicblue}{RGB}{#1}%
    \definecolor{linkblue}{RGB}{#1}%
  }{% Hex format: RRGGBB (without #)
    \definecolor{academicblue}{HTML}{#1}%
    \definecolor{linkblue}{HTML}{#1}%
  }%
}

% Color configuration interfaces for functional colors
% Usage: \setlinkcolor{0000FF}
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
\bibliographystyle{unsrtnat}
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

% First page style with optional logo in header
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% First page style with logo in header right
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

% Setter for the gap between logo and title
\newcommand{\settitlelogogap}[1]{\renewcommand{\@titlelogogap}{#1}}

% Logo position toggles: title and first-page header are independent.
\newif\if@logointitle
\newif\if@logoinheader
\@logointitlefalse
\@logoinheaderfalse

% User commands to enable logo in specific positions
\newcommand{\showlogointitle}{\@logointitletrue}
\newcommand{\hidelogointitle}{\@logointitlefalse}
\newcommand{\showlogoinheader}{\@logoinheadertrue\MA@syncfirstpageheadheight}
\newcommand{\hidelogoinheader}{\@logoinheaderfalse\MA@syncfirstpageheadheight}

% Control whether abstract-box footnotes are promoted to normal page footnotes.
\newif\ifabstractfootnotes
\abstractfootnotestrue
\newcommand{\disableabstractfootnotes}{\abstractfootnotesfalse}

\newcommand{\shorttitle}[1]{\renewcommand{\@shorttitle}{#1}}
\newcommand{\shortauthor}[1]{\renewcommand{\@shortauthor}{#1}}
\newcommand{\affiliation}[1]{\renewcommand{\@affiliation}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}

% Title preskip configuration (for logo/institution space above title)
% Usage: \settitlepreskip{2cm}
\newcommand{\settitlepreskip}[1]{\renewcommand{\@titlepreskip}{#1}}

% Title logo content configuration (institution logo above title)
% Usage: \titlelogocontent{\includegraphics[height=3em]{logo.png}}
%        or \titlelogocontent{...TikZ code...}
\newcommand{\titlelogocontent}[1]{%
  \renewcommand{\@titlelogo}{#1}%
  \MA@syncfirstpageheadheight
}

%% ============================================================================
%% 6. TITLE PAGE DESIGN
%% ============================================================================

% Base abstract box style
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

% Abstract box without overlay
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

% Internal command to render abstract box content
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
  % Pre-title space and logo (only if enabled for title position)
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

% Helper to select first page style based on logo position
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
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}

\theoremstyle{remark}
\newtheorem*{remark}{Remark}

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

\endinput
