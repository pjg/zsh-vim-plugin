vim_commands=(vi vim gvim mvim nvim)

_run_vim_wrapper() {
	local cmd
	for arg in $@; do
		cmd="$cmd \"${arg/:/\" \"+:}\""
	done
	eval $cmd
}

for cmd in $vim_commands; do
	eval "function ${cmd}_wrapper () { _run_vim_wrapper $cmd \$@}"
	alias $cmd=${cmd}_wrapper
done
