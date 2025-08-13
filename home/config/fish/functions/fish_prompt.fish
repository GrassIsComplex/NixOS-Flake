function fish_prompt
	set -q __fish_git_prompt_showupstream
	or set -g __fish_git_prompt_showupstream auto

	set_color -o green
	set_color -b green

	if functions -q fish_is_root_user; and fish_is_root_user
		set_color -o red
	else
		set_color -o white
	end

	echo -n " $USER"
	set_color -o yellow
	echo -n @

	set_color -o brblue

	echo -n (prompt_hostname)
	set_color -o white
	echo -n :(prompt_pwd)
	set_color -b normal
	set_color -o green
	echo -n '◗'

	# Vi-mode
	# The default mode prompt would be prefixed, which ruins our alignment.
	#function fish_mode_prompt
	#end

	#if test "$fish_key_bindings" = fish_vi_key_bindings
	#    or test "$fish_key_bindings" = fish_hybrid_key_bindings
	#    set -l mode
	#    switch $fish_bind_mode
	#        case default
	#            set mode (set_color --bold red)N
	#        case insert
	#            set mode (set_color --bold green)I
	#        case replace_one
	#            set mode (set_color --bold green)R
	#            echo '[R]'
	#        case replace
	#            set mode (set_color --bold cyan)R
	#        case visual
	#            set mode (set_color --bold magenta)V
	#    end
	#    set mode $mode(set_color normal)
	#    _nim_prompt_wrapper $retc '' $mode
	#end

	# nix-shell
	if test -n "$IN_NIX_SHELL"
		set_color blue
		echo -ne " ◖$(set_color normal;set_color -b blue)󱄅 nix-shell$(;set_color normal;set_color blue)◗"
		set_color normal
	end

	# git
	set -l prompt_git (fish_git_prompt '%s')
	test -n "$prompt_git"
	and set_color magenta
	and echo -n ' ◖'
	and set_color -b magenta
	and set_color yellow
	and echo -n "$prompt_git"
	and set_color -b normal
	and set_color magenta
	and echo -n '◗'
	
	# Battery status
	type -q acpi
	and acpi -a 2>/dev/null | string match -rq off
	and _nim_prompt_wrapper $retc B (acpi -b | cut -d' ' -f 4-)

	# New line
	echo

	# Background jobs
	set_color normal

	for job in (jobs)
		set_color green
		echo -n ' │ '
		set_color yellow
		echo $job
	end

	set_color normal
	set_color -o green
	echo -n ' └─'
	echo -n '$ '
	set_color normal
end
function fish_right_prompt -d "Write out the right prompt"
	set -l dnt (date "+%Y-%m-%d %H:%M:%S")
	set_color yellow
	echo -e "\e[1A◖"
	set_color -o black
	set_color -b yellow
	echo -n "$dnt"
	echo -e "\e[1B"
	set_color normal
end
