#!/bin/bash

# Creation of EKS cluster
eksctl create cluster \
  --name ghaCluster \
  --region eu-west-2 \
  --nodegroup-name standard-workers \
  --node-type t3.medium \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 4 \
  --ssh-public-key $KEY_NAME \
  --managed

#to destroy issue this command:
# eksctl delete cluster <NAME YOU GAVE TO THE CLUSTER> 
# eg: eksctl delete cluster  cluster-with-eksctl
