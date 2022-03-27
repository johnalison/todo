#/usr/bin/env bash

_todo_completions()
{

    
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
	return
    fi
    
    COMPREPLY=($(compgen -W "$(ls |grep -v .done|grep -v todo| grep -v README)" "${COMP_WORDS[1]}"))

}

_todo_completions_itemNums()
{
    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case ${COMP_CWORD} in
	1)
	    COMPREPLY=($(compgen -W "$(ls |grep -v .done|grep -v todo| grep -v README)" -- ${cur}))
            ;;
        2)
	    echo 
	    todo-cat ${prev}
	    echo
	    COMPREPLY=($(compgen -W "$(todo-lineNums "${prev}")" -- ${cur}))
	    ;;
        *)
            COMPREPLY=(${cur})
            ;;
    esac

}


complete -F _todo_completions todo-add
complete -F _todo_completions todo-cat

complete -F _todo_completions_itemNums todo-done
complete -F _todo_completions_itemNums todo-reprio
complete -F _todo_completions_itemNums todo-rm
complete -F _todo_completions_itemNums todo-update
