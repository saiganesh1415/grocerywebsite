pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/saiganesh1415/grocerywebsite.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('frontend-app-image')
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'docker system prune -f'
        }
    }
}
