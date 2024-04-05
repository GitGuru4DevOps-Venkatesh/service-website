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
                sh 'docker run -d -p 80:80 responsive-portfolio'
            }
        }
        stage('Publish to Nexus') {
            steps {
                // Use the Sonatype Nexus Artifact Uploader or other relevant steps
                // to publish your website artifacts to Nexus Repository Manager.
                // Make sure to configure Nexus credentials.
            }
        }
    }
}
