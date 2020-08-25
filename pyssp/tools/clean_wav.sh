#!/bin/bash


# guia file containing pointers to files to clean up
if [ $# -lt 1 ]; then
    echo 'ERROR: at least wavname and METHOD[0,1,2,3] must be provided!'
    echo "Usage: $0 <guia_file> <METHOD[0,1,2,3] >"
    echo "If no save_path is specified, clean file is saved in current dir"
    exit 1
fi

NOISY_WAVNAME="$1"
SAVE_PATH="./test_clean_results"
# if [ $# -gt 1 ]; then
#   SAVE_PATH="$3"
# fi

echo "INPUT NOISY WAV: $NOISY_WAVNAME"
# echo "SAVE PATH: $SAVE_PATH"
# mkdir -p $SAVE_PATH

for i in `seq 0 3`
do
  # echo "$i-clean"
  # FILENAME=$1_$var_clean.wav
  python3 noise_reduction_with_ms.py -m $i $1  > "$1-$i-clean.wav"
done
