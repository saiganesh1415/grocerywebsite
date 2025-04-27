pipeline {
    agent any

    environment {
        IMAGE_NAME = 'grocerywebsitegithubio-master-grocery_website:latest'
    }

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

        stage('Test Containers') {
            steps {
                sh 'docker ps'
                sh 'docker-compose logs frontend'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'github-token',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    script {
                        sh """
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker tag frontend-app-image:latest ${IMAGE_NAME}
                            docker push ${IMAGE_NAME}
                            docker logout
                        """
                    }
                }
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
