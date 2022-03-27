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
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
	echo 
	todo-cat "${COMP_WORDS[1]}"
	echo
	#complete -W "$(todo-lineNums "${COMP_WORDS[1]}")" "${COMP_WORDS[0]}" "${COMP_WORDS[1]}"
	#COMPREPLY=($(compgen -W "$(todo-lineNums "${COMP_WORDS[1]}")" "${COMP_WORDS[1]}"))
	return
    fi
    
    COMPREPLY=($(compgen -W "$(ls |grep -v .done|grep -v todo| grep -v README)" "${COMP_WORDS[1]}"))

}


complete -F _todo_completions todo-add
complete -F _todo_completions todo-cat

complete -F _todo_completions_itemNums todo-done
complete -F _todo_completions_itemNums todo-reprio
complete -F _todo_completions_itemNums todo-rm
complete -F _todo_completions_itemNums todo-update
