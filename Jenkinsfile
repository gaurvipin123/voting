pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="854267915471"
        AWS_DEFAULT_REGION="ap-south-1"
        IMAGE_REPO_NAME="voting"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "854267915471.dkr.ecr.ap-south-1.amazonaws.com/voting"
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
                    sh 'docker build -t springboot:1.2 .'
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
                     sh """docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"""
                    
                }
            }
        }
    }
}
