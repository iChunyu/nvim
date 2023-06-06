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

    -- INFO: manually defined command
    s({ trig = "defibre", snippetType = "autosnippet" },
        fmta(
            [[
                \usepackage[T3,T1]{fontenc}
                \DeclareSymbolFont{tipa}{T3}{cmr}{m}{n}
                \DeclareMathAccent{\ibreve}{\mathalpha}{tipa}{16}

            ]],
            {}
        ),
        { condition = line_begin }
    ),

    -- INFO: auto-sized brackes
    s({ trig = "lr(", snippetType = "autosnippet" },
        fmta(
            [[
                \left( <> \right)
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "lr[", snippetType = "autosnippet" },
        fmta(
            [[
                \left[ <> \right]
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "lr{", snippetType = "autosnippet" },
        fmta(
            [[
                \left\{ <> \right\}
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "lr<", snippetType = "autosnippet" },
        fmta(
            [[
                \left\langle <> \right\rangle
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),


    s({ trig = "ab|", snippetType = "autosnippet" },
        fmta(
            [[
                \left\lvert <> \right\rvert
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),


    s({ trig = "no|", snippetType = "autosnippet" },
        fmta(
            [[
                \left\lVert <> \right\rVert
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    -- INFO: manual-sized brackes
    s({ trig = "b(", snippetType = "autosnippet" },
        fmta(
            [[
                \bigl( <> \bigr)
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "b2(", snippetType = "autosnippet" },
        fmta(
            [[
                \Bigl( <> \Bigr)
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "b3(", snippetType = "autosnippet" },
        fmta(
            [[
                \biggl( <> \biggr)
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "b4(", snippetType = "autosnippet" },
        fmta(
            [[
                \Biggl( <> \Biggr)
            ]],
            { d(1, get_visual) }
        ),
        { condition = in_mathzone }
    ),

    -- INFO: fonts
    s({ trig = "(%a+)rm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \mathrm{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "(%a+)bf", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \mathbf{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "(%a+)fk", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \mathfrak{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "(%a+)cl", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \mathcal{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "(%a+)sr", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \mathscr{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "(%a+)bb", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \mathbb{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)bm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \bm{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    -- INFO: hats
    s({ trig = "(%a)vec", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \vec{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)dot", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \dot{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)ddo", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \ddot{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)hat", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \hat{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)bar", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \bar{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)bre", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \breve{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)til", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \tilde{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)uli", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \underline{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)ibr", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                \ibreve{<>}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),


    -- INFO: common-used operators
    s({ trig = "ff", snippetType = "autosnippet" },
        fmta(
            [[
                \frac{<>}{<>}
            ]],
            { i(1), i(2) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "ubr", snippetType = "autosnippet" },
        fmta(
            [[
                \underbrace{<>}_{<>}
            ]],
            {
                d(1, get_visual),
                i(2)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "(.+);(.*);(.*);", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                <><><>
            ]],
            {
                f(function(_, snip) return snip.captures[1] end),
                f(
                    function(_, snip)
                        if (#snip.captures[2] == 1) then
                            return "_" .. snip.captures[2]
                        elseif (#snip.captures[2] > 1) then
                            return "_{" .. snip.captures[2] .. "}"
                        else
                            return ""
                        end
                    end
                ),
                f(
                    function(_, snip)
                        if (#snip.captures[3] == 1) then
                            return "^" .. snip.captures[3]
                        elseif (#snip.captures[3] > 1) then
                            return "^{" .. snip.captures[3] .. "}"
                        else
                            return ""
                        end
                    end
                )
            }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "([%\\{}%a]+)ii", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                <>^{-1}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),


    s({ trig = "([%\\{}%a]+)tt", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                <>^\mathrm{T}
            ]],
            {
                f(function(_, snip) return snip.captures[1] end)
            }
        ),
        { condition = in_mathzone }
    ),

    -- INFO: math environments
    s({ trig = "$$", snippetType = "autosnippet" },
        fmta(
            [[
                $$
                    <>
                $$
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "equ", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),


    s({ trig = "gat", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{gather}
                    <>
                \end{gather}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "ali", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "gad", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{gathered}
                    <>
                \end{gathered}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "aligned", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{aligned}
                    <>
                \end{aligned}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "cas", snippetType = "autosnippet" },
        fmta(
            [[
                \left\{\begin{aligned}
                    <>
                \end{aligned}\right.
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "pmat", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{pmatrix} <> \end{pmatrix}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "bmat", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{bmatrix} <> \end{bmatrix}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "Bmat", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{Bmatrix} <> \end{Bmatrix}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "vmat", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{vmatrix} <> \end{vmatrix}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "Vmat", snippetType = "autosnippet" },
        fmta(
            [[
                \begin{Vmatrix} <> \end{Vmatrix}
            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),
}
