#!/bin/bash

# count=0
# while [ True ]
# do
#     data=`date --rfc-3339=seconds`
#     git add .
#     git commit -m "salvando log v$count, data: $data"
#     count=`expr $count + 1`
#     sleep 6h

# done
git add .
git commit -m "script para commits automáticos"
git push