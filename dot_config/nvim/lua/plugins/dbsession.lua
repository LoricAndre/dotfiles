return {
  'glepnir/dbsession.nvim',
  cond = false,
  cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad' },
  opts = {
    auto_save_on_exit = true
  }
}
