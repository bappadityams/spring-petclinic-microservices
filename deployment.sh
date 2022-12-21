VIRTUAL_NETWORK_NAME=vnet-petclinic-bbanerjeetest
RESOURCE_GROUP=javalab_group

az network vnet create --resource-group $RESOURCE_GROUP \
    --name $VIRTUAL_NETWORK_NAME \
    --location $LOCATION \
    --address-prefix 10.1.0.0/16


SERVICE_RUNTIME_SUBNET_CIDR=10.1.0.0/24
APP_SUBNET_CIDR=10.1.1.0/24
APPLICATION_GATEWAY_SUBNET_CIDR=10.1.2.0/24
PRIVATE_ENDPOINTS_SUBNET_CIDR=10.1.3.0/24
DATABASE_SUBNET_CIDR=10.1.4.0/24
APPLICATION_GATEWAY_SUBNET_NAME=app-gw-subnet
PRIVATE_ENDPOINTS_SUBNET_NAME=private-endpoints-subnet
DATABASE_SUBNET_NAME=database-subnet
az network vnet subnet create --resource-group $RESOURCE_GROUP \
    --vnet-name $VIRTUAL_NETWORK_NAME \
    --address-prefixes $SERVICE_RUNTIME_SUBNET_CIDR \
    --name service-runtime-subnet 
az network vnet subnet create --resource-group $RESOURCE_GROUP \
    --vnet-name $VIRTUAL_NETWORK_NAME \
    --address-prefixes $APP_SUBNET_CIDR \
    --name apps-subnet
az network vnet subnet create \
    --name $APPLICATION_GATEWAY_SUBNET_NAME \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VIRTUAL_NETWORK_NAME \
    --address-prefix $APPLICATION_GATEWAY_SUBNET_CIDR
az network vnet subnet create \
    --name $PRIVATE_ENDPOINTS_SUBNET_NAME \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VIRTUAL_NETWORK_NAME \
    --address-prefix $PRIVATE_ENDPOINTS_SUBNET_CIDR
az network vnet subnet create \
    --name $DATABASE_SUBNET_NAME \
    --resource-group $RESOURCE_GROUP \
    --vnet-name $VIRTUAL_NETWORK_NAME \
    --address-prefix $DATABASE_SUBNET_CIDR