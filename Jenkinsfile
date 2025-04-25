pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/saiganesh1415/grocerywebsite.git'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Building the project..."'
                sh 'npm install' // Install dependencies
                sh 'npm run build' // Build the project
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh 'npm test' // Run tests
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying the application..."
                // Add your deployment commands here
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
