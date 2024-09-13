pipeline {
    agent { label 'agent1' }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Since Docker Swarm doesn't use `docker-compose build`, ensure the image is built
                    sh 'docker build -t nginx_custom .'
                }
            }
        }

        stage('Deploy on Swarm') {
            steps {
                script {
                    // Use docker stack deploy to run the service in Swarm
                    sh 'docker stack deploy --compose-file docker-compose.yml myapp-stack'
                }
            }
        }
    }
}
