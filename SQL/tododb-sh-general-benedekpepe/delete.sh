#!/bin/bash
#
# delete.sh delete-todo <todo-id>
# delete.sh delete-done
#
# Usage:
#    delete.sh delete-todo 99
#    delete.sh delete-done
#

delete_todo() {
    psql -h 127.0.0.1 -U ubuntu -d todo <<EOF
    DELETE FROM todo WHERE id=$1;
EOF
    echo "Task removed"
}

delete_done() {
    psql -h 127.0.0.1 -U ubuntu -d todo <<EOF
    DELETE FROM todo WHERE done=true;
EOF
    echo "All finished tasks removed"
}

main() {
    if [[ "$1" == "delete-todo" ]]
    then
        delete_todo "$2"
    elif [[ "$1" == "delete-done" ]]
    then
        delete_done
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@"
fi