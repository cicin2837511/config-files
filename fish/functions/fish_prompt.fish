function fish_prompt
    set git_branch $(git branch)
    echo -e "
\e[1;42;37m  $USER@archlinux \e[1;44;32m\e[44;37m    "(prompt_pwd)"  \e[m\e[1;41;34m \e[1;41;37m  $git_branch" "\e[m\e[1;31m"\uE0B0" "
end
