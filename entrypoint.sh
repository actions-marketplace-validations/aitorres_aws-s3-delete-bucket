#!/bin/sh

export BUCKET_NAME=$1
export AWS_ACCESS_KEY_ID=$2
export AWS_SECRET_ACCESS_KEY=$3

if [ -z "${BUCKET_NAME}" ] || [-z "${AWS_ACCESS_KEY_ID}" ] || [ -z "${AWS_SECRET_ACCESS_KEY}" ]
then
    echo "Insufficient or improperly configured input for this Github Action"
    exit 1
else
    echo "Emptying bucket..."
    aws rm "s3://${BUCKET_NAME}" --recursive
    echo "Bucket \`${BUCKET_NAME}\` emptied successfully."

    echo "Deleting bucket..."
    aws s3api delete-bucket --bucket $BUCKET_NAME
    echo "Bucket \`${BUCKET_NAME}\` deleted successfully."
fi
