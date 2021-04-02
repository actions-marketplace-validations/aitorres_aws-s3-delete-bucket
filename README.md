# AWS S3 Delete Bucket for Github Actions

A Github Action that lets you empty and delete an existing AWS S3 bucket on demand during your workflows.

**PLEASE NOTE** that this Action is potentially **dangerous** as it will delete EVERYTHING inside a bucket in order to delete it.

Make sure it is **properly configured** before using.

## Usage

This is a sample usage of this action that you can adapt / modify and copy to your workflow:

```yaml
- name: Delete bucket in S3
  uses: aitorres/aws-s3-delete-bucket
  with:
    bucket-name: 'name-of-my-bucket'
    aws-secret-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## Inputs

The following are the valid input arguments for this action:

|Name|Description|
|----|-----------|
|`bucket-name`|Name for the new bucket (make sure it's the right one!)|
|`aws-secret-key-id`|AWS Secret Key ID, part of the credentials to be used during bucket creation. Please pass these through secret environment variables.
|`aws-secret-access-key`|AWS Secret Access Key, part of the credentials to be used during bucket creation. Please pass these through secret environment variables.

## Misc

Please remember to follow these [Security best practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html) for handling credentials used with these or any other Github Action that connects to your AWS Account.
