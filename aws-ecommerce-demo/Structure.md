# 🛒 Scalable E-Commerce Website on AWS

## 📖 Project Overview

This project demonstrates how to build a **highly available, scalable, secure, and production-ready e-commerce application** using core AWS services. The architecture is designed to handle thousands of concurrent users while ensuring high availability, automatic scaling, secure storage, monitoring, and auditing.

The project simulates a real-world online shopping platform similar to **Amazon**, **Flipkart**, or **Myntra**.

---

# 🎯 Project Requirements

* Handle thousands of concurrent users.
* Ensure zero or minimal downtime.
* Store product images and documents securely.
* Protect customer data.
* Automatically scale during high traffic.
* Monitor infrastructure and applications.
* Maintain audit logs for security and compliance.

---

# 🏗️ AWS Architecture

```text
                      Users
                        │
                 Internet Gateway
                        │
                Application Load Balancer
                        │
         ┌──────────────┴──────────────┐
         │                             │
      EC2 Instance 1               EC2 Instance 2
         │                             │
         └──────────────┬──────────────┘
                        │
                 Auto Scaling Group
                        │
                Amazon RDS (MySQL)
                        │
                 Product Information

                Amazon S3 Bucket
             Images | Videos | Documents

           CloudWatch Monitoring
                  │
          CPU | Memory | Logs

          CloudTrail Audit Logs

           IAM Users & Roles

          EBS Volumes attached to EC2
```

---

# ☁️ AWS Services Used

| AWS Service                 | Purpose                           |
| --------------------------- | --------------------------------- |
| IAM                         | Identity and Access Management    |
| EC2                         | Host the application              |
| VPC                         | Secure networking                 |
| EBS                         | Persistent storage for EC2        |
| S3                          | Store images and static files     |
| Elastic Load Balancer (ELB) | Distribute incoming traffic       |
| Auto Scaling                | Automatically scale EC2 instances |
| Amazon RDS                  | Relational database               |
| DynamoDB                    | Shopping cart, sessions, wishlist |
| CloudWatch                  | Monitoring and alerts             |
| CloudTrail                  | Audit logging and security        |

---

# 👤 Step 1: IAM (Identity and Access Management)

## Create IAM Users

* Admin
* Developer
* Tester

## Create IAM Groups

* Admins
* Developers
* ReadOnly

## Attach Policies

* AmazonEC2FullAccess
* AmazonS3FullAccess
* CloudWatchReadOnlyAccess

### Purpose

Only authorized employees should be able to manage AWS resources securely.

---

# 🌐 Step 2: Create VPC

## CIDR Block

```
10.0.0.0/16
```

## Subnets

### Public Subnets

```
10.0.1.0/24
10.0.2.0/24
```

### Private Subnets

```
10.0.3.0/24
10.0.4.0/24
```

## Components

* Internet Gateway
* Route Tables
* Security Groups
* Network ACLs (NACL)

### Purpose

Provide a secure and isolated network environment for AWS resources.

---

# 💻 Step 3: Launch EC2 Instances

## Instance Type

```
t2.micro
```

## Operating System

* Ubuntu Server

## Install Software

* Apache
* Nginx
* Python
* Node.js
* Java

## Deploy Application

Choose any framework:

* React
* Django
* Spring Boot
* Node.js

Attach an **Amazon EBS Volume** for persistent storage.

---

# 💾 Step 4: Amazon EBS

## Create Volume

```
30 GB GP3
```

## Mount Location

```
/var/www
```

## Store

* Website files
* Logs
* Configuration files

### Purpose

Provides persistent block storage for EC2 instances.

---

# 🪣 Step 5: Amazon S3

## Bucket Name

```
ecommerce-product-images
```

## Store

* Product Images
* Customer Profile Images
* Videos
* PDF Bills
* Invoices

### Example Folder Structure

```
images/
products/
invoice/
customer-profile/
```

### Workflow

```
User Uploads Image
        │
        ▼
Stored in Amazon S3
        │
        ▼
Application Displays Image Using S3 URL
```

---

# 🗄️ Step 6: Amazon RDS

## Database Engine

```
MySQL
```

## Tables

### Users

```
id
name
email
password
```

### Products

```
id
name
price
stock
```

### Orders

```
order_id
user_id
product_id
status
```

### Additional Tables

* Payments
* Reviews

### Purpose

Store structured relational data for the application.

---

# ⚡ Step 7: Amazon DynamoDB

## Store

* Shopping Cart
* User Sessions
* Wishlist

### Example

