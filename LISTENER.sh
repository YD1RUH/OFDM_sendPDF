clear

rec audio/recorded.wav rate 8k silence 1 0.1 3% 1 3.0 3%
./decode raw/data audio/recorded.wav
iter=$(cat raw/data)
echo "$iter" > raw/un.txt
iconv -f us-ascii -t utf-8 raw/un.txt -c -o raw/output.txt
cat raw/output.txt

c=0
file=1
a=$(cat raw/output.txt)
while [ $a -gt $c ]
do
    echo $a
    rec audio/"$file.wav" rate 8k silence 1 0.1 3% 1 3.0 3%
    ./decode raw/"$file.raw" audio/"$file.wav"
    iconv -f us-ascii -t utf-8 raw/"$file.raw" -c -o raw/"$file.craw"
    sleep 1
    a=$[ a-1 ]
    file=$[ file+1 ]
done
cd raw
cat *.craw > rawdata
cat rawdata | base64 --decode > result.pdf
mv result.pdf ../
rm * .
cd ..
echo "finish.."
