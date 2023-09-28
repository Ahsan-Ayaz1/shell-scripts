#!/bin/bash

new_ps1="[\$(date "+%T")] \w > "

cp ~/.bashrc ~/.bashrc.backup

echo "PS1='$new_ps1'" >> ~/.bashrc

source ~/.bashrc

echo "PS1 has been updated"

