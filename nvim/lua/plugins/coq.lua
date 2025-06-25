return {
  'ms-jpq/coq_nvim',
  dependencies = {
    {
      'ms-jpq/coq.thirdparty',
      main = 'coq_3p',
      config = function()
        require('coq_3p')({
          { src = 'nvimlua', short_text = 'nlua' },
          { src = 'bc',      short_name = 'math', precision = 6 },
          { src = 'figlet',  short_name = 'ban' },
        })
      end
    }
  },
  cond = function() return vim.g.completion == 'coq' end,
  build = ':COQdeps',
  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      keymap = {
        recommended = true,
        pre_select = false,
        ['repeat'] = 'g.'
      },
      clients = {
        snippets = {
          warn = {}
        }
      }
    }
  end
}
