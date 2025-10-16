pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Shraddha571997/ci-cd-webapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('my-web-app')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Remove existing container if running
                    sh 'docker rm -f my-web-app || true'
                    // Run new container
                    docker.image('my-web-app').run('-d -p 8081:80 --name my-web-app')
                }
            }
        }
    }
}
