#!/bin/bash
for THIS_PATH in `echo $PATH | sed 's/:/ /g'`
do
  [[ ! -d $THIS_PATH ]] && echo "WARNING $THIS_PATH does not exist."
done