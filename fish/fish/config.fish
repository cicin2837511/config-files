if status is-interactive

alias v=vim
alias ls="eza -lah"
alias doom="~/.emacs.d/bin/doom"
alias wi="vim vimwiki/index.wiki"
alias clear="cleartwo; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo" 
export TERM=xterm-256color

set fish_greeting
neofetch

# starship init fish | source
end


