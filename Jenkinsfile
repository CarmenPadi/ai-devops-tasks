pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "your-docker-username/your-app:${env.BUILD_NUMBER}"
    DOCKER_REGISTRY_CREDENTIALS = 'docker-hub-credentials' // Jenkins credentials ID
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'npm test'
      }
    }

    stage('Build App') {
      steps {
        sh 'npm run build'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t $DOCKER_IMAGE ."
        }
      }
    }

    stage('Publish Docker Image') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: env.DOCKER_REGISTRY_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
            sh "docker push $DOCKER_IMAGE"
            sh "docker logout"
          }
        }
      }
    }
  }
}
