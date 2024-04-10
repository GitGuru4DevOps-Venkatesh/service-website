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
                sh 'docker run -d -p 80:80 service-website'
            }
        }
    }
}
