#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 STORE VERSION SHOPIFY_ACCESS_TOKEN ORDER_ID"
    exit 1
fi

# Assign input parameters to variables
STORE=$1
VERSION=$2
SHOPIFY_ACCESS_TOKEN=$3
ORDER_ID=$4

# Construct the GraphQL query
QUERY='{"query":"query {order(id: \"gid://shopify/Order/'"$ORDER_ID"'\" ) { id transactions { id kind accountNumber authorizationCode authorizationExpiresAt createdAt errorCode amountSet { presentmentMoney { amount currencyCode } shopMoney { amount currencyCode } } gateway formattedGateway settlementCurrencyRate status processedAt totalUnsettledSet { presentmentMoney { amount currencyCode } shopMoney { amount currencyCode } } parentTransaction { id } receiptJson paymentDetails { ...on CardPaymentDetails { name } } } } }"}'

# Construct the curl command
CURL_COMMAND="curl -X POST \"https://$STORE.myshopify.com/admin/api/$VERSION/graphql.json\" \
-H \"Content-Type: application/json\" \
-H \"X-Shopify-Access-Token: $SHOPIFY_ACCESS_TOKEN\" \
-d '$QUERY'"

# Print the curl command
echo "Executing the following command:"
echo ""
echo "$CURL_COMMAND"
echo ""

# Prompt for confirmation before executing
read -p "Do you want to continue with the execution? (y/n): " CONTINUE

if [[ "$CONTINUE" =~ ^[Yy]$ ]]; then
    # Execute the POST request using curl
    eval "$CURL_COMMAND"
else
    echo "Execution cancelled."
fi

