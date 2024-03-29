local home = vim.fn.expand('~/wiki')
local tk = require'telekasten'
local nmap = require'utils'.nmap

nmap {'<leader>kp', tk.panel}
nmap {'<leader>kf', tk.find_notes}
nmap {'<leader>kt', tk.show_tags}
nmap {'<leader>ka', tk.search_notes}
nmap {'<leader>kl', tk.insert_link}
nmap {'<leader>kg', tk.follow_link}
nmap {'<leader>kn', tk.new_templated_note}
nmap {'<leader>ki', tk.insert_img_link}
nmap {'<leader>ki', tk.preview_img}
nmap {'<leader>kr', tk.rename_note}

return tk.setup {
  home = home,
  take_over_my_home = true,
  auto_set_filetype = true,
  dailies      = home .. '/' .. 'daily',
  weeklies     = home .. '/' .. 'weekly',
  templates    = home .. '/' .. 'templates',
  img_subdir = 'images',
  extension = '.md',
  new_note_filename = 'title',
  uuid_type = '%Y-%m-%d_%H:%M:%S',
  uuid_sep = '-',
  follow_creates_nonexisting = true,
  dailies_create_nonexisting = true,
  weeklies_create_nonexisting = true,
  -- skip telescope prompt for goto_today and goto_thisweek
  journal_auto_open = false,
  -- template for new notes (new_note, follow_link)
  -- set to `nil` or do not specify if you do not want a template
  template_new_note = home .. '/' .. 'templates/new_note.md',
  -- template for newly created daily notes (goto_today)
  -- set to `nil` or do not specify if you do not want a template
  template_new_daily = home .. '/' .. 'templates/daily.md',
  -- template for newly created weekly notes (goto_thisweek)
  -- set to `nil` or do not specify if you do not want a template
  template_new_weekly= home .. '/' .. 'templates/weekly.md',
  -- image link style
  -- wiki:     ![[image name]]
  -- markdown: ![](image_subdir/xxxxx.png)
  image_link_style = "markdown",
  -- default sort option: 'filename', 'modified'
  sort = "filename",
  -- integrate with calendar-vim
  plug_into_calendar = true,
  calendar_opts = {
    -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
    weeknm = 1,
    -- use monday as first day of week: 1 .. true, 0 .. false
    calendar_monday = 1,
    -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
    calendar_mark = 'left-fit',
  },
  -- telescope actions behavior
  close_after_yanking = false,
  insert_after_inserting = true,
  -- tag notation: '#tag', ':tag:', 'yaml-bare'
  tag_notation = "#yaml-bare",
  -- command palette theme: dropdown (window) or ivy (bottom panel)
  command_palette_theme = "ivy",
  -- tag list theme:
  -- get_cursor: small tag list at cursor; ivy and dropdown like above
  show_tags_theme = "ivy",
  -- when linking to a note in subdir/, create a [[subdir/title]] link
  -- instead of a [[title only]] link
  subdirs_in_links = true,
  -- template_handling
  -- What to do when creating a new note via `new_note()` or `follow_link()`
  -- to a non-existing note
  -- - prefer_new_note: use `new_note` template
  -- - smart: if day or week is detected in title, use daily / weekly templates (default)
  -- - always_ask: always ask before creating a note
  template_handling = "smart",
  -- path handling:
  --   this applies to:
  --     - new_note()
  --     - new_templated_note()
  --     - follow_link() to non-existing note
  --   it does NOT apply to:
  --     - goto_today()
  --     - goto_thisweek()
  --   Valid options:
  --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
  --              all other ones in home, except for notes/with/subdirs/in/title.
  --              (default)
  --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
  --                    except for notes with subdirs/in/title.
  --     - same_as_current: put all new notes in the dir of the current note if
  --                        present or else in home
  --                        except for notes/with/subdirs/in/title.
  new_note_location = "smart",
  -- should all links be updated when a file is renamed
  rename_update_links = true,
}
