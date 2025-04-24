pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/saiganesh1415/grocerywebsite.github.io.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('grocery_website')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
