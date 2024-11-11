local M = {}
function M.capitalize(str) return (str:gsub('^%l', string.upper)) end
function M.inspect(t)
  if type(t) ~= 'table' then
    return tostring(t)
  else
    print("{")
    for k, v in pairs(t) do
      print(k .. ": ".. M.inspect(v))
    end
    print("}")
  end
end
return M