```
UserID
CartItems
Quantity
```

### Why DynamoDB?

* Fully Managed NoSQL Database
* Extremely Fast
* Low Latency
* Supports Millions of Requests

---

# ⚖️ Step 8: Application Load Balancer (ELB)

Create an **Application Load Balancer (ALB)**.

## Request Flow

```
User
   │
   ▼
Application Load Balancer
   │
 ┌─┴──────────────┐
 │                │
EC2-1         EC2-2
```

### Failure Handling

If **EC2-1** becomes unhealthy,

```
Load Balancer
      │
Removes EC2-1
      │
Routes Traffic
      │
EC2-2
```

Users continue accessing the application without downtime.

---

# 📈 Step 9: Auto Scaling

## Configuration

| Setting           | Value |
| ----------------- | ----- |
| Minimum Instances | 2     |
| Desired Instances | 2     |
| Maximum Instances | 10    |

## Scaling Policy

### Scale Out

```
CPU > 70%

↓

Launch New EC2 Instance
```

### Scale In

```
CPU < 30%

↓

Terminate Extra Instance
```

### Example

During the **Amazon Great Indian Festival Sale**:

```
2 EC2 Instances

↓

10 EC2 Instances

↓

Back to 2
```

No manual intervention is required.

---

# 📊 Step 10: Amazon CloudWatch

## Monitor

* CPU Utilization
* Memory Usage
* Network Traffic
* Disk Usage
* Application Logs

## Configure Alarms

Example:

```
CPU > 80%
```

Send notifications through:

* Email
* SMS
* Slack

## Dashboard Metrics

* Requests
* Response Time
* Error Rate
* Latency

---

# 🔒 Step 11: AWS CloudTrail

CloudTrail records every AWS API activity.

Examples:

* Who created an EC2 instance
* Who deleted an S3 bucket
* IAM modifications
* Login attempts
* Failed login attempts

### Benefits

* Auditing
* Compliance
* Security Investigation

---

# 🔐 Security Groups

## EC2 Security Group

| Port | Purpose            |
| ---- | ------------------ |
| 22   | SSH (Your IP Only) |
| 80   | HTTP               |
| 443  | HTTPS              |

## RDS Security Group

| Port | Access                  |
| ---- | ----------------------- |
| 3306 | Only EC2 Security Group |

---

# 🔄 Application Request Flow

```text
User
   │
   ▼
DNS
   │
   ▼
Application Load Balancer
   │
   ▼
EC2 Instance
   │
   ├────────► Amazon RDS
   │
   └────────► Amazon S3
   │
   ▼
Response Sent to User
```

---

# 📁 Suggested Project Structure

```text
Project/
│
├── Frontend/
├── Backend/
├── Images/
├── Database/
├── Terraform/
├── Docker/
└── README.md
```

---

# ❌ Failure Scenario

Suppose **EC2 Instance 1** crashes.

```
Load Balancer

↓

Health Check Failed

↓

Removes EC2-1

↓

Routes Requests

↓

EC2-2 Continues Serving Users
```

Result:

✅ No Downtime

---

# 🚀 Scaling Scenario

### 9:00 PM

```
500 Users
```

### 9:05 PM

```
20,000 Users
```

CloudWatch detects:

```
CPU = 90%
```

Auto Scaling launches:

```
EC2-3

EC2-4

EC2-5
```

The Load Balancer distributes traffic evenly across all healthy instances.

---

# ✅ Benefits

* High Availability
* Fault Tolerance
* Automatic Scaling
* Secure Access Management
* Centralized Monitoring
* Persistent Storage
* Managed Database
* Fast NoSQL Storage
* Security Auditing
* Production-Ready Architecture

---

# 📚 Learning Outcomes

By completing this project, you will gain hands-on experience with:

* IAM (Users, Groups, Roles, Policies)
* VPC (Networking and Security)
* EC2 (Virtual Servers)
* EBS (Persistent Storage)
* Amazon S3 (Object Storage)
* Elastic Load Balancer (Traffic Distribution)
* Auto Scaling Groups
* Amazon RDS (Relational Database)
* Amazon DynamoDB (NoSQL Database)
* Amazon CloudWatch (Monitoring & Alerts)
* AWS CloudTrail (Auditing & Logging)

---

# 🎯 Conclusion

This project closely resembles the cloud architecture used by modern e-commerce platforms such as **Amazon**, **Flipkart**, and **Myntra**. It demonstrates best practices for building secure, scalable, fault-tolerant, and highly available applications on AWS while providing valuable hands-on experience with essential AWS services.
# 🛒 Scalable E-Commerce Website on AWS

