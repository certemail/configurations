SYSTEMD_GRAPHICAL_TARGET=$(systemctl list-units --type target | grep -o graphical.target)
 
if [ $UID -ne 0 ] && [ "graphical.target" == "${SYSTEMD_GRAPHICAL_TARGET}" ]; then 
	export PS1='\[\033[0;31m\][\[\033[0;47m\]\u\[\033[1;3\jm\]@\[\033[0;47m\]\h\[\033[0;37m\]:\[\033[0;34m\] \w\[\033[0;31m\] ]\[\033[0;33m\]$ \[\033[0;30m\]'
fi

if [ $UID -eq 0 ] && [ "graphical.target" == "${SYSTEMD_GRAPHICAL_TARGET}" ]; then 
	export PS1='\[\033[0;31m\][\[\033[0;47m\]\u\[\033[1;3\jm\]@\[\033[0;47m\]\h\[\033[0;37m\]:\[\033[0;34m\] \w\[\033[0;31m\] ]\[\033[0;31m\]# \[\033[0;30m\]'
fi 
