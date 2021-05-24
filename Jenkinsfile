pipeline {
    agent { docker { image 'continuul/build-essential' } }
    stages {
        stage('build') {
            steps {
                sh 'make build'
            }
        }
    }
}
