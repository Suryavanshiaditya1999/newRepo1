#!/bin/bash

create_tag(){
    $tagname=$1
    git tag $tagname
    echo "tag name for current branch is $tagname"
}

list_tags(){
    git tag
}

delete_tag(){
    $tagname=$1
    git tag -d $tagname
    echo "tag $tagname is deleted"
}


while getopts ":lt:d:" opt; do
  case ${opt} in
    l)
    list_tags
    ;;
    t)
    tagname=$OPTARG
    create_tag $tagname
    ;;
    d)
    tagname=$OPTARG
    delete_tag $tagname
    ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done