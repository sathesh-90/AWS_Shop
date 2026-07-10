# AWS-Ecommerce-Demo

A beginner-friendly e-commerce demo that shows how a simple web application can be organized like a real AWS-based production project.

## Project Overview

This project demonstrates a modern web application architecture using:
- Frontend: HTML, CSS, and JavaScript
- Backend: Python FastAPI
- Database: MySQL SQL scripts
- Infrastructure: Terraform
- Containerization: Docker

The website displays products such as a laptop, phone, and headphones while illustrating how the same application would be deployed on AWS.

## Folder Structure

- Frontend/: Static website files
- Backend/: FastAPI REST API and app logic
- Database/: SQL schema and sample data
- Images/: Architecture and diagram assets
- Terraform/: Infrastructure as Code for AWS
- Docker/: Container build and compose setup

## Technologies Used

- Python 3
- FastAPI
- Uvicorn
- MySQL
- Terraform
- Docker
- HTML5, CSS3, JavaScript

## Installation

1. Clone the repository.
2. Navigate to the project folder.
3. Create a Python virtual environment.
4. Install dependencies:

```bash
cd aws-ecommerce-demo/Backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Running Locally

Start the FastAPI server:

```bash
cd aws-ecommerce-demo/Backend
uvicorn app:app --reload --host 0.0.0.0 --port 5000
```

Open your browser at:
- http://127.0.0.1:5000/

The API endpoints are:
- http://127.0.0.1:5000/products
- http://127.0.0.1:5000/health

## Docker Setup

Build and run the container:

```bash
cd aws-ecommerce-demo/Docker
docker compose up --build
```

The app will be available at http://localhost:5000.

## Terraform Deployment

Initialize and apply Terraform:

```bash
cd aws-ecommerce-demo/Terraform
terraform init
terraform plan
terraform apply
```

## AWS Architecture

This demo maps to common AWS services:

- Frontend -> Amazon EC2 or Amazon S3
- Backend -> Amazon EC2
- Database -> Amazon RDS
- Images -> Amazon S3
- Terraform -> Infrastructure as Code
- Docker -> Containerization
- Monitoring -> CloudWatch
- Security -> IAM
- Networking -> VPC
- Scaling -> Auto Scaling
- Traffic -> Application Load Balancer

## Future Improvements Need to be done , this is a demo-purpose Project 
- Add user authentication
- Connect FastAPI to a real MySQL database
- Add product search and filters
- Add shopping cart and checkout flow
- Deploy to AWS ECS or EKS

## License

This project is licensed under the Sathish.
