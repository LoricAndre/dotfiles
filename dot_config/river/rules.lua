local r = require('river')

M = {}

M.setup = function(rules)
  for _, rule in ipairs(rules) do
    local args = {"rule-add"}

    local app_id = rule.app_id or "*"
    table.insert(args, "-app_id")
    table.insert(args, app_id)

    local title = rule.title or "*"
    table.insert(args, "-title")
    table.insert(args, title)

    table.insert(args, rule.action)

    if rule.args then
      table.insert(args, rule.args)
    end
    require('river').dispatch(table.unpack(args))
  end
end

return M
