export EDITOR=vim

if [ -z "$PROFILESOURCED" ] && [ "$PS1" ]; then
  PROFILESOURCED="Y"
fi

eval "$(zoxide init bash)"
