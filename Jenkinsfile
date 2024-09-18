pipeline {
    agent { label 'agent2' }

    stages {
        stage('Clean Up Old Docker Stack') {
            steps {
                script {
                    // Attempt to remove the old stack and images
                    sh 'docker stack rm myapp-stack || true'
                    sh 'docker rmi -f nginx_custom || true'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the new Docker image with system info
                    sh 'docker build -t nginx_custom .'
                }
            }
        }

        stage('Deploy on Docker Swarm') {
            steps {
                script {
                    // Deploy the updated service in Docker Swarm
                    sh 'docker stack deploy --compose-file docker-compose.yml myapp-stack'
                }
            }
        }
    }
}
