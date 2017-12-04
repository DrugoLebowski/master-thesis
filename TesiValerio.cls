\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{TesiValerio}[2008/02/13 v1.0 Tesi - Valerio]

\LoadClass[a4paper,12pt,oneside,italian]{memoir}

% Si utilizza la sillabazione italiana
\RequirePackage[italian]{babel}
% Load graphicx
\RequirePackage{graphicx}
% Line spacing
\RequirePackage{setspace}

% pacchetti per i font
\usepackage[T1]{fontenc}
\usepackage{color}
% interlinea
\linespread{1.4}
% margini (la dimensione del blocco di testo viene regolata di conseguenza)
\setlrmarginsandblock{3cm}{3.5cm}{*}
% profondità dell'indice (settato per stampare fino alle sottosezioni)
\setcounter{tocdepth}{3}
% numera parti, capitoli, sezioni, sottosezioni e sotto-sottosezioni
\maxsecnumdepth{subsubsection}
\setsecnumdepth{subsubsection}

% header personalizzati
\let\footruleskip\relax % for compatibility of memoir and fancyhdr
\let\rm\rmfamily        % for compatibility of memoir and blindtext (demo only)
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\addtolength{\headheight}{14pt}
\fancyhead[R]{\textbf{\thepage}}
\fancyhead[L]{\textbf{\leftmark}}

% AnnoAccademico (Anno/Anno+1)
\newcommand{\@annoAccademico}{2016/2017}
\newcommand{\annoAccademico}[1]{\renewcommand{\@annoAccademico}{#1}}
% Autore 
\newcommand{\@autore}{Cognome Nome}
\newcommand{\autore}[1]{\renewcommand{\@autore}{#1}}
% Titolo
\newcommand{\@titolo}{Titolo della tesi}
\newcommand{\titolo}[1]{\renewcommand{\@titolo}{#1}}
% Matricola 
\newcommand{\@matricola}{000000}
\newcommand{\matricola}[1]{\renewcommand{\@matricola}{#1}}
% Relatore (Titolo Nome Cognome, es: Prof. Pippo Caruso)
\newcommand{\@relatore}{Prof. Nome Cognome}
\newcommand{\relatore}[1]{\renewcommand{\@relatore}{#1}}
% Correlatore (Titolo Nome Cognome, es: Dott. Pippo Caruso)
\newcommand{\@correlatore}{}
\newcommand{\correlatore}[1]{\renewcommand{\@correlatore}{#1}}
% Dedica
\newcommand{\@dedica}{}
\newcommand{\dedica}[1]{\renewcommand{\@dedica}{#1}}

% Generazione del FRONTESPIZIO
\newcommand{\generaFrontespizio}{
	\thispagestyle{empty}
	\begin{center}
		\vspace{-20mm}
		\large {UNIVERSIT\`{A} DEGLI STUDI DI PERUGIA\\ Dipartimento di Matematica ed Informatica} 
		\vspace{5mm}
		\begin{center}
			\includegraphics[width=0.30\textwidth]{figure/unipg.png}
		\end{center}
		\vspace{5mm}
		{\Large Corso di Laurea Magistrale in Informatica} \\
		\vspace{20mm}
		{\LARGE Tesi Di Laurea} \\
		\vspace{10mm}
		{\HUGE \@titolo} \\
		\vspace{20mm}
%
% scommenta questo blocco...
%
%		{\large Relatore \\ \textbf{\@relatore}} \\
%
% ... oppure scommenta questo blocco
%
      \begin{tabular}{c  @{\hspace{2.5cm}}  c}
       \large Laureando & \large Relatore \\
       {\textbf{\@autore}} & {\textbf{\@relatore}}\\
       {\textbf{Matricola \@matricola}} & 
      \end{tabular} \\
\vspace{15mm}
		\vfill
		{\large Anno Accademico \@annoAccademico} \\
	\end{center}
	\newpage 
}

% Generazione della DEDICA (posizionata ad un terzo della pagina)
\newcommand{\generaDedica}{
   \thispagestyle{empty}
   \null\vspace{\stretch{1}}
   \begin{flushright}
      \emph{{\@dedica}}
   \end{flushright}
   \vspace{\stretch{2}}\null
   \newpage
}

% Comandi riguardanti l'inserimento di capitoli
\newcommand{\cchapter}[1]{\chapter[#1]{\centering #1}}
\newcommand{\introduzione}[1]{\newpage \chapter{Introduzione} \input{#1}}
\newcommand{\conclusioni}[1]{\newpage \chapter{Conclusioni} \markboth{CONCLUSIONI}{CONCLUSIONI} \input{#1}}
\newcommand{\ringraziamenti}[1]{\newpage \cchapter{Ringraziamenti} \input{#1}}
\newcommand{\capitolo}[2]{\newpage \chapter{#1}\label{cap:#2}\input{#2}}

% Comandi riguardanti la generazione di indici
\newcommand{\generaIndice}{
	%\fancyhead[L]{\textbf{\rightmark}}
	\newpage
	\tableofcontents
	\clearpage
	%\fancyhead[L]{\textbf{\leftmark}}
}
\newcommand{\generaIndiceTabelle}{\newpage \listoftables}
\newcommand{\generaIndiceFigure}{\newpage \listoffigures}

% Bibliografia in ordine alfabetico
\let \OldBib \bibliography
\renewcommand{\bibliography}[1]{\newpage \markboth{Bibliografia}{Bibliografia} \OldBib{#1}}
\bibliographystyle{alpha}
