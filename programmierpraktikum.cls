% @file		programmierpraktikum.cls
%
% @brief	Dokumentklasse fuer das Programmierpraktikum
%
% @author Tobias Witt, Institut für Informatik, HHU Düsseldorf nach Vorlage von Kim-Thomas Möller
%
\ProvidesClass{programmierpraktikum}

\LoadClass[pdftex,10pt,a4paper,oneside,notitlepage]{article}

% packages
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[ngerman]{babel}
\usepackage{ifthen}
\usepackage[sort]{cite}
\usepackage{color}

\usepackage{mathpazo} % mathpazo schriftart

\usepackage{eurosym} % use €
\usepackage{minted} % minted syntax highlighting - requires additional configuration! comment out, if not needed

\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}

\usepackage{array} % Better tabulars

\usepackage[pdftex,xdvi]{graphicx}
\usepackage{thumbpdf} %thumbs fuer Pdf
\usepackage[bookmarksnumbered=true,pdftex,plainpages=false,pdfpagelabels,colorlinks]{hyperref}

% variables
\global\let\@vorlesung\@empty
\global\let\vorlesung\relax
\def\vorlesung#1{\gdef\@vorlesung{#1}}
\def\@vorlesung{\@latex@warning@no@line{No \noexpand\vorlesung given}}

\global\let\@semester\@empty
\global\let\semester\relax
\def\semester#1{\gdef\@semester{#1}}
\def\@semester{\@latex@warning@no@line{No \noexpand\semester given}}

\global\let\@betreuer\@empty
\global\let\betreuer\relax
\def\betreuer#1{\gdef\@betreuer{#1}}
\def\@betreuer{\@latex@warning@no@line{No \noexpand\betreuer given}}

\global\let\@subtitle\@empty
\global\let\subtitle\relax
\def\subtitle#1{\gdef\@subtitle{#1}}

% configuration
\graphicspath{{./images/}}

% uebungstitel
\newcommand{\uebungstitel}{%
\noindent
\begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
  \begin{minipage}[l]{4cm}
    \raggedright
    \includegraphics[width=4cm]{unilogo}
    \end{minipage}&
    \begin{minipage}[r]{8cm}
    \raggedleft
    \bfseries
    Universit\"at D\"usseldorf\\
    Mathematisch-Naturwissenschaftliche Fakult\"at\\
    Institut f\"ur Informatik\\
    \normalfont
    \@betreuer
  \end{minipage}
\end{tabular*}
\section*{\centering \@vorlesung\ im \@semester\\\small \@subtitle}
}
\renewcommand{\maketitle}{\uebungstitel}
