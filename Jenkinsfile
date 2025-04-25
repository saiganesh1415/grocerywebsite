pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your repository
                git 'https://github.com/saiganesh1415/grocerywebsite.git'
            }
        }

        stage('Build') {
            steps {
                // Build commands for your project
                sh 'echo "Building the project..."'
                // Assuming a Node.js application, add the build command
                sh 'npm install' // Install dependencies
                sh 'npm run build' // Replace with your build command if different
            }
        }

        stage('Test') {
            steps {
                // Run your tests here
                sh 'echo "Running tests..."'
                sh 'npm test' // Replace this with your testing command if different
            }
        }
        
        stage('Deploy') {
            steps {
                // Add commands to deploy your application
                echo "Deploying the application..."
                // Example: sh 'deploy-script.sh' or use appropriate deployment commands
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
