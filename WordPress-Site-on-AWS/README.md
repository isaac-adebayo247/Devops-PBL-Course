### WordPress-Site-on-AWS

#### Project Scenario
A small to medium sized digital marketing agency, **_"DigitalBoost"_**, wants to enhance its online presence by creating a high-performance **_WordPress-based_** website for their clients. The agency needs a scalable, secure and cost-effective solution that can handle increasing traffic and seamlessly integrate with their existing infrastructure. Your task as an AWS Soutions Architect is to design and implement a WordPress solution using various AWS services, such as Networking, Conpute, Object Storage, and Databases.

#### Pre-requisite
   - Knowledge of TechOps Essentials
  
   - Completion of Core 2 Courses and Mini Projects
The project overview with necessary architecture have been provided as you help **_DigitalBoost_** with her Wordpress-Based Website. Kindly follow the instructions below to complete this Capstone Project. Also, necessary scripts have been provided [**_here_**](https://github.com/dareyio/script-2)

#### Project Deliverables

- **_Documentation:_**
     - Detailed documentation for each component setup.
     - Explanation of security measures implemented.

 - **_Demonstration:_**
     - Live demomstration of the WordPress site.
     - Showcase auto-scaling by simulating increased traffic.
       
#### Project Overview

![project overview](https://github.com/isaac-adebayo247/WordPress-Site-on-AWS/assets/168349078/9677bcc1-7543-4a8c-8346-518f6ac74eb4)

#### Project Components
### 1. VPC Setup
### VPC ARCHITECTURE

![VPC architecture](https://github.com/isaac-adebayo247/WordPress-Site-on-AWS/assets/168349078/b05beaa5-72dc-4e53-a5ff-f3b189223622)

- **_Objective:_** Create a Virtual Private Cloud (VPC) to isolate and secure the WordPress infrastructure.
  
- **_Steps:_**
     - Define IP address range for the VPC.
     - Create VPC with public and private subnets.
     - Configure route tables for each subnet.

### 2. Public and Private Subnet with NAT Gateway
### NAT GATEWAY ARCHITECTURE

![NAT gateway](https://github.com/isaac-adebayo247/WordPress-Site-on-AWS/assets/168349078/1d0da4a2-2fe3-4a09-b42d-407de0573809)

- **_Objective:_** Implement a secure network architecture with public and private subnets. Use a NAT Gateway for private subnet internet access.
  
- **_Steps:_**
     - Set up public subnet for resources accessible from the internet.
     - Create private subnet for resources with no direct internet access.
     - Configure a NAT Gateway for private subnet internet access.

### 3. AWS MySQL RDS Setup
### SECURITY GROUP ARCHITECTURE

![Security Group](https://github.com/isaac-adebayo247/WordPress-Site-on-AWS/assets/168349078/165cbd39-76e3-40f9-9c8b-31ae63775173)

- **_Objective:_** Deploy a managed MySQL database using Amazon RDS for WordPress data storage.
  
- **_Steps:_**
     - Create an Amazon RDS instance with MySQL engine.
     - Configure security groups for RDS instance.
     - Connect WordPress to the RDS database.
       
### 4. EFS Setup for WordPress Files

- **_Objective:_** Utilize Amazon Elastic File System (EFS) to store WordPress files for scalable and shared access.
  
- **_Steps:_**
     - Create an EFS file sysstem.
     - Mount the EFS file system on WordPress instances.
     - Configure WordPress to use the shared file system.
       
### 5. Application Load Balancer

- **_Objective:_** Set up an Application Load Balancer to distribute incoming traffic among mulitple instances, ensuring high availability and fault tolerance.
  
- **_Steps:_**
     - Create an Application Load Balancer
     - Configure listener rules for routing traffic to instances.
     - Integrate Load Valancer with Auto Scaling group.

### 6. Auto Scaling Group

- **_Objective:_** Implement Auto Scaling to automatically adjust the number of instances based on traffic load.
  
- **_Steps:_**
     - Create an Auto Scaling group.
     - Define scaling policies based on metrics like CPU utilization.
     - Configure launch configurations for instances.
