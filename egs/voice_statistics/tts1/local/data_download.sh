#!/bin/bash

# Copyright 2019 Tomoki Hayashi
#  Apache 2.0  (http://www.apache.org/licenses/LICENSE-2.0)

. path.sh || exit 1;

db=$1
spk=$2

case ${spk} in
    "fujitou_normal" ) url="https://drive.google.com/open?id=1TEz_9gBy9uzo4JSyz8ZFkLOhtvnV-7wp" ;;
    "fujitou_happy" ) url="https://drive.google.com/open?id=1_c29IbUK1gN_VSdZy23iftBBAHzIjb-I" ;;
    "fujitou_angry" ) url="https://drive.google.com/open?id=1LyFhfKxpthQr_ePtW08mvDyi__yy4-R9" ;;
    "tsuchiya_normal" ) url="https://drive.google.com/open?id=1tqM1BsIc9kffzNpa0AayTe3bEdwV7yMr" ;;
    "tsuchiya_happy" ) url="https://drive.google.com/open?id=1DjCmKGnD3cbuYLImK75iwvedzoHplvWU" ;;
    "tsuchiya_angry" ) url="https://drive.google.com/open?id=1Yf7aY1JMz_gD4hpr_9CERagj3-Um2AGC" ;;
    "uemura_normal" ) url="https://drive.google.com/open?id=1nNnemZV88JT-ZuVY4sxCsvj86YugxPu2" ;;
    "uemura_happy" ) url="https://drive.google.com/open?id=1EmEmBVJdKjlLiHc2PFV6vlSGifSLyF8O" ;;
    "uemura_angry" ) url="https://drive.google.com/open?id=1wpvyyWk0WHSi2GyW_3L8abaoBXoDCKDp" ;;
    * )
        echo "'${spk}' is unknown speaker."
        exit 0 ;;
esac

cwd=`pwd`
if [ ! -e ${db}/voice_stats/${spk} ]; then
    mkdir -p ${db}/voice_stats
    download_from_google_drive.sh ${url} ${db}/voice_stats tar.gz
    echo "Successfully finished download of corpus."
else
    echo "It seems that corpus is already downloaded. Skipped download."
fi
