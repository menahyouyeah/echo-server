pipeline {
    agent { docker { image 'golang' } }
    stages {
        stage('build') {
            steps {
		// Create our project directory.
                sh 'cd ${GOPATH}/src'
                sh 'mkdir -p ${GOPATH}/src/MY_PROJECT_DIRECTORY'

                // Copy all files in our Jenkins workspace to our project directory.                
                sh 'cp -r ${WORKSPACE}/* ${GOPATH}/src/MY_PROJECT_DIRECTORY'

                // Build the app.
                sh 'go build'  
            }
        }
    }
}
