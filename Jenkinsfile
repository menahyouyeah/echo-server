pipeline {
    agent any
    // Trigger Jenkins to poll the repo every 5 minutes and build if there is a change.
    triggers {
        pollSCM('1 * * * *')
    }
    options {
        // This is required to clean before build
        skipDefaultCheckout(true)
    }
    stages {
        stage('build') {
            steps {
		// Clean before build
		cleanWs()

		// We need to explicitly checkout from SCM here
                checkout scm

		// Echoing things for debugging
		sh 'echo $PATH'
		sh 'env'
		sh 'ls -R'
		
		// Build the docker image. Go assumes this is writable - setting the variable to something that's universally writeable. 
                sh 'XDG_CACHE_HOME=/tmp/.cache make docker'

		// Tag the image
		sh 'docker tag jmalloc/echo-server:dev \
		us-east4-docker.pkg.dev/minnah-starter-project/starter-project/echo-server'

		// Push to artifact registory
		sh 'docker push us-east4-docker.pkg.dev/minnah-starter-project/starter-project/echo-server'

		// Deploy the docker image to stage
	        sh 'skaffold deploy --images=us-east4-docker.pkg.dev/minnah-starter-project/starter-project/echo-server:latest --profile=stage'

		// Deploy the docker image to prod
	        sh 'skaffold deploy --images=us-east4-docker.pkg.dev/minnah-starter-project/starter-project/echo-server:latest --profile=prod'

		sh 'echo "hello world"'
		sh 'echo "testing during demo"'
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
