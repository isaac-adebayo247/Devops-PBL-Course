# Capstone Project - Containerization and Container Orchestration

### Phase 1: Basic Frontend Application with Docker and Kubernetes

#### 1. Hypothetical Use Case
You are developing a simple static website (HTML and CSS) for a company's landing page. The goal is to containerize this application using Docker, deploy it to a Kubernetes cluster, and deploy it to a Kubernetes cluster, and access it through Nginx.

#### 2. Tasks
##### Task 1: Set up your project

- Created a new project directory
- Inside the directory, created an HTML file (**`index.html`**) and a CSS file (**`styles.css`**).

##### Task 2: Initialize Git
- Initialized a Git repository in the project directory

##### Task 3: Git Commit
- Added and commited the initialized code to the Git repository

##### Task 4: Dockerize the application
- Created a **`Dockerfile`** specifying Nginx as the base image.
  
- Copied the HTML and CSS files into the Nginx HTML directory. (Used ChatGPT to generate a basic HTML and CSS code for a simple web application)

##### Task 5: Push to Docker Hub
- Logged in to Docker Hub.

- Pushed the Docker image to Docker Hub.

##### Task 6: Set up Kind Kubernetes Cluster
- Installed Kind (Kubernetes in Docker)

- Created a Kind cluster.

##### Task 7: Deploy to Kubernetes
- Created a Kubernetes Deployment YAML file specifying the image and desired replicas.

- Applied the deployment to the cluster.

##### Task 8: Create a Service (ClusterIP)
- Created a Kubernetes Service YAML file specifying the type as ClusterIP

- Applied the service the cluster.

###### Task 9: Access the Application
- Port-forwarded to the service to access the application locally.

- Opened the browser and visited the specified port to view the simple frontend application.
