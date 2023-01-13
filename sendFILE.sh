clear
echo ""
# encode pdf with base64
read -p "drag n drop file to terminal : " filetarget
cat $filetarget | base64 > raw/sample
# split PDF divide by size 4KB
split -b 4k raw/sample raw/segment

# select only packet segment
echo "" > raw/list
shopt -s nullglob
allfiles=(raw/segment*);
for f in "${allfiles[@]}"
do
    echo "$f" >> raw/list
done | sort -t"." -k1n
sed -i '/^$/d' raw/list
iter=$(wc -l < raw/list)
echo $iter

# send iteration to receiver
echo "$iter" > raw/iter.txt
./encode audio/encoded.wav 8000 16 1 raw/iter.txt 1800 YD1RUH
aplay audio/encoded.wav
sleep 10

#iteration process for each packet
shopt -s nullglob
allfiles=(raw/segment*);
for f in "${allfiles[@]}"
do
    #echo "transmit : $f"
    ./encode audio/encoded.wav 8000 16 1 $f 1800 YD1RUH
    aplay audio/encoded.wav
    sleep 10
done | sort -t"." -k1n

echo ""
echo ""
echo "finish"
