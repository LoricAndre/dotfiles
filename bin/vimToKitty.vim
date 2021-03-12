" To be sourced from a new buffer

let line="background " . synIDattr(hlID("Normal"), "bg")
put= line
let line="foreground " . synIDattr(hlID("Normal"), "fg")
put= line
let line="selection_background " . synIDattr(hlID("Normal"), "fg")
put= line
let line="selection_foreground " . synIDattr(hlID("Normal"), "bg")
put= line
let line="cursor " . eval("g:terminal_color_2")
put= line

let count=0
while count < 16
  let variable_name = "g:terminal_color_" . count
  let line="color" . count . " " . eval(variable_name)
  put= line
  let count = count + 1
endwhile
