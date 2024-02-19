export XDG_CONFIG_HOME=/XDG_DIRS/config
export XDG_DATA_HOME=/XDG_DIRS/local/share
export XDG_STATE_HOME=/XDG_DIRS/local/state
export XDG_CACHE_HOME=/XDG_DIRS/cache

if [ ! -w "/XDG_DIRS/config/gh" ] || [ ! -w "/XDG_DIRS/config/github-copilot"] || [ ! -w "/XDG_DIRS/local/share/zoxide"]; then
	echo "XDG_DIRS is not writable, please enter your password to enable read/write/execute permissions"
	sudo chmod -R o+rwx /XDG_DIRS
fi
