get-ChildItem C:\ -recurse -erroraction silentlycontinue | sort length -descending | select -first 10
