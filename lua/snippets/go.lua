local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

return {
  -- s("iferr", {
  --   t({ "if err != nil {", "\treturn " }), i(1, "nil"), t({ ", err", "}" })
  -- }),
  s("iferr", {
    t({ "if err != nil {", "\t" }), i(0), t({ "", "}" })
  }),
}
