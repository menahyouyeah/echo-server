pipeline {
    agent { docker { image 'golang' } }
    stages {
        stage('build') {
            steps {
		sh 'echo $PATH'
		sh 'env'
		sh 'ls -R'
                sh 'make build'  
            }
        }
    }
}
