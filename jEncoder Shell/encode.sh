#!/bin/sh

#  Encode Script
#  jEncoder
#
#  Created by Josh Luongo on 8/07/12.
#  Copyright (c) 2012. All rights reserved.

# Usage: encode [file] [intro] [voice] [output file name]

cd /tmp

ffmpeg -i $1 -sameq -vol 6000 temp.mpg

if [ $3 = "voice" ]
then
#Voice Chosen

#Do Voice Fix

ffmpeg -i temp.mpg -vn -ar 44100 -ac 2 -ab 192 -f mp3 audio.mp3


fi



if [ $2 = "intro" ]
then
#Intro

cp ~/Intro.mpg Intro.mpg

cat *.mpg | ffmpeg -i - -sameq -acodec mp2 -ac 2 -ar 48000 -ab 128k out.mpg


else
#No intro
intro="";
fi

ffmpeg -i out.mpg -vcodec libx264 -crf 22 -threads 10 -acodec libfaac -ac 2 -ar 48000 -ab 192k -metadata encoder="jEncoder 1.0" -metadata encoded_by="$USER" Finished.mp4

mv Finished.mp4 ~/Desktop/$4


rm temp.mpg
rm Intro.mpg
rm out.mpg
