#!/bin/bash
source ./env
kops delete cluster --name ${CLUSTER_NAME} --yes