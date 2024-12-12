while read -r line; do
echo $line
mkdir -p $line
done < folders.txt

while read -r line; do
echo $line
touch $line
done < files.txt


###TEMP
#mv icons, icons #Renames a directory
#rm -i daat_source # delete file
#cd .. # navigate UP one directory

#TODO: Add subfolders bash script stuff
#cd static
#mkdir css icons images js
