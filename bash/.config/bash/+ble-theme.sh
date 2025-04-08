# vi: ft=bash
ble-face -r region region_@
ble-face -r disabled
ble-face -r overwrite_mode
ble-face -r vbell vbell_@
ble-face -r syntax_@
ble-face -r command_@
ble-face -r filename_@
ble-face -r varname_@
ble-face -r argument_@
ble-face -r prompt_status_line
ble-face -r cmdinfo_cd_cdpath
ble-face -r auto_complete
ble-face -r menu_filter_fixed
ble-face -r menu_filter_input
ble-face -r menu_desc_default
ble-face -r menu_desc_type
ble-face -r menu_desc_quote

ble-face -s argument_error 'bg=#${color1},fg=#${color0}'            # Red background, Crust foreground for better contrast
ble-face -s argument_option 'fg=#${color15},italic'               # Flamingo
ble-face -s auto_complete 'fg=#${color14},italic'                 # Surface1
ble-face -s cmdinfo_cd_cdpath 'fg=#${color4},bg=#${color0},italic'  # Blue, Crust
ble-face -s command_alias 'fg=#${color5}'                        # Sapphire
ble-face -s command_builtin 'fg=#${color5}'                      # Peach
ble-face -s command_directory 'fg=#${color4}'                    # Blue
ble-face -s command_file 'fg=#${color4}'                         # Sapphire
ble-face -s command_function 'fg=#${color5}'                     # Sapphire
ble-face -s command_keyword 'fg=#${color13}'                      # Mauve
ble-face -s disabled 'fg=#${color10}'                             # Surface0
ble-face -s filename_directory 'fg=#${color4}'                   # Blue
ble-face -s filename_directory_sticky 'fg=#${color0},bg=#${color2}' # Crust, Green
ble-face -s filename_executable 'fg=#${color5},bold'             # Green
ble-face -s filename_ls_colors 'none'
ble-face -s filename_orphan 'fg=#${color12},bold' # Sky
ble-face -s filename_other 'none'
ble-face -s filename_setgid 'fg=#${color0},bg=#${color3},underline' # Crust, Yellow
ble-face -s filename_setuid 'fg=#${color0},bg=#${color11},underline' # Crust, Peach
ble-face -s menu_filter_input 'fg=#${color0},bg=#${color3}'         # Crust, Yellow
ble-face -s overwrite_mode 'fg=#${color0},bg=#${color4}'            # Crust, Sky
ble-face -s prompt_status_line 'bg=#${color15}'                   # Overlay2
ble-face -s region 'bg=#${color14}'                               # Surface1
ble-face -s region_insert 'bg=#${color14}'                        # Surface1
ble-face -s region_match 'fg=#${color0},bg=#${color3}'              # Crust, Yellow
ble-face -s region_target 'fg=#${color0},bg=#${color13}'             # Crust, Mauve
ble-face -s syntax_brace 'fg=#${color8}'                         # Overlay0
ble-face -s syntax_command 'fg=#${color13}'                       # Sapphire
ble-face -s syntax_comment 'fg=#${color10}'                       # Yellow
ble-face -s syntax_delimiter 'fg=#${color8}'                     # Overlay0
ble-face -s syntax_document 'fg=#${color11},bold'                 # Rosewater
ble-face -s syntax_document_begin 'fg=#${color11},bold'           # Rosewater
ble-face -s syntax_error 'bg=#${color9},fg=#${color0}'              # Red background, Crust foreground for better contrast
ble-face -s syntax_escape 'fg=#${color15}'                        # Flamingo
ble-face -s syntax_expr 'fg=#${color13}'                          # Mauve
ble-face -s syntax_function_name 'fg=#${color5}'                 # Lavender
ble-face -s syntax_glob 'fg=#${color9}'                          # Peach
ble-face -s syntax_history_expansion 'fg=#${color5},italic'      # Lavender
ble-face -s syntax_param_expansion 'fg=#${color9}'               # Red
ble-face -s syntax_quotation 'fg=#${color2}'                     # Green
ble-face -s syntax_tilde 'fg=#${color13}'                         # Mauve
ble-face -s syntax_varname 'fg=#${color11}'                       # Rosewater
ble-face -s varname_array 'fg=#${color5}'                        # Peach
ble-face -s varname_empty 'fg=#${color5}'                        # Peach
ble-face -s varname_export 'fg=#${color5}'                       # Peach
ble-face -s varname_expr 'fg=#${color5}'                         # Peach
ble-face -s varname_hash 'fg=#${color5}'                         # Peach
ble-face -s varname_number 'fg=#${color11}'                       # Rosewater
ble-face -s varname_readonly 'fg=#${color5}'                     # Peach
ble-face -s varname_transform 'fg=#${color5}'                    # Peach
ble-face -s varname_unset 'bg=#${color9},fg=#${color0}'             # Red background, Crust foreground for better contrast
ble-face -s vbell_erase 'bg=#${color14}'                          # Surface1
