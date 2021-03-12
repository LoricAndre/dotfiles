local u = require'snippets.utils'
local raw = u.match_indentation
local comm = u.force_comment
return {
  ["fori"] = raw
[[
for (int i = 0; i < $1; i++) {
  $0
}
]],
  ["while"] = raw
[[
while ($1){
  $0
}
]],
  ["main"] = raw
[[
int main(int argc, char* argv[]) {
  $0
}
]],
  ["fun"] = raw
[[
$1 $2($3) {
  // $4
  // Arguments : $3
  $0
}
]]
}
