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
                    withDockerRegistry([url: "https://<your-account-id>.dkr.ecr.<your-region>.amazonaws.com", credentialsId: 'aws-ecr-credentials']) {
                        sh 'docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/<your-repo-name>:<your-tag>'
                    }
                }
            }
        }
    }
}
