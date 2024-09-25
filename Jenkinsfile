pipeline {
    agent any
    
    environment {
        DOCKER_USERNAME = credentials('docker-username') // Jenkins credential ID for DockerHub username
        DOCKER_PASSWORD = credentials('docker-password') // Jenkins credential ID for DockerHub password
    }

    stages {
        stage('Checkout code') {
            steps {
                // Pull the repository code
                git branch: 'main', url: 'https://github.com/tauseef-creator/mlops-docker-task-01.git'
            }
        }

        stage('Log in to DockerHub') {
            steps {
                script {
                    // Log in to DockerHub
                    sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh "docker build -t $DOCKER_USERNAME/linear-regression-app ."
            }
        }

        stage('Tag Docker Image') {
            steps {
                // Tag Docker image with 'latest'
                sh "docker tag $DOCKER_USERNAME/linear-regression-app $DOCKER_USERNAME/linear-regression-app:latest"
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to DockerHub
                sh "docker push $DOCKER_USERNAME/linear-regression-app:latest"
            }
        }
    }

    post {
        always {
            // Clean up Docker environment to avoid space issues
            sh "docker system prune -f"
        }
    }
}
