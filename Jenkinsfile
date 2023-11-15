pipeline {
    agent any

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

        stage('Push to ECR') {
            steps {
                script {
                    // Push Docker image to AWS ECR
                    // withDockerRegistry([url: "https://854267915471.dkr.ecr.ap-south-1.amazonaws.com/voting", credentialsId: 'aws-ecr-credentials']) {
                        sh 'docker push 854267915471.dkr.ecr.ap-south-1.amazonaws.com/voting:latest'
                    }
                }
            }
        }
    }
}
