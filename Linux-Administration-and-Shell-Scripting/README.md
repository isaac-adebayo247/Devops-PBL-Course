### Capstone Project - Linux Administration and Shell Scripting

#### Evaluation Criteria

  1. **_Script Enhancement (30 points):_**

    - 1.1 **_CentOS Support (15 points):_**
        
      - Successful extension of the script from the last mini-project to include support fo CentOS.

      - Proper modification of functions and conditionalstatements for CentOS compatibility.

    - 1.2 **_Script Modularity (15 points):_**

      - Clear organization of the script with modular functions for package installation, service management, and artifact deployment.

      - Effective use of functiond for different Linux distributions.

  2. **_Infrastructure Setup (30 points):_**

    - 2.1 **_EC2 Instance Launch (15 points):_**

      - Proper launch of EC2 instances with Amazon Linux, Ubuntu, and CentOS.

      - Configuration of instance attributes such as instance type, security groups, and key pairs.

    - 2.2 **_Security Measures (15 points):_**
     
      - Appropriate configuration of security groups to ensure optimal security measures.

      - Proper setup of key pairs for secure remote access.

  3. **_Remote Execution and Deployment (30 points)_**

    - 3.1 **_Script Upload (10 points):_**

      - Successful upload of the enhanced script to a centralized server.

      - Secure handling of the script to prevent unauthorized access.

    - 3.2 **_Remote Execution (10 points):_**
    
      - Proper execution of the script on each instance remotely.

      - Handling of dependencies and adjustments for different distributions.

    - 3.3 **_Apache Deployment (5 points):_**

      - Successful deployment of the Apache web server on each instance

      - Verification of the Apache service status.

    - 3.4 **_Sample Web Application Deployment (5 points):_**

      - Successful deployment of a sample web application on each instance

      - Verification of web applicatio accessibility.

  4. **_Documentation (20 points):_** 
    
    - 4.1 **_Remote Deployment Process (7 points):_**

      - Comprehensive documentation detailing the entire remote deployment process

      - Clear step-by-step instructions for each task, including script enhancement, infrastructure setup, and remote execution.

    - 4.2 **_Configuration Details (5 points):_**
    
      - Detailed documentation of configurations made during infrastructure setup.

      - Explanation of security measures implemented.

    - 4.3 **_Challenges and Solutions (5 points):_**

      - Identification and documentation of challenges encountered during the project.

      - Clear presentation of solutions implemented to overcome challenges.

    - 4.4 **_Key Findings and Insights (3 points):_**

      - A brief report summarizing key findings and insights gained from the project.

      - Reflection on the significance of deploying across mulitple Linux distributions for system reliability.

  5. **_Script Link Submission (20 points):_**
    
    - 5.1 _**Link Submission (20 points):**_

      - Submission of a link to the script used for remote execution.

      - Verification that the link provides access to the enhanced script with CentOS support.

### Capstone Project: Shell Script for AWS IAM Management

#### Project Scenario

Datawise Solutions requires efficient management of AWS Identity and Access Management (IAM) resources. The company is expanding its team and needs to onboard five new employees to access AWS resources securely.

#### Purpose

In this capstone project, you will extend your shell scripting capabilities by creating more functions that extends the _**"aws_cloud_manager.sh"**_ script

#### Objectives:

  1. **_Script Enhancement:_**

      - Extend the aws_cloud_manager.sh script to include IAM management.

  2. **_Define IAM User Names Array:_**

      - Store the names of the five IAM users in an array for easy iteration during user creation.

  3. **_Create IAM Users:_**

      - Iterate through the IAM user names array and create IAM users tor each employee using AWS CLI commands.

  4. **_Create IAM Group:_**

      - Define a function to create an IAM group named "admin" using the AWS CLI.

  5. **_Attach Administrative Policy to Group:_**

      - Attach an AWS-managed administration policy (e.g "AdministratorAccess") to the "admin" group to grant administrative privileges.

  6. **_Assign Users to Group:_**
  
      - Iterate through the array of IAM usef names and assign each user to the "admin" group using AWS CLI commands.

#### Project Deliverables

Submit the following deliverables:

  1. Comprehensive documentation detailing your entire thought process in developing the script.

  2. Link to the script used for remote execution.

