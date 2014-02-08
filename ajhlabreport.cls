\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ajhlabreport}[2012/10/10 Alex's lab report]

\LoadClass[article,letterpaper]{memoir}

\RequirePackage{booktabs}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{commath,amsmath,cancel}
\RequirePackage[free-standing-units]{siunitx}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{type1cm,microtype}
\RequirePackage{pdfpages,listings}
\RequirePackage{lastpage}
\RequirePackage[hidelinks]{hyperref}

\newif\ifuse@dsp
\DeclareOption{dsp}{\use@dsptrue}
\ProcessOptions\relax

\ifuse@dsp\RequirePackage{ajhdsp}\fi

\lstset{basicstyle={\ttfamily\footnotesize},
breakatwhitespace=true,
breaklines=true,
columns=fullflexible,
frame=single,
numbers=left,
stepnumber=5,
showstringspaces=false,
keepspaces=true,
firstnumber=1,
numberfirstline=false,
lineskip={-1.5pt},
}

\lstdefinestyle{MATLABcode}{
commentstyle={\color[rgb]{0.133,0.545,0.133}},
keywordstyle={\color[rgb]{0,0,1}},
stringstyle={\color[rgb]{0.627,0.126,0.941}},
language=Matlab}




% FANCY HEADERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makehead}[4]{\makeevenhead{#1}{#2}{#3}{#4}\makeoddhead{#1}{#2}{#3}{#4}}
\newcommand{\makefoot}[4]{\makeevenfoot{#1}{#2}{#3}{#4}\makeoddfoot{#1}{#2}{#3}{#4}}

% title page
\makehead{plain}{}{}{}
\makefoot{plain}{}{}{}

% default pages
\makepagestyle{default}
\makehead{default}{\textsl{\@class{}}}{\textsl{\@pretitle{}: \@title{}}}{\textsl{\@author}}
\makefoot{default}{}{\textsl{Page \thepage{} of \pageref*{LastPage}}}{}



% FANCY TITLE PAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@class}{}
\newcommand{\class}[1]{\renewcommand{\@class}{#1}}

\newcommand{\@pretitle}{}
\renewcommand{\pretitle}[1]{\renewcommand{\@pretitle}{#1}}

\newcommand{\@datedue}{}
\newcommand{\datedue}[1]{\renewcommand{\@datedue}{#1}}

\newcommand{\@authorphoto}{}
\newcommand{\authorphoto}[1]{\renewcommand{\@authorphoto}{#1}}

\newcommand{\@teaminfo}{}
\newcommand{\teaminfo}[1]{\renewcommand{\@teaminfo}{#1}}

\newcommand{\@submittedto}{}
\newcommand{\submittedto}[1]{\renewcommand{\@submittedto}{#1}}

\newcommand{\@school}{\href{http://mtu.edu/}{Michigan Technological University}}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}

\renewcommand{\maketitle}{
\thispagestyle{plain}
\begingroup
	{\noindent\LARGE\@pretitle} \par
	\vspace{0.25in}
	{\noindent\Huge\@title} \par
	\vspace{0.5in}
	{\noindent\@authorphoto} \par
	\vspace{0.25in}
	{\noindent\@author\@teaminfo} \par
	\vspace{1in}
	\noindent{}Submitted to \@submittedto{} for \@class{} \par
	\vspace{1em}
	\noindent{}Due \@datedue\par
	\vfill
	%\renewcommand{\contentsname}{Contents:}\tableofcontents*
	\vfill
	\centering\noindent\@school\par
\endgroup
\cleardoublepage
\pagenumbering{arabic}
}

\setsecnumdepth{book}

% If the new pagestyle isn't set in this way (also, if we redefine \@maketitle
% instead of \maketitle), the page style doesn't apply to the first page after
% the title page.
\AtBeginDocument{

	% Subfigure support in memoir
	% http://tex.stackexchange.com/questions/48837/subcaption-package-incompatible-with-memoir-class
	% http://tex.stackexchange.com/questions/1215/is-it-possible-to-use-hyperref-subfigure-and-memoir-together
	\newsubfloat{figure}
	\providecommand*{\subfigureautorefname}{Figure}

	\pagestyle{default}
	\pagenumbering{roman}
}

% vim: filetype=tex