## 📖 Project Overview

This project demonstrates how to build a **highly available, scalable, secure, and production-ready e-commerce application** using core AWS services. The architecture is designed to handle thousands of concurrent users while ensuring high availability, automatic scaling, secure storage, monitoring, and auditing.

The project simulates a real-world online shopping platform similar to **Amazon**, **Flipkart**, or **Myntra**.

---

# 🎯 Project Requirements

* Handle thousands of concurrent users.
* Ensure zero or minimal downtime.
* Store product images and documents securely.
* Protect customer data.
* Automatically scale during high traffic.
* Monitor infrastructure and applications.
* Maintain audit logs for security and compliance.

---

# 🏗️ AWS Architecture

```text
                      Users
                        │
                 Internet Gateway
                        │
                Application Load Balancer
                        │
         ┌──────────────┴──────────────┐
         │                             │
      EC2 Instance 1               EC2 Instance 2
         │                             │
         └──────────────┬──────────────┘
                        │
                 Auto Scaling Group
                        │
                Amazon RDS (MySQL)
                        │
                 Product Information

                Amazon S3 Bucket
             Images | Videos | Documents

           CloudWatch Monitoring
                  │
          CPU | Memory | Logs

          CloudTrail Audit Logs

           IAM Users & Roles

          EBS Volumes attached to EC2
```

---

# ☁️ AWS Services Used

| AWS Service                 | Purpose                           |
| --------------------------- | --------------------------------- |
| IAM                         | Identity and Access Management    |
| EC2                         | Host the application              |
| VPC                         | Secure networking                 |
| EBS                         | Persistent storage for EC2        |
| S3                          | Store images and static files     |
| Elastic Load Balancer (ELB) | Distribute incoming traffic       |
| Auto Scaling                | Automatically scale EC2 instances |
| Amazon RDS                  | Relational database               |
| DynamoDB                    | Shopping cart, sessions, wishlist |
| CloudWatch                  | Monitoring and alerts             |
| CloudTrail                  | Audit logging and security        |

---

# 👤 Step 1: IAM (Identity and Access Management)

## Create IAM Users

* Admin
* Developer
* Tester

## Create IAM Groups

* Admins
* Developers
* ReadOnly

## Attach Policies

* AmazonEC2FullAccess
* AmazonS3FullAccess
* CloudWatchReadOnlyAccess

### Purpose

Only authorized employees should be able to manage AWS resources securely.

---

# 🌐 Step 2: Create VPC

## CIDR Block

```
10.0.0.0/16
```

## Subnets

### Public Subnets

```
10.0.1.0/24
10.0.2.0/24
```

### Private Subnets

```
10.0.3.0/24
10.0.4.0/24
```

## Components

* Internet Gateway
* Route Tables
* Security Groups
* Network ACLs (NACL)

### Purpose

Provide a secure and isolated network environment for AWS resources.

---

# 💻 Step 3: Launch EC2 Instances

## Instance Type

```
t2.micro
```

## Operating System

* Ubuntu Server

## Install Software

* Apache
* Nginx
* Python
* Node.js
* Java

## Deploy Application

Choose any framework:

* React
* Django
* Spring Boot
* Node.js

Attach an **Amazon EBS Volume** for persistent storage.

---

# 💾 Step 4: Amazon EBS

## Create Volume

```
30 GB GP3
```

## Mount Location

```
/var/www
```

## Store

* Website files
* Logs
* Configuration files

### Purpose

Provides persistent block storage for EC2 instances.

---

# 🪣 Step 5: Amazon S3

## Bucket Name

```
ecommerce-product-images
```

## Store

* Product Images
* Customer Profile Images
* Videos
* PDF Bills
* Invoices

### Example Folder Structure

```
images/
products/
invoice/
customer-profile/
```

### Workflow

```
User Uploads Image
        │
        ▼
Stored in Amazon S3
        │
        ▼
Application Displays Image Using S3 URL
```

---

# 🗄️ Step 6: Amazon RDS

## Database Engine

```
MySQL
```

## Tables

### Users

```
id
name
email
password
```

### Products

```
id
name
price
stock
```

### Orders

```
order_id
user_id
product_id
status
```

### Additional Tables

* Payments
* Reviews

### Purpose

Store structured relational data for the application.

---

# ⚡ Step 7: Amazon DynamoDB

## Store

* Shopping Cart
* User Sessions
* Wishlist

### Example

```
UserID
CartItems
Quantity
```

