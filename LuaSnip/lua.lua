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

local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_mathzone = require("luasnip-helper").in_mathzone

return {

    -- Common-used short commands
    s({ trig = "lsc", snippetType = "autosnippet" },
        fmta(
            [[
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

                    <>

                }
            ]],
            { i(0) }
        ),
        { condition = line_begin }
    ),

    -- Return matched captures
    s({ trig = "mm(%d)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta([[
                f( function(_, snip) return snip.captures[<>] end )
            ]],
            { f(function(_, snip) return snip.captures[1] end) }
        )
    ),

    -- Snippet for snippet
    s({ trig = "lss", snippetType = "autosnippet" },
        fmta(
            [[
                s("<>",
                    fmta(
                        <>
                            <>
                        <>,
                        {<>}
                    )
                )
            ]],
            {
                i(1),
                t("[["),
                i(2),
                t("]]"),
                i(3),
            }
        ),
        { condition = line_begin }
    ),

    -- Auto-expand snippet
    s({ trig = "lsa", snippetType = "autosnippet" },
        fmta(
            [[
                s({ trig = "<>", <>snippetType = "autosnippet" },
                    fmta(
                        <>
                            <>
                        <>,
                        {<>}
                    ),
                    { condition = <> }
                )
            ]],
            {
                i(1),
                c(2, { t(""), t("regTrig = true, wordTrig = false, ") }),
                t("[["),
                i(3),
                t("]]"),
                i(4),
                c(5, { t("line_begin"), t("in_mathzone") })
            }
        ),
        { condition = line_begin }
    )

}
