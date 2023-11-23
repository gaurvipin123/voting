pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="295708546847"
        AWS_DEFAULT_REGION="ap-south-1"
        IMAGE_REPO_NAME="voting"
        IMAGE_TAG="1.5"
        REPOSITORY_URI = "295708546847.dkr.ecr.ap-south-1.amazonaws.com/voting"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout code from the repository
                    checkout scm

                    // Build Spring Boot application
                    sh 'chmod +x mvnw'
                    sh './mvnw clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t "${IMAGE_REPO_NAME}:${IMAGE_TAG}" .'
                }
            }
        }
        stage('Logging into AWS ECR') {
            steps {
                script {
                sh """aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"""
                }
                 
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    // Push Docker image to AWS ECR
                     sh """docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"""
                     sh """docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"""
                    
                }
            }
        }
    }
}
