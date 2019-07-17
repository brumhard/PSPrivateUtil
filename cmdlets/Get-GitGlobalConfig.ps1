#alias for git config
function Get-GitGlobalConfig () {
	git config --global --list --show-origin
}