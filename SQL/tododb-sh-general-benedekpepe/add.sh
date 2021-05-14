#!/bin/bash
#
# add.sh add-user <user>
# add.sh add-todo <user> <todo>
#
# Usage:
#    add.sh add-user John
#    add.sh add-user Paul
#    add.sh add-todo John Meeting
#    add.sh add-todo Paul "Make breakfast"
#

add_user() {
    psql -h 127.0.0.1 -U ubuntu -d todo <<EOF
    INSERT INTO "user" (name) VALUES ('$1');
EOF
    echo "User added: $1"
}

add_todo() {
    id=$(psql -h 127.0.0.1 -U ubuntu -d todo -t  <<EOF 
    select id from "user" where name = '$1';
EOF
)
    psql -h 127.0.0.1 -U ubuntu -d todo <<EOF
    INSERT INTO "todo" (task,user_id) VALUES ('$2',$id);
EOF
    echo "Task ($2) added for $1"
}

main() {
    if [[ "$1" == "add-user" ]]
    then
        add_user "$2"
    elif [[ "$1" == "add-todo" ]]
    then
        add_todo "$2" "$3"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@"
fi
