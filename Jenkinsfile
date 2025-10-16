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

        // Replace this old stage with the Windows-ready one
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    bat """
                    docker stop my-web-app 2>nul
                    docker rm my-web-app 2>nul
                    """

                    // Run new container
                    bat 'docker run -d -p 8081:80 --name my-web-app my-web-app'
                }
            }
        }
    }
}
