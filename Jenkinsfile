pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t service-website .'
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
                // Run the new container
                sh 'docker run -d -p 80:80 -v /path/to/your/source/code:/usr/share/nginx/html service-website'
            }
        }
    }
}

