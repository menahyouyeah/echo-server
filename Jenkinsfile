pipeline {
    agent any
    // Trigger Jenkins to run every 20 min. 
    triggers {
        cron('*/5 * * * *')
    }
    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }
    stages {
        stage('build') {
            steps {
		// Clean before build
		cleanWs()
		// We need to explicitly checkout from SCM here
                checkout scm	
		sh 'echo $PATH'
		sh 'env'
		sh 'ls -R'
                sh 'XDG_CACHE_HOME=/tmp/.cache make docker'
		// Authenticate in order to push the docker image to artifact registry
		//sh 'gcloud auth configure-docker us-east4-docker.pkg.dev'
		// Tag the image
		sh 'docker tag jmalloc/echo-server:dev \
		us-east4-docker.pkg.dev/minnah-starter-project/starter-project/echo-server:tag1'
		// Push to artifact registory
		sh 'docker push us-east4-docker.pkg.dev/minnah-starter-project/starter-project/echo-server:tag1'
            }
        }
    }
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
        }
    }
}
