#!/bin/bash

echo 'Creating task2 Folder'
mkdir task2

sleep 1
echo 'Creating files inside task2 folder'
touch task2/file-{1..3}.txt

sleep 1
echo 'Creating temporary directory'

mkdir task2_temp

sleep 1
echo 'Copying files to the temp folder'
cp task2/file-{1..3}.txt task2_temp

sleep 1
echo 'Swaping Folder names'
mv task2 temp_dir
mv task2_temp task2
mv temp_dir task2_temp

