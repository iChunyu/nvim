local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
local postfix = require("luasnip.extras.postfix").postfix
-- conditions
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_mathzone = require("luasnip-helper").in_mathzone
local get_visual = require("luasnip-helper").get_visual


return {

    s({ trig = "sdoc", snippetType = "autosnippet" },
        fmta(
            [[
                \documentclass[UTF8,fontset=adobe]{ctexart}
                \input{packages}

                \begin{document}

                    \input{main}

                    % \bibliography{references}
                \end{document}
            ]],
            {}
        ),
        { condition = line_begin }
    ),

    s({ trig = "spkg", snippetType = "autosnippet" },
        fmta(
            [[
                % CTeX configuration
                \ctexset{
                    tocdepth = 2,
                    listfigurename = 插图索引,
                    listtablename = 表格索引,
                    appendix/numbering = true,
                    appendix/name = 附录,
                    appendix/number = \arabic{section}
                }

                % Date format yyyy-mm-dd
                \usepackage{datetime2}

                % Page margin
                \usepackage{geometry}
                \geometry{
                    a4paper,
                    top = 48mm,
                    bottom = 28mm,
                    left = 25mm,
                    right = 25mm
                }

                % Color and Google colors
                \usepackage[hyperref]{xcolor}

                % Footer and header of page
                \usepackage{fancyhdr}
                \pagestyle{fancy}
                \lhead{}
                \chead{}
                \rhead{}
                \cfoot{\thepage}
                \renewcommand{\headrule}{}
                \renewcommand{\footrule}{}

                % add bibliography to TOC
                \usepackage[nottoc,notlof,notlot]{tocbibind}
                \usepackage[titles]{tocloft}
                \setlength{\cftbeforesecskip}{0pt}
                % 修改目录引导点的间距
                \renewcommand{\cftdotsep}{1.5}
                % 图表索引增加前缀 Ref： https://www.latexstudio.net/archives/6202.html
                \newlength{\myfignumlen}
                \renewcommand{\cftfigpresnum}{\figurename\enspace}
                \settowidth{\myfignumlen}{\cftfigpresnum\cftfigaftersnum}
                \addtolength{\cftfignumwidth}{\myfignumlen}
                \newlength{\mytabnumlen}
                \renewcommand{\cfttabpresnum}{\tablename\enspace}
                \settowidth{\mytabnumlen}{\cfttabpresnum\cfttabaftersnum}
                \addtolength{\cfttabnumwidth}{\mytabnumlen}
                % 取消图表索引内容的缩进
                \setlength{\cftfigindent}{0pt}
                \setlength{\cfttabindent}{0pt}

                % Optimize footnotemark
                \usepackage[perpage]{footmisc}              % clear count per page
                \usepackage{pifont}                         % use number with ciecle
                \renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}}

                % Hyperlink
                \usepackage{hyperref}                       % required package
                \hypersetup{
                    hidelinks,
                    colorlinks = true,
                    pdfauthor = 肖春雨,
                    bookmarksdepth = 3
                }

                % Math
                \usepackage{amsmath}
                \usepackage{amssymb}
                \usepackage{nicematrix}
                \usepackage{newtxmath}                      % times now roam font
                \usepackage{bm}                             % bold fonts
                \numberwithin{equation}{section}

                % SI units
                \usepackage{siunitx}
                \sisetup{
                    per-mode = symbol,
                    uncertainty-mode = separate,
                    range-phrase = \ensuremath{\,\sim\,},
                    range-units = single
                }

                % Table and figure
                \usepackage{graphicx}                       % figure package
                \usepackage{tabularx}                       % fixed-width table
                \usepackage{multirow}                       % merge row
                \usepackage{booktabs}                       % standard three-line table
                \usepackage{makecell}
                \usepackage{longtable}
                \usepackage{caption}
                \usepackage{subcaption}
                \graphicspath{{./figures/}}
                \numberwithin{figure}{section}
                \numberwithin{table}{section}
                \captionsetup{labelsep = space}

                % Support user-defined styles of enumerate
                \usepackage{enumitem}

                % Biolography style
                \usepackage{gbt7714}                        % China standard style
                \bibliographystyle{gbt7714-numerical}       % numerical / author-year
                \setlength{\bibsep}{0.5ex}                  % vertical spacing between references
                \usepackage{notoccite}                      % remove citations in TOC and ensure correct numbering

                % Cross reference
                \usepackage[nameinlink]{cleveref}
                \crefname{equation}{式}{式}
                \crefname{table}{表}{表}
                \crefname{figure}{图}{图}
                \crefname{appendix}{附录}{附录}
                \crefformat{section}{#2第~#1~章#3}
                \crefformat{subsection}{#2第~#1~节#3}
                \crefformat{subsubsection}{#2第~#1~小节#3}
                \crefrangeformat{equation}{#3式~(#1)#4~\~{}~#5式~(#2)#6}
                \captionsetup[subfigure]{subrefformat=simple,labelformat=simple}
                \renewcommand\thesubfigure{\,(\alph{subfigure})}

                % override `cleardoublepage', see `fancyhdr' doc
                \makeatletter
                \def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
                \begingroup
                \mbox{}
                \vspace*{\fill}
                \begin{center}
                （此页留白）
                \end{center}
                \vspace{\fill}
                \thispagestyle{empty}
                \newpage
                \if@twocolumn\mbox{}\newpage\fi
                \endgroup\fi\fi}
                \makeatother

                % support equations to display across pages
                \allowdisplaybreaks[4]

            ]],
            {}
        ),
        { condition = line_begin }
    )

}
