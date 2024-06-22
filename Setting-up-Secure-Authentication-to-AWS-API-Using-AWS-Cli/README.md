## Setting Up Secure Authentication to AWS API Using AWS CLI

The following procedures were followed in order to create a script and enable the to complete this project. This setup is crucial for enabling the script to create EC2 instances and S3 buckets efficiently.
1. **_Created an IAM Role:_** Began by creating an IAM role encapsulates the permissions required for the operations the script will perform.

2. **_Created an IAM Policy:_** Designed an IAM policy granting full access to both EC2 and S3 services. This policy ensures the script has the necessary permissions to manage these resources.

3. **_Created an IAM User:_** Instantiated an IAM user named automation_user. This user will serve as the primary entity the script uses to interact with AWS services.

4. **_Assigned the User to the IAM Role:_** Linked the automation_user to the previously created IAM role to inherit its permissions. This step is vital for enabling the necessary access levels for the automation tasks.

5. **_Attached the IAM Policy to the User:_** I ensured that the automation_user is explicitly granted the permissions defined in the IAM policy by attaching the policy directly to the user. This attachment solidifies the user's access to EC2 and S3 resources.

6. **_Created Programmatic Access Credentials:_** Generated programmatic access credentials - specifically, an **access key ID** and a **secret access key** for the **automation_user**. These credentials are indispensable for authenticating the script with AWS API throgh the Linux terminal, allowing it to create and manage cloud resources programmatically.

#### Installing and Configuring the AWS CLI
After setting up the AWS account (for **automation_user**) and creating the necessary IAM user and permissions, the next step involves installing the AWS Command Line Interface (CLI). The AWS CLI is a powerful tool that allows me to interact with AWS services directly from my terminal, enabling automation and simplification of AWS resource management.

#### Downloading and Installing AWS CLI
**_On Linux_**, the following steps were performed in the bash terminal

1. Downloaded the AWS CLI version 2 installation file for Linux
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```
2. Unzipped the installer
```
unzip awscliv2.zip
```
3. Ran the installer
```
sudo ./aws/install
```
#### Configuring the AWS CLI
Once the AWS CLI is installed, the next taken was to configure it to use the **access key ID** and **secret access key** generated for the **automation_user**. This will authenticate the CLI (Command Line Interface) requests to the AWS API.

#### _Understanding APIs_
Before proceeding further, it's essential to mention what an _**API**_ (Application Programming Interface) is and its relevance here. An API is a set of protocols and tools that allows different software applications to communicate with each other. In the contex of AWS, the AWS API enables the scripts or the AWS CLI to interact with AWS services programmatically. This means that I can create, modify and delete AWS resources by making API calls, which are just structured requests that the AWS platform can understand and act upon.

#### _Configuring AWS CLI for access to AWS:_
Opened the bash terminal and entered
```
aws configure
```
This command initiates the setup process for the AWS CLI installation.

_**Entered the credentials:**_
When prompted, entered the **_AWS Access Key ID_** and _**AWS Secret Access Key**_
for  the **_automation_user_**. Ensured these are kept secured and are not shared.

Next, I specified the Default **_region_** name and Default **_output_** format. The region chosen matched the one I planned to deploy resources in, and a common output format chosen was **_json_**.

#### Testing the Configuration:
To verify that the AWS CLI is configured correctly and can communicate with AWS service, tried running a basic command to list all the AWS regions:
```
aws ec2 describe-regions --output table
```
This command queries the EC2 service for a list of all regions and formats the output as a table, which makes it easy to read. A list of all the regions was received.

