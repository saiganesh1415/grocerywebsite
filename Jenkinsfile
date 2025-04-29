pipeline {
    agent any

    environment {
        IMAGE_NAME = 'saiganesh1415/grocerywebsitegithubio-master-grocery_website:latest'
    }

    stages {
        // Stage 1: Checkout code from GitHub using Personal Access Token (stored securely)
        stage('Checkout Code') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                    git url: "https://${GITHUB_TOKEN}@github.com/saiganesh1415/grocerywebsite.git", branch: 'main'
                }
            }
        }

        // Stage 2: Build Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('frontend-app-image', '.')
                }
            }
        }

        // Stage 3: Run Docker Compose
        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }

        // Stage 4: Test containers
        stage('Test Containers') {
            steps {
                sh 'docker ps'
                sh 'docker-compose logs frontend'
            }
        }

        // Stage 5: Push image to Docker Hub
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    script {
                        sh '''
                            echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                            docker tag frontend-app-image:latest $IMAGE_NAME
                            docker push $IMAGE_NAME
                            docker logout
                        '''
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
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
