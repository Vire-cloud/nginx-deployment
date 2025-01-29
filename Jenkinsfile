pipeline {
    agent any  // Define which node to run the pipeline on, here 'any' means any available agent.

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add your build steps here, for example:
                // sh 'make build'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add your test steps here, for example:
                // sh 'make test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Add your deploy steps here, for example:
                // sh 'make deploy'
            }
        }
    }

    post {
        always {
            echo 'This will check always run after the pipeline, regardless of success or failure'
            // Clean-up or notifications can be added here
        }
    }
}
