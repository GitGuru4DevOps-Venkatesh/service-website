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
                sh 'docker build -t responsive-portfolio .'
            }
        }
        stage('Deploy') {
            steps {
                
            }
        }
    }
}
