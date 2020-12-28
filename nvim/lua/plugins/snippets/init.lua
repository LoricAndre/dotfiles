local snip = require'snippets'

snip.use_suggested_mappings()

snip.snippets = {
  cpp = require'plugins.snippets.cpp'
}
