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


return {

    s("href",
        fmta(
            [[
                \href{<>}{<>}
            ]],
            {
                i(1, "URL"), i(2, "Text")
            }
        )
    ),

    s({ trig = "env", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { i(1), i(0), rep(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "beg", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { i(1), i(0), rep(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "fig", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{figure}[!htb]
                	\centering
                	\includegraphics[width=<>]{<>.<>}
                	\caption{<>}
                	\label{fig:<>}
                \end{figure}
            ]],
            {
                i(1, "\\textwidth"),
                i(2),
                i(3, "pdf"),
                i(4),
                rep(2)
            }
        ),
        { condition = line_begin }
    ),

    s({ trig = "ffig", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{figure}[!htb]
                    \centering
                    \subcaptionbox{<>\label{fig:<>}}{\includegraphics[height=<>]{<>.<>}}
                    \hspace{<>}
                    \subcaptionbox{<>\label{fig:<>}}{\includegraphics[height=<>]{<>.<>}}
                    \caption{<>}
                    \label{fig:<>}
                \end{figure}

            ]],
            {
                i(3),
                rep(1),
                i(4, "55mm"),
                i(1),
                i(2, "pdf"),
                i(5, "10mm mimus 5mm"),
                i(8),
                rep(6),
                rep(4),
                i(6),
                i(7, "pdf"),
                i(9),
                i(10)
            }
        ),
        { condition = line_begin }
    ),

    s({ trig = "tabu", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{table}[!htb]
                	\centering
                	\caption{<>}
                	\label{tab:<>}
                	\begin{tabular}{<>}
                		<>
                	\end{tabular}
                \end{table}
            ]],
            {
                i(1), i(2), i(3), i(0)
            }
        ),
        { condition = line_begin }
    ),

    s({ trig = "tabx", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{table}[!htb]
                	\centering
                	\caption{<>}
                	\label{tab:<>}
                	\begin{tabularx}{<>}{<>}
                		<>
                	\end{tabularx}
                \end{table}
            ]],
            {
                i(1), i(2), i(3, "\\textwidth"), i(4), i(0)
            }
        ),
        { condition = line_begin }
    ),

    s({ trig = "tabl", snippetType = "autosnippet" },
        fmta(
            [[
                \toprule
                <>
                \midrule
                <>
                \bottomrule
            ]],
            {
                i(1), i(0)
            }
        ),
        { condition = line_begin }
    ),

    s({ trig = "ltab", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{longtable}{<>}
                	\caption{<>}
                	\label{tab:<>}
                	% 首页表头
                    <>
                	\endfirsthead
                	% 续页表头
                    <>
                	\endhead
                	% 前页表尾
                    <>
                	\endfoot
                	% 末页表尾
                    <>
                	\endlastfoot
                	% 表格内容
                    <>
                \end{longtable}
            ]],
            {
                i(1, "ll"),
                i(2),
                i(3),
                i(4, "\\\\ \\toprule"),
                i(5, "\\multicolumn{2}{}{（续表）} \\\\ \\midrule"),
                i(6, "\\midrule \\multicolumn{2}{r}{（接下一页表格）} \\\\"),
                i(7, "\\bottomrule"),
                i(8)
            }
        ),
        { condition = line_begin }
    )

}
