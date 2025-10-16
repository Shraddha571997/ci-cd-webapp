pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Shraddha571997/ci-cd-webapp.git

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
                    docker.image('my-web-app').run('-d -p 8081:80')
                }
            }
        }
    }
}
