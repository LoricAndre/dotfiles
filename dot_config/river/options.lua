local r = require('river')
local C = require('constants')

local setup = function(opts)
  for opt, value in pairs(opts) do
    if type(value) == 'table' then
      for k, v in pairs(value) do
        if type(k) == 'number' then
          r.dispatch(opt, v)
        else
          r.dispatch(opt, k, v)
        end
      end
    else
      r.dispatch(opt, value)
    end
  end
  for k, v in pairs(C.colors) do
    r.dispatch(k, v)
  end
end

return {
  setup = setup
}
