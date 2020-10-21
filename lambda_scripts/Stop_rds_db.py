import sys
import botocore
import boto3
from botocore.exceptions import ClientError

region = 'us-east-1'
db_instance = 'lambda-test'

def lambda_handler(event, context):

    print("Beginning the database shutdown")

    rds = boto3.client('rds', region_name=region)
    print('Got past the boto3 clients')


    try:
        response = rds.stop_db_instance(
            DBInstanceIdentifier=db_instance
        )

        print ('Success :: ') 
        return str(response)
    except ClientError as e:
        print(e)    
    return
    {
        'message' : "Script execution completed. See Cloudwatch logs for complete output"
    }