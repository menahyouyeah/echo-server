pipeline {
    agent { docker { image 'golang' } }
    stages {
        stage('build') {
            steps {
	        sh 'apt-get install build-essential'
                sh 'make build'
            }
        }
    }
}
