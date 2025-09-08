%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{etaremune} % For reverse numbering

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\cdot$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    %\hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \hfil{\namesize\bf \@name}\hfil\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%  CONTACT SECTION  (3 labelâ€“value pairs per row, full-width table)
%----------------------------------------------------------------------------------------
\newenvironment{rContact}{
  \vspace{-1pt}\sectionskip
  \MakeUppercase{{\bf Contact}}\vspace{-4pt}
  \begin{center}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}
      >{\bfseries}l l  >{\bfseries}l l  >{\bfseries}l l}
}{
    \end{tabular*}
  \end{center}\vspace{-4pt}
}

% Row macro: six arguments = three (label, value) pairs
\newcommand{\rContactRow}[6]{#1 & #2 & #3 & #4 & #5 & #6 \\}

%----------------------------------------------------------------------------------------
%	EDUCATION SECTION
%----------------------------------------------------------------------------------------

% Education Section
\newenvironment{rEducation}{ 
  \vspace{6pt}
  \sectionskip
  \MakeUppercase{{\bf Education}}
  \vspace{-4pt}
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
  \vspace{-8pt}
}

% Education Entry: \rEducationEntry{Institution}{Location}{Degree}{Date}
\newcommand{\rEducationEntry}[4]{
  {\bf #1} \hfill {\bf #2} \\
  #3 \hfill #4 \\[2pt]
}

%----------------------------------------------------------------------------------------
%	EXPERIENCE SECTION
%----------------------------------------------------------------------------------------

% Experience Section
\newenvironment{rExperience}{ 
  \vspace{-4pt}
  \sectionskip
  \MakeUppercase{{\bf Experience}}
  \vspace{-4pt}
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
  \vspace{-4pt}
}

% Company Entry: \rCompany{Company Name}{Location}
\newcommand{\rCompany}[2]{
  {\vspace{-2pt}}
  \ifthenelse{\equal{#1}{}}{\vspace{-5pt}}{ % If the first argument is not empty, print company name and location
    {\bf #1} \hfill {\bf #2} % Bold company name and bold location on the right
    \\
    \vspace{-12pt}
  }
}

% Position Entry: \rPosition{Title}{Date}{Bullet1}{Bullet2}{Bullet3}{Bullet4}{Bullet5}
% Use empty {} for unused bullets
\newcommand{\rPosition}[7]{
  \vspace{-8pt}
  \ifthenelse{\equal{#1}{}}{}{ % If the first argument is not specified, don't print the job title and date range line
    {#1} \hfill {#2} % Job title and date range
    \vspace{-5pt}
  }
  \smallskip
  \begin{list}{$\bullet$}{\leftmargin=20pt} % \cdot used for bullets, no indentation
    \itemsep -6pt \vspace{-5pt} % Compress items in list together
    \ifthenelse{\equal{#3}{}}{}{\item #3}
    \ifthenelse{\equal{#4}{}}{}{\item #4}
    \ifthenelse{\equal{#5}{}}{}{\item #5}
    \ifthenelse{\equal{#6}{}}{}{\item #6}
    \ifthenelse{\equal{#7}{}}{}{\item #7}
  \end{list}
  \vspace{4pt} % Some space after the list of bullet points
}

%----------------------------------------------------------------------------------------
%	PUBLICATIONS SECTION
%----------------------------------------------------------------------------------------

% Publications Section
\newenvironment{rPublications}{ 
  \vspace{4pt}
  \sectionskip
  \MakeUppercase{{\bf Publications}}
  \vspace{-4pt}
  \renewcommand{\labelenumi}{[\theenumi]}
  \begin{etaremune}[itemsep=-1pt]
}{
  \end{etaremune}
  \vspace{-4pt}
}

% Publication Entry: \rPublication{Authors}{Title}{Journal/Conference}{Date}{URL (optional)}
\newcommand{\rPublication}[5]{
  \item #1, \ifthenelse{\equal{#5}{}}{"#2,"}{\href{#5}{"#2,"}} \textit{#3}, #4.
}

%----------------------------------------------------------------------------------------
%	PRESENTATIONS AND POSTERS SECTION
%----------------------------------------------------------------------------------------

% Presentations and Posters Section
\newenvironment{rPresentationsPosters}{ 
  \vspace{6pt}
  \sectionskip
  \MakeUppercase{{\bf Presentations and Posters}}
  \vspace{-4pt}
  \renewcommand{\labelenumi}{[\theenumi]}
  \begin{etaremune}[itemsep=-1pt]
}{
  \end{etaremune}
  \vspace{-4pt}
}

% Presentation Entry: \rPresentation{Authors}{Title}{Event}{Date}{URL (optional)}
\newcommand{\rPresentation}[5]{
  \item #1, \ifthenelse{\equal{#5}{}}{"#2,"} {\href{#5}{"#2,"}} \textit{#3}, #4.
}

%----------------------------------------------------------------------------------------
%	TECHNICAL SKILLS SECTION
%----------------------------------------------------------------------------------------

% Technical Skills Section
\newenvironment{rTechnicalSkills}{ 
  \vspace{6pt}
  \sectionskip
  \MakeUppercase{{\bf Technical Skills}}
  \vspace{-1pt}
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
  \begin{tabular}{ @{} >{\bfseries}l @{\hspace{6ex}} l }
}{
  \end{tabular}
  \end{list}
  \vspace{-4pt}
}

% Skill Entry: \rSkill{Category}{Technologies}
\newcommand{\rSkill}[2]{
  #1 & #2 \\
}

%----------------------------------------------------------------------------------------
%	AWARDS AND HONORS SECTION
%----------------------------------------------------------------------------------------

% Awards and Honors Section
\newenvironment{rAwardsAndHonors}{ 
  \vspace{6pt}
  \sectionskip
  \MakeUppercase{{\bf Awards and Honors}}
  \vspace{-4pt}
  \begin{itemize}
    \itemsep -7pt
}{
  \end{itemize}
  \vspace{-4pt}
}

% Award Entry: \rAward{Award Name}{Date}
\newcommand{\rAward}[2]{
  \item #1 \hfill #2
}

% Award Entry with Description: \rAwardDesc{Award Name}{Date}{Description}
\newcommand{\rAwardDesc}[3]{
  \item #1 \hfill #2 \\#3
}

%----------------------------------------------------------------------------------------
%	ACTIVITIES SECTION
%----------------------------------------------------------------------------------------

% Activities Section
\newenvironment{rActivities}{ 
  \vspace{6pt}
  \sectionskip
  \MakeUppercase{{\bf Activities}}
  \vspace{-4pt}
  \begin{itemize}
    \itemsep -7pt
}{
  \end{itemize}
  \vspace{-4pt}
}

% Activity Entry: \rActivity{Activity Name}{Date}{Description (optional)}
\newcommand{\rActivity}[3]{
  \item #1 \hfill #2 \ifthenelse{\equal{#3}{}}{}{ \\#3}
}

%----------------------------------------------------------------------------------------
%	SPACING DEFINITIONS
%----------------------------------------------------------------------------------------

% The below commands define the whitespace after certain things in the document
\def\namesize{\Large} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\sectionskip{\smallskip} % The space after the heading section