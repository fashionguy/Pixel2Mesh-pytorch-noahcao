#!/usr/bin/env bash

set -x

if [[ $# -lt 3 ]] ; then
    echo 'too few arguments supplied'
    exit 1
fi

PARTITION=$1
NAME=$2
OPTIONS=$3
CHECKPOINT=$4

srun -p ${PARTITION} \
    --job-name=MeshEval \
    --gres=gpu:8 \
    --ntasks=1 \
    --kill-on-bad-exit=1 \
    python entrypoint_eval.py --name ${NAME} --options ${OPTIONS} --checkpoint ${CHECKPOINT} &
