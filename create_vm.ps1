# PowerShell script to create an Ubuntu VM in Azure

# Log in to Azure
az login

# Define variables
$RESOURCE_GROUP = "myResourceGroup"
$LOCATION = "eastus"
$VM_NAME = "myUbuntuVM"
$IMAGE = "Canonical:0001-com-ubuntu-minimal-jammy:minimal-22_04-lts-gen2:latest"
$SIZE = "Standard_B1s"
$ADMIN_USERNAME = "azureuser"

# Create the resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create the VM
az vm create `
  --resource-group $RESOURCE_GROUP `
  --name $VM_NAME `
  --image $IMAGE `
  --size $SIZE `
  --os-disk-size-gb 30 `
  --storage-sku StandardSSD_LRS `
  --admin-username $ADMIN_USERNAME `
  --generate-ssh-keys

# Attach a data disk to the VM
az vm disk attach `
  --resource-group $RESOURCE_GROUP `
  --vm-name $VM_NAME `
  --name "ubuntu-DataDisk_0" `
  --new `
  --size-gb 32 `
  --sku Standard_LRS

# Check the provisioning state
az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --query "provisioningState"
