pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                checkout scm
            }
        }
        stage('Deploy') {
            steps {
                // Check if the container is already running
                script {
                    def containerId = sh(script: 'docker ps -q --filter "name=service-website"', returnStdout: true).trim()
                    if (containerId) {
                        // If the container is running, stop and remove it
                        sh "docker stop $containerId"
                        sh "docker rm $containerId"
                    }
                }
                // Run the new container with volume mount
                sh 'docker run -d -p 80:80 -v /service-website:/usr/share/nginx/html nginx:latest'
            }
        }
    }
}
