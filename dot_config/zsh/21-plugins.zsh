ZSH_PLUGINS_PATH="/usr/share/zsh/plugins/"
for d in $ZSH_PLUGINS_PATH/*; do
  plugin=$(basename $d)
  . $ZSH_PLUGINS_PATH/$plugin/$plugin.zsh
done
