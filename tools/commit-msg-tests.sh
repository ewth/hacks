#!/bin/bash

exit 0
commit_regex='(SPQS-[0-9]+|merge)'

commit_msg=`cat "$1"`

if ! grep -iqE "$commit_regex" "$commit_msg"; then
    echo "Please tag commits with the JIRA task first (e.g. SPQS-123)." >&2
    exit 1
fi
