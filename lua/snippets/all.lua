local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

return {
  -- Personal Details
  s("zj", {
    t("Zachary Jensen")
  }),
  s("mrz", {
    t("mrzacharyjensen")
  }),
}
