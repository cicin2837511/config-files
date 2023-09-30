if status is-interactive
    # Commands to run in interactive sessions can go here

alias v=vim
alias ls="eza -lah"
alias wi="vim vimwiki/index.wiki"
export TERM=xterm-256color

set fish_greeting

neofetch

alias clear="cleartwo; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo" 


end


