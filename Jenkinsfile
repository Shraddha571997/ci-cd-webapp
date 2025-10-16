pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-web-app"
        CONTAINER_NAME = "my-web-app"
        HOST_PORT = "8081"
        CONTAINER_PORT = "80"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code from GitHub..."
                git branch: 'main', url: 'https://github.com/Shraddha571997/ci-cd-webapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Stopping and removing existing container (if any)..."
                script {
                    // Stop container if running
                    bat """
                    docker stop ${CONTAINER_NAME} 2>nul
                    docker rm ${CONTAINER_NAME} 2>nul
                    """
                    
                    // Run new container
                    echo "Starting new Docker container..."
                    bat "docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully! Web app should be running at http://localhost:${HOST_PORT}"
        }
        failure {
            echo "Pipeline failed. Check console output for errors."
        }
    }
}
