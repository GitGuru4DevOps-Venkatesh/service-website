pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Build Docker image
                script {
                    docker.build('creativehub')
                }
            }
        }
        stage('Deploy') {
            steps {
                // Stop and remove existing container (if any)
                script {
                    sh 'docker stop personal-website || true'
                    sh 'docker rm personal-website || true'
                }
                // Run Docker container
                script {
                    docker.run('creativehub', '-d -p 80:80 --name docker-service-website')
                }
            }
        }
    }
}
