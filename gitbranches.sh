#!/bin/bash

listbranch(){
    git branch
}

createbranch(){
    branch_name=$1
    git branch $branch_name
    echo "New branch created with the name: $branch_name"
}

delete_branch(){
    branch_name=$1
    git branch -d $branch_name
    echo "Branch $branch_name deleted."
}

merge(){
    branch_name1=$1
    branch_name2=$2
    git merge $branch_name1 $branch_name2
}

rebase(){
    branch_name1=$1
    branch_name2=$2
    git rebase $branch_name1 $branch_name2
}

merge_flag=false
rebase_flag=false

# if the option (-l, -b, -c etc) is followed by a colon then it will require an argument
while getopts ":lb:d:m:1:2:" opt; do   
    case ${opt} in
        l)
            listbranch
            ;;
        b)
            branch_name=$OPTARG
            createbranch $branch_name
            ;;
        d)
            branch_name=$OPTARG
            delete_branch $branch_name
            ;;
        m)
            merge_flag=true
            ;;
        r)
            rebase_flag=true
            ;;
        1)
            branch_name1=${OPTARG}
            ;;
        2)
            branch_name2=${OPTARG}
            if [ "$merge_flag" = true ]; then
            merge $branch_name1 $branch_name2
            else
            rebase $branch_name1 $branch_name2
            fi
            ;;
        \?)
            echo "Invalid option: -$OPTARG" 
            exit 1
            ;;
    esac
done


