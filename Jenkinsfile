pipeline {
    agent any
    stages {
        stage('build') {
            steps {
		sh 'echo $PATH'
		sh 'env'
		sh 'ls -R'
                sh 'XDG_CACHE_HOME=/tmp/.cache make docker'
		sh 'ls -R'  
            }
        }
    }
}
