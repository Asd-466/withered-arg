#!/bin/bash

url=""
name=""
echo "enter url: "
read -r url
echo "enter video title: "
read -r name
vname="${name}.mp4"
th=0
echo "enter the nth video this is: "
read -r th
yt-dlp $url -o $vname

dname=""
echo "enter directory name(enter ls to list): "
read -r dname
if [  $dname -eq "ls"  ]; then 
  ls
  dname=""
  echo "enter directory name(enter ls to list): "
  read -r dname
else
  mkdir $dname
fi

aname="vid${th}.wav"
sname="vid${th}spec"+".png"
ffmpeg -i $vname $dname/frames_%04d.png
ffmpeg -i $vname -vn -acodec pcm_s16le -ar 44100 -ac 1 $aname
sox $aname -n spectrogram -o $sname

