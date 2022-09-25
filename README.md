[![CircleCI](https://dl.circleci.com/status-badge/img/gh/DevOpsHiker42/django_poll_app/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/DevOpsHiker42/django_poll_app/tree/master)

# Udacity Capstone Project: Django Poll App

## Project Summary
This project operationalizes a simple web application written using Python / Django for managing poll data. It is based on the Django tutorial at:
https://docs.djangoproject.com/en/4.1/intro/

The application is containerized using Docker and deployed to an Amazon Web Services (AWS) Elastic Kubernetes Service (EKS) cluster.

The project uses CircleCI for Continuous Delivery i.e. both Continuous Integration (CI) and Continuous Deployment (CD).
Deployment is blue/green, which is achieved by changing the origin of an AWS CloudFront distribution.
Use of CloudFront also facilitates access to the site via HTTPS.

The pipeline jobs included are:

| **Pipeline Phase** | **Job Name**          | **Description**                                       |
|--------------------|-----------------------|-------------------------------------------------------|
| CI                 | qa                    | Quality assurance steps including linting and testing |
|                    | docker-build          | Docker image build                                    |
|                    | docker-publish-latest | Publish Docker image to Docker Hub                    |
| CD                 | create-eks-cluster    | Create AWS EKS cluster                                |
|                    | run-migrations        | Run Django database migrations                        |
|                    | deploy-to-eks         | Deploy Docker image on EKS cluster                    |
|                    | smoke-test            | Smoke test deployed Django app on EKS                 |
|                    | cloudfront-update     | Update CloudFront origin to new EKS cluster           |
|                    | cleanup               | Remove old cluster                                    |


## Overview of Repository Files

| **Directory** | **File**                                          | **Description**                                                                |
|---------------|---------------------------------------------------|--------------------------------------------------------------------------------|
|               | Dockerfile                                        | Template file containing instructions for building Docker image                |
|               | Makefile                                          | File containing instructions for UNIX ``make`` utility                         |
|               | README.md                                         | *This file*                                                                    |
|               | .gitignore                                        | Git ignore file                                                                |
|               | cloudfront.yml                                    | YAML file for creating/updating CloudFront distribution via AWS CloudFormation |
|               | django-polls-deployment.yml                       | YAML file for creating EKS deployment of django-polls app                      |
|               | loadbalancer.yml                                  | YAML file for creating EKS LoadBalancer service                                |
|               | requirements.txt                                  | List of Python dependencies required by app.py                                 |
|               | run_docker.sh                                     | Script for running app.py standalone via Docker                                |
|               | upload_docker.sh                                  | Script for uploading Docker image to Docker Hub                                |
| .circleci     | config.yml                                        | CircleCI configuration (YAML) file                                             |
| poll_site     | *various*                                         | Django files                                                                   |
| Screenshots   | SCREENSHOT01_LINT_FAIL.png                        | Screenshot of lint step failure in CircleCI due to lint issue being caught     |
| Screenshots   | SCREENSHOT01_LINT_FIXED.png                       | Screenshot of lint step success in CircleCI following lint issue being fixed   |
| Screenshots   | SCREENSHOT03_BLUE_Pipeline_Run.png                | Screenshot of BLUE pipeline run                                                |
| Screenshots   | SCREENSHOT04_BLUE_Pipeline_Run_Deploy_Steps.png   | Screenshot of deploy-to-eks job steps for BLUE pipeline run                    |
| Screenshots   | SCREENSHOT05_BLUE_Pipeline_Deploy_app_Step.png    | Screenshot of step detail for Deploy_app step (BLUE pipeline run)              |
| Screenshots   | SCREENSHOT06_BLUE_EC2_INSTANCE.png                | Screenshot of BLUE EC2 instance                                                |
| Screenshots   | SCREENSHOT07_GREEN_Pipeline_Run.png               | Screenshot of GREEN pipeline run                                               |
| Screenshots   | SCREENSHOT08_GREEN_Pipeline_Run_Deploy_Steps.png  | Screenshot of deploy-to-eks job steps for GREEN pipeline run                   |
| Screenshots   | SCREENSHOT09_GREEN_Pipeline_Deploy_app_Step.png   | Screenshot of step detail for Deploy_app step (GREEN pipeline run)             |
| Screenshots   | SCREENSHOT10_GREEN_EC2_INSTANCE.png               | Screenshot of GREEN EC2 instance                                               |
| Screenshots   | SCREENSHOT11_BLUE_GREEN_Switchover_Steps.png      | Screenshot of BLUE/GREEN switchover (in GREEN pipeline run)                    |
| Screenshots   | SCREENSHOT12_Docker_Build_Job.png                 | Screenshot of Docker Build job (from GREEN run)                                |
| Screenshots   | SCREENSHOT13_BUILD_DOCKER_IMAGE_Step.png          | Screenshot of BUILD DOCKER IMAGE step in Docker Build job (from GREEN run)     |
| Screenshots   | SCREENSHOT14_ECR_Centralized_Image_Repo.png       | Screenshot of centralized ECR image repository                                 |

<End of README>
