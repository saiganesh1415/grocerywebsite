pipeline {
    agent any

    environment {
        IMAGE_NAME = 'grocery_website'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // This uses the Jenkins default SCM checkout configured in the pipeline job
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}

