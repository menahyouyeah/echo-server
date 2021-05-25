pipeline {
    agent { docker { image 'golang' } }
    stages {
        stage('build') {
            steps {
		sh 'echo $PATH'
		sh 'env'
		sh 'ls -R'
		sh 'whoami'
                sh 'XDG_CACHE_HOME=/home/minnah make build'  
            }
        }
    }
}
