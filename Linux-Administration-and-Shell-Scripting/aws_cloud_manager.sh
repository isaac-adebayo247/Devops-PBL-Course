#!/bin/bash

# Environment variables
ENVIRONMENT=$1
file_name=$0
num_of_args=$#
users=("Ade" "Segun" "Emeka" "Michael" "Haruna")
group_name="admin"

# download the UserData file from a remote repo
if [ ! -e ~/UserData ]; then
  wget https://github.com/isaac-adebayo247/Devops-PBL-Course/blob/main/Linux-Administration-and-Shell-Scripting/UserData.sh -O ~/UserData.sh
fi

# Checking the number of arguments
check_num_of_args() {
if [ $num_of_args -eq 0 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi
}

# Acting based on the argument value
activate_infra_environment() {
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script in Local Environment..."
  export AWS_PROFILE=""
elif [ "$ENVIRONMENT" == "staging" ]; then
  echo "Running script in Staging Environment..."
  export AWS_PROFILE="staging"
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script in Production Environment..."
  export AWS_PROFILE="production"
else
  echo "Invalid environment specified. Please use \"$file_name <option>\". Options: 'local', 'staging', or 'production'."
  exit 2
fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {
  if ! command -v aws &> /dev/null; then
      echo "AWS CLI is not installed. Please install it before proceeding."
      return 1
  fi
}

# Function to check if AWS profile is set
check_aws_profile() {
  if [ -z "$AWS_PROFILE" ]; then
      echo "AWS profile environment variable is not set."
      return 1
  fi
}

# Function to create EC2 instances

create_ec2_instances() {
  # Specify the parameters for the EC2 instances
  instance_type="t3.micro"
  # ami ids for Amazon Linud, Ubuntu and Redhat
  ami_ids=("ami-01b1be742d950fb7f" "ami-0705384c0b33c194c" "ami-064983766e6ab3419")
  servers=("Amazon" "Ubuntu" "Redhat")
  count=1  # Number of instances to create
  region="eu-north-1" # Region to create cloud resources
  keypair="Isaac-amazon-private-key" # keypair for ssh connection

  for i in {0..2}
  do
    server=${servers[i]}
    image=${ami_ids[i]}

    # check if the ami with the ami_id already exists
    aws ec2 describe-tags --filters "Name=value,Values=$server" | grep $server 1> /dev/null
    if [[ $? -eq 0 ]]; then
      echo "$server EC2 instance already exists"
    else
      # Create the EC2 instances
      aws ec2 run-instances \
      --image-id $image \
      --instance-type $instance_type \
      --count $count \
      --key-name $keypair \
      --region $region \
      --security-groups "launch-wizard-2" \
      --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$server}]" &> /dev/null
      --user-data ~/UserData.sh

      # Check if the EC2 instances were created successfully
      if [ $? -eq 0 ]; then
         echo "$server EC2 instances created successfully."
      else
         echo "Failed to create $server EC2 instances."
      fi
   fi
 done
}

# Function to create S3 buckets for different departments
create_s3_buckets() {
    # Define a company name as prefix
    company="datawise"
    # Array of department names
    departments=("marketing" "sales" "hr" "operations" "media")

    for department in "${departments[@]}"
    do
      bucket_name="${company}-${department}-data-bucket"

      # check if the bucket already exists
      if aws s3api head-bucket --bucket $bucket_name &>/dev/null; then
        echo "s3 bucket $bucket_name already exists"
      else
        # Create S3 bucket using AWS CLI
        aws s3api create-bucket --bucket $bucket_name --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1
        if [ $? -eq 0 ]; then
          echo "S3 bucket '$bucket_name' created successfully."
        else
          echo "Failed to create S3 bucket '$bucket_name'."
        fi
      fi
    done
}

# create five IAM users

create_iam_users() {
  for user in  ${users[@]}
  do
    aws iam get-user --user-name $user &> /dev/null
    if [ $? -eq 0 ];then
      echo "$user already exists"
    else
      aws iam create-user --user-name $user &> /dev/null
      if [ $? -eq 0 ];then
        echo "$user created successfully"
      else
        echo "unable to create $user"
      fi
  fi
  done

}

# create group if not exists
create_iam_group() {
  aws iam get-group --group-name $group_name  &> /dev/null
  if [ $? -eq 0 ]; then
    echo  "'$group_name' group already exists"
  else
    aws iam create-group --group-name $group_name &> /dev/null && \
    aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --group-name admin
    if [ $? -eq 0 ]; then
      echo "$group_name group created successfullly"
      # add users to the group created
      for user in ${users[@]}
      do
        aws iam get-user --user-name $user | grep $user &> /dev/null
        if [ $? -eq 0 ]; then
          aws iam add-user-to-group --user-name $user --group-name $group_name
          if [ $? -eq 0 ]; then
            echo "$user added to the $group_name successfully"
          else
            echo "unable to add $user to the $group_name"
          fi
        else
          echo "$user does not exist"
        fi
      done
    else
      echo "unable to create $group_name group"
      exit 1
    fi
 fi
}

check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets
create_iam_users
create_iam_group
