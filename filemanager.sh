#!/bin/bash

choice=$1
tmp=$2
dir=$3

file=$4
num=$5
num2=$6
dir2=$7

move=false
copy=false

case $choice in
addDir)

        mkdir -p /$tmp/$dir
        ;;
deleteDir)
       rmdir /$tmp/$dir
       ;;

list_only_Files)
         cd /$tmp
         ls -p | grep -v /
         ;;
 list_only_dir)
 cd /$tmp
        ls -d */
        ;;
   listall)
    cd /$tmp
        ls -ltr
        ;;
  addfile)
    touch "/$tmp/$dir/$file"
    ;;
  addContent)
    cd "/$tmp/$dir"
    echo "initial content" >> "$file"
    ;;
  content_at_beginning)
    cd "/$tmp/$dir"
    echo "New line" | cat - "$file" > temp_file && mv temp_file "$file"
    ;;
  top_n_lines)
    cd "/$tmp/$dir"
    head -n "$num" "$file"
    ;;
  top_last_lines)
    cd "/$tmp/$dir"
    tail -n "$num" "$file"
    ;;
  specific_line)
    cd "/$tmp/$dir"
    head -n "$num" "$file" | tail -n 1
    ;;
  line_range)
    cd "/$tmp/$dir"
    head -n "$num" "$file" | tail -n "$num2"
    ;;
  move_copy)
    cd "/$tmp/$dir"
    if [ "$move"=true ]; then
      mv "$file" "/$tmp/$dir/$file" "/$tmp/$dir2/"
    elif [ "$copy"=true ]; then
      cp "$file" "/$tmp/$dir/$file" "/$tmp/$dir2/"
    else
      echo "Invalid choice for move or copy"
    fi
    ;;
    delete_file)
    rm /$tmp/$dir/$file
    ;;
  *)
    echo "invalid choice"
    ;;
esac

