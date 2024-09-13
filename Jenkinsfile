pipeline {
    agent { label 'agent1' }

    stages {
        stage('Clean Up Old Docker Image') {
            steps {
                script {
                    // Attempt to remove the old Docker image
                    sh 'docker rmi -f nginx_custom || true'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the new Docker image
                    sh 'docker build -t nginx_custom .'
                }
            }
        }

        stage('Deploy on Swarm') {
            steps {
                script {
                    // Deploy the updated service in Docker Swarm
                    sh 'docker stack deploy --compose-file docker-compose.yml myapp-stack'
                }
            }
        }
    }
}
