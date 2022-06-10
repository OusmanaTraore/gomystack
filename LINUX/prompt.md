1. adding a bell 
	```
	PS1="\[\a\]\$ "
	```
2. time and hostname
	```
	PS1="\A \h \$ "
	```
3. time , working directory and hostname
	```
	 PS1="|\A|\w |  @\h |$> "
	```
4. color the prompt
	```
	PS1="\[\033[1;44m|\A|\033[0;37m \033[0;32m \w \033[0;37m |  @\h \033[1;33m |$> \[\033[0m\]"
	```
5. top bar with clock
	```
	PS1="\[\033[s\033[0;0H\033[0;46m\033[K\033[1;33m\t\033[0m\033[u\] <\u@\h \W>\$ "
	```
6. final prompt personalized
	```
	PS1="\[\033[s\033[0;0H\033[0;46m\033[K\033[1;33m\t\033[0m\033[u\]\033[0;33m|\u\033[0;37m@\033[0;36m\h\033[0;32m|\w|\033[1;33m\$>\033[0m\]"
	```
