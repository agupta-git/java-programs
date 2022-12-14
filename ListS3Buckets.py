"""
pip install boto3

~/.aws/credentials
[default]
aws_access_key_id = <VALUE>
aws_secret_access_key = <VALUE>

~/.aws/config
[default]
region = <VALUE> ex:us-west-2

python3 ListS3Buckets.py
"""
import boto3
s3_resource = boto3.resource('s3')
for bucket in s3_resource.buckets.all():
  print(bucket.name)
