pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout code from the repository
                    checkout scm

                    // Build Spring Boot application
                    sh 'clean install package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t voting:latest .'
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    // Push Docker image to AWS ECR
                    withDockerRegistry([url: "854267915471.dkr.ecr.ap-south-1.amazonaws.com/voting", credentialsId: 'aws-ecr-credentials']) {
                        sh 'docker push 854267915471.dkr.ecr.ap-south-1.amazonaws.com/voting:latest'
                    }
                }
            }
        }
    }
}
