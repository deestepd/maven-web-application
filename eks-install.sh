#!/bin/bash

CLUSTER_NAME="eks-demo"
AWS_REGION="eu-west-2"

# Function to install EKS cluster
install_cluster() {
    echo "Installing EKS cluster: ${CLUSTER_NAME} in region: ${AWS_REGION}"
    
    eksctl create cluster \
        --name ${CLUSTER_NAME} \
        --region ${AWS_REGION} \
        --nodegroup-name standard-workers \
        --node-type t3.medium \
        --nodes 2 \
        --nodes-min 1 \
        --nodes-max 3 \
        --ssh-public-key April2024key1 \
        --managed
    
    if [ $? -eq 0 ]; then
        echo "EKS cluster ${CLUSTER_NAME} created successfully."
    else
        echo "Failed to create EKS cluster ${CLUSTER_NAME}."
        exit 1
    fi
}

# Function to delete EKS cluster
delete_cluster() {
    echo "Deleting EKS cluster: ${CLUSTER_NAME} in region: ${AWS_REGION}"

    eksctl delete cluster --name ${CLUSTER_NAME} --region ${AWS_REGION}

    if [ $? -eq 0 ]; then
        echo "EKS cluster ${CLUSTER_NAME} deleted successfully."
    else
        echo "Failed to delete EKS cluster ${CLUSTER_NAME}."
        exit 1
    fi
}

# Main logic to handle install or delete
if [ "$1" == "install" ]; then
    install_cluster
elif [ "$1" == "delete" ]; then
    delete_cluster
else
    echo "Invalid option. Use 'install' to create the cluster or 'delete' to remove it."
    exit 1
fi


#to destroy issue this command:
# eksctl delete cluster <NAME YOU GAVE TO THE CLUSTER> 
# eg: eksctl delete cluster  cluster-with-eksctl

