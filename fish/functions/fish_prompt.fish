function fish_prompt -d Hydro
    set _hydro_color_pwd "\x1b[31m"
    set _hydro_color_git "\x1b[34m"
    set _hydro_color_duration "\x1b[32m"
    set _hydro_prompt "\x1b[35m\uF061"
    string unescape "$_hydro_color_pwd$_hydro_pwd\x1b[0m $_hydro_color_git$$_hydro_git\x1b[0m$_hydro_color_duration$_hydro_cmd_duration\x1b[0m$_hydro_prompt\x1b[0m "
end
