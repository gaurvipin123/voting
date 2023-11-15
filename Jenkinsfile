pipeline {
    agent any
    
    tools {
        maven 'Maven' // This assumes you have configured a Maven tool named 'Maven' in Jenkins
        jdk 'Java' // This assumes you have configured a JDK tool named 'Java' in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from the repository
                    checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Maven project
                    sh 'mvn clean package'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests (if applicable)
                    sh 'mvn test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Additional deployment steps if needed
                }
            }
        }
    }

    post {
        success {
            echo 'The build was successful! Deploy your application.'
            // Add deployment steps or notifications here
        }

        failure {
            echo 'The build failed. Please check the logs for details.'
            // Add failure notifications or cleanup steps here
        }
    }
}
