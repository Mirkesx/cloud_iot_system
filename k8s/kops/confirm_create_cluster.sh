#!/bin/bash
source ./env
kops update cluster --name ${CLUSTER_NAME} --yes
kops export kubecfg --name ${CLUSTER_NAME} --admin=8670h0m0s
kops validate cluster --wait 10m