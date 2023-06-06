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

    -- INFO: DoIt theme
    s({ trig = "([^%a])mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                <>{{<< math >>}}$<>${{<< /math >>}}
            ]],
            { f(function(_, snip) return snip.captures[1] end), i(1) }
        )
    ),

    s({ trig = "math", snippetType = "autosnippet" },
        fmta(
            [[
                {{<< math >>}}
                <>
                {{<< /math >>}}

            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s({ trig = "img", snippetType = "autosnippet" },
        fmta(
            [[
                <<div align=center>>
                    <<img src=<> width=<> />>
                <</div>>

            ]],
            { i(1), i(2) }
        ),
        { condition = line_begin }
    ),

    s("admonition",
        fmta(
            [[
                {{<< admonition <> >>}}
                <>
                {{<< /admonition >>}}

            ]],
            {
                i(1, "note|abstract|info|tip|success|question|warning|failure|danger|bug|quote|example"),
                i(2)
            }
        )
    ),

    s("bilibili",
        fmta(
            [[
                {{<< bilibili <> >>}}
            ]],
            { i(1) }
        )
    ),

    s("typeit",
        fmta(
            [[
                {{<< typeit >>}}
                <>
                {{<< typeit >>}}

            ]],
            { i(1) }
        )
    ),

    s({ trig = "([^%a])rr", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                <>[<>]({{<< ref "<>" >>}})
            ]],
            { f(function(_, snip) return snip.captures[1] end), i(1), i(2) }
        )
    ),

    -- INFO: Book theme
    s({ trig = "([^%a])ktex", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[
                <>{{<< katex >>}}<>{{<< /katex >>}}
            ]],
            { f(function(_, snip) return snip.captures[1] end), i(1) }
        )
    ),

    s({ trig = "katex", snippetType = "autosnippet" },
        fmta(
            [[
                {{<< katex display >>}}
                <>
                {{<< /katex >>}}

            ]],
            { i(1) }
        ),
        { condition = line_begin }
    ),

    s("columns",
        fmta(
            [[
                {{<< columns >>}}
                <>
                <<--->>

                {{<< /columns >>}}

            ]],
            { i(1) }
        )
    ),

    s("hint",
        fmta(
            [[
                {{<< hint <> >>}}
                <>
                {{<< /hint >>}}

            ]],
            { i(1, "info|warning|danger"), i(2) }
        )
    ),

    s("details",
        fmta(
            [[
                {{<< details title="<>" open=<>${2:true}] >>}}
                <>
                {{<< /details >>}}

            ]],
            { i(1), i(2, "true"), i(3) }
        )
    )
}
