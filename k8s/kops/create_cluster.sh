#!/bin/bash
source ./env
kops create cluster \
    --state=$KOPS_STATE_STORE \
    --zones=$ZONES \
    --node-size=$NODE_SIZE \
    --node-count=2 \
    --node-volume-size=128 \
    --master-size=$MASTER_SIZE \
    --master-count=1 \
    --master-volume-size=128 \
    --ssh-public-key $SSH_KEY \
    ${CLUSTER_NAME};