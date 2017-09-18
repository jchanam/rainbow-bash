
# Imports
source ${RBW_PLUGINS}/git/init.sh
source ${RBW_PLUGINS}/kubernetes/init.sh

# This is a hack for the colors. Colors need to be between \[\],
# if you return from "get_git_info" \[$RBW_BR_RED\]$rbw_git_branch  then
# Bash can't interpret those brackets and will cause problems

get_git_color(){
    if [[ $rbw_git_is_repo == 1 ]]; then
        if [[ $rbw_git_dirty == 1 ]]; then
            echo -en "$RBW_R_RED"
        else
            echo -en "$RBW_R_GREEN"
        fi
    fi
}

get_git_info(){
    if [[ $rbw_git_is_repo == 1 ]]; then
        if [[ $rbw_git_dirty == 1 ]]; then
            echo -en " $rbw_git_branch "
        else
            echo -en " $rbw_git_branch "
        fi
    fi
}

get_k8s_info(){
  echo -en "$rbw_k8s_context"
}

RBW_THEME="\
┌\[$RBW_R_BLUE\][\$(get_k8s_info)] \
\[$RBW_RESET_ALL\]\w \
\[\$(get_git_color)\]\$(get_git_info) \
\[$RBW_R_RED\]\[\033[\$((COLUMNS-10))G\] [\t]
\[$RBW_RESET_ALL\]└\$ "

PS1=${RBW_THEME}
