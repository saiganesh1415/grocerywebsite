pipeline {
    agent any

    environment {
        IMAGE_NAME = 'grocerywebsitegithubio-master-grocery_website:latest'
    }

    stages {
        // Stage 1: Checkout the code from the Git repository
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/saiganesh1415/grocerywebsite.git', branch: 'main'
            }
        }

        // Stage 2: Build the Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with a custom tag (frontend-app-image)
                    docker.build('frontend-app-image', '.')
                }
            }
        }

        // Stage 3: Run Docker Compose to start containers
        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose up -d --build'  // Builds and starts containers in detached mode
            }
        }

        // Stage 4: Test the running containers
        stage('Test Containers') {
            steps {
                sh 'docker ps'  // Display the list of running containers
                sh 'docker-compose logs frontend'  // Check logs for the frontend service
            }
        }

        // Stage 5: Push the Docker image to Docker Hub
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',  // Make sure you have this credential ID set in Jenkins
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    script {
                        // Login to Docker Hub
                        sh '''
                            echo "$user_password" | docker login -u "$user_name" --password-stdin
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
            // Cleanup resources after the pipeline execution
            echo 'Cleaning up...'
            sh 'docker system prune -f'  // Clean unused Docker data
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for more details.'
        }
    }
}
