#!/bin/bash

# create ubuntu vm
az login

RESOURCE_GROUP="myResourceGroup"
LOCATION="eastus"
VM_NAME="myUbuntuVM"
IMAGE="UbuntuLTS"
SIZE="Standard_B1s"
ADMIN_USERNAME="azureuser"

az group create --name $RESOURCE_GROUP --location $LOCATION

az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --image "Canonical:0001-com-ubuntu-minimal-jammy:minimal-22_04-lts-gen2:latest" \
  --size $VM_SIZE \
  --os-disk-size-gb 30 \
  --storage-sku StandardSSD_LRS \
  --admin-username azureuser \
  --generate-ssh-keys

az vm disk attach \
  --resource-group $RESOURCE_GROUP \
  --vm-name $VM_NAME \
  --name "ubuntu-DataDisk_0" \
  --new \
  --size-gb 32 \
  --sku Standard_LRS

az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --query "provisioningState"