### Why DynamoDB?

* Fully Managed NoSQL Database
* Extremely Fast
* Low Latency
* Supports Millions of Requests

---

# ⚖️ Step 8: Application Load Balancer (ELB)

Create an **Application Load Balancer (ALB)**.

## Request Flow

```
User
   │
   ▼
Application Load Balancer
   │
 ┌─┴──────────────┐
 │                │
EC2-1         EC2-2
```

### Failure Handling

If **EC2-1** becomes unhealthy,

```
Load Balancer
      │
Removes EC2-1
      │
Routes Traffic
      │
EC2-2
```

Users continue accessing the application without downtime.

---

# 📈 Step 9: Auto Scaling

## Configuration

| Setting           | Value |
| ----------------- | ----- |
| Minimum Instances | 2     |
| Desired Instances | 2     |
| Maximum Instances | 10    |

## Scaling Policy

### Scale Out

```
CPU > 70%

↓

Launch New EC2 Instance
```

### Scale In

```
CPU < 30%

↓

Terminate Extra Instance
```

### Example

During the **Amazon Great Indian Festival Sale**:

```
2 EC2 Instances

↓

10 EC2 Instances

↓

Back to 2
```

No manual intervention is required.

---

# 📊 Step 10: Amazon CloudWatch

## Monitor

* CPU Utilization
* Memory Usage
* Network Traffic
* Disk Usage
* Application Logs

## Configure Alarms

Example:

```
CPU > 80%
```

Send notifications through:

* Email
* SMS
* Slack

## Dashboard Metrics

* Requests
* Response Time
* Error Rate
* Latency

---

# 🔒 Step 11: AWS CloudTrail

CloudTrail records every AWS API activity.

Examples:

* Who created an EC2 instance
* Who deleted an S3 bucket
* IAM modifications
* Login attempts
* Failed login attempts

### Benefits

* Auditing
* Compliance
* Security Investigation

---

# 🔐 Security Groups

## EC2 Security Group

| Port | Purpose            |
| ---- | ------------------ |
| 22   | SSH (Your IP Only) |
| 80   | HTTP               |
| 443  | HTTPS              |

## RDS Security Group

| Port | Access                  |
| ---- | ----------------------- |
| 3306 | Only EC2 Security Group |

---

# 🔄 Application Request Flow

```text
User
   │
   ▼
DNS
   │
   ▼
Application Load Balancer
   │
   ▼
EC2 Instance
   │
   ├────────► Amazon RDS
   │
   └────────► Amazon S3
   │
   ▼
Response Sent to User
```

---

# 📁 Suggested Project Structure

```text
Project/
│
├── Frontend/
├── Backend/
├── Images/
├── Database/
├── Terraform/
├── Docker/
└── README.md
```

---

# ❌ Failure Scenario

Suppose **EC2 Instance 1** crashes.

```
Load Balancer

↓

Health Check Failed

↓

Removes EC2-1

↓

Routes Requests

↓

EC2-2 Continues Serving Users
```

Result:

✅ No Downtime

---

# 🚀 Scaling Scenario

### 9:00 PM

```
500 Users
```

### 9:05 PM

```
20,000 Users
```

CloudWatch detects:

```
CPU = 90%
```

Auto Scaling launches:

```
EC2-3

EC2-4

EC2-5
```

The Load Balancer distributes traffic evenly across all healthy instances.

---

# ✅ Benefits

* High Availability
* Fault Tolerance
* Automatic Scaling
* Secure Access Management
* Centralized Monitoring
* Persistent Storage
* Managed Database
* Fast NoSQL Storage
* Security Auditing
* Production-Ready Architecture

---

# 📚 Learning Outcomes

By completing this project, you will gain hands-on experience with:

* IAM (Users, Groups, Roles, Policies)
* VPC (Networking and Security)
* EC2 (Virtual Servers)
* EBS (Persistent Storage)
* Amazon S3 (Object Storage)
* Elastic Load Balancer (Traffic Distribution)
* Auto Scaling Groups
* Amazon RDS (Relational Database)
* Amazon DynamoDB (NoSQL Database)
* Amazon CloudWatch (Monitoring & Alerts)
* AWS CloudTrail (Auditing & Logging)

---

# 🎯 Conclusion

This project closely resembles the cloud architecture used by modern e-commerce platforms such as **Amazon**, **Flipkart**, and **Myntra**. It demonstrates best practices for building secure, scalable, fault-tolerant, and highly available applications on AWS while providing valuable hands-on experience with essential AWS services.