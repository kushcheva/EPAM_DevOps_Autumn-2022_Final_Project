
# Final project CI/CD

Example of integration and delivery of the Flask application by using the Jenkins pipeline to production server. 

![image](https://user-images.githubusercontent.com/96500223/219481001-60e4f7ea-7bf7-46c4-a67e-18bc68856f3e.png)


IT stack:

1. Python Flask framework.
2. GitHub as application source repository
3. Terraform
4. Docker and DockerHub
5. Jenkins as CI/CD
6. AWS EC2




## Installation

Create a web application fp_app.py with Python Flask and run test to make sure that code works.

![App Screenshot](https://github.com/kushcheva/EPAM_DevOps_Autumn-2022_Final_Project/blob/main/screenshots/1.png?raw=true)

Using Terraform create 2 instances: my_server_dev and my_server_prod with configurations of security group, ssh key and opened ports.

![App Screenshot](https://github.com/kushcheva/EPAM_DevOps_Autumn-2022_Final_Project/blob/main/screenshots/2.png?raw=true)

## Deployment

Run Jenkins pipeline on node my_server_dev, which create our Docker build and push it to Docker hub registry. The application source is Github. 

Then run container `docker run -d -p 5000:5000 kushcheva/fp_app`. Make sure there are no previous containers and images on current machine. The latest image should be pulled from Dockerhub.


![App Screenshot](https://github.com/kushcheva/EPAM_DevOps_Autumn-2022_Final_Project/blob/main/screenshots/3.png?raw=true)


If it works properly we will deploy latest build by pulling from Dockerhub on my_server_prod. We use separated pipeline not to mix development and production environments. Deployment pipeline will start by automatic trigger after the previous pipeline will done successfully.

As a result we have a working web Flask application.
