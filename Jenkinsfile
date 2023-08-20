pipeline {
    agent {
        node "agent"
    }
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    
    stages {
        stage('build image') {
            steps {
                dir('/home/ubuntu/nodejs_app') {
                sh "docker build -t tamarshnirer/hello_nodejs ."
                }
            }
        }
    
        stage('login') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW"
            }
        }
        
        stage('push') {
            steps {
                    sh "docker push tamarshnirer/hello_nodejs:latest"
                    sh "docker rmi tamarshnirer/hello_nodejs:latest"
            }
        }
        
        stage('deploy') {
            steps {
                sshagent(['deployment']) {
                    sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.11.149 'whoami'"
                }
            }
        }
    }
}