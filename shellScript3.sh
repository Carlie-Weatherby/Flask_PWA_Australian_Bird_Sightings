while read -r line; do
echo $line
mkdir -p $line
done < folders.txt

while read -r line; do
echo $line
touch $line
done < files.txt
