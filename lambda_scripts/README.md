# Create an AWS Lambda Function to Stop and Start an RDS Instance
## Lambda Function to Stop an RDS Instance
### Step 1 – Create an IAM role

based on URL: https://dzone.com/articles/create-an-aws-lambda-function-to-stop-and-start-an

We will create an appropriate IAM role to enable access to CloudWatch logs, as well as to start and stop an RDS instance. AWS now has a convenient visual editor for policy selections should you elect its use.

 I will first create a policy and attach then it to an IAM Role

* Log into the IAM console and click on
    * Policy and Create Policy.
    * Paste the following in the JSON editor.
    * NOTE: Use the file - policy_start_stop_RDS.json
* Give a policy name: policy_start_stop_RDS, along with a description, then click on Create Policy.
* Now in the IAM console click on Roles and Create Roles
* Choose AWS Services, Lambda as your service.
* In the Search bar search for policy_ and the policy you created earlier should appear as below.
* Provide a descriptive role name (for example), lambda-start-stop-rds, and click Create Role.

### Step 2 – Author a Function


* Be sure you are in the correct region for creating Lambda functions and in the same region in which your DB instance was created. In my case, it is N.Virginia.
* Get the RDS Instance name and the Availability Zone from the Administrator.
* Open the Lambda console and click on Create Function and Author from Scratch
* Enter the following information in the window
    * Name: RDSInstanceStop
    * Runtime:  Python 3.7
    * Role: Choose an existing role
    * Role Name: Lambda-start-stop-rds and click on Create Function

* At the top right hand corner there is now an ARN resource created for the Lambda function. This is used to grant permissions for the Lambda function to access Lambda API GetFunctionConfiguration plus access to the environment variables.
* Return to the Role: lambda-start-stop-rds and click on Add inline policy.
* Next, go to the JSON tab and enter:
    * Use the file policy_rds_stop.json
    * Be sure to change the Resource to the Lambda ARN you just created.
    * Assign the Lambda ARN a descriptive policy name such as policy_rds_stop and click Save.
* Now go back to the Lambda function and the AWS Lambda added should appear as a Resource.

### Step 3 – Update Function Code
* In the Python function code section paste the following:
    * Stop_rds_db.py
    * The primary piece of line that stops a DB instance is  rds.stop_db_instance .
    * lambdaFunc.get_function_configuration  returns a dictionary of the properties of the function RDSInstanceStop .
    * DBInstance variable holds the environment variable DBInstanceName  which is the key value pair that one can use to separate Dev, QA or Prod environments.

### Step 4 - Configure the Lambda Function
* The environment variables are at the top of the code prior to the handler function

### Step 5 - Time to test

    * On the top right corner of the screen select Test and Configure Test events.
    * Select Create New Test Event and select the Hello World event template.
    * When you click on save, the execution should succeed. If your DB is not started, there is nothing to actually stop and hence you will get a message similar to “Instance <> is not in available state.”

## Lambda Function to Start an RDS Instance



