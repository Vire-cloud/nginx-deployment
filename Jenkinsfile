pipeline {
    agent any

    environment {
        KUBECONFIG = '/var/jenkins_home/.kube/config/k3s.yaml' // Path to your kubeconfig file
        GIT_REPO = 'https://github.com/Vire-cloud/nginx-deployment/' // Git repository URL
        GIT_BRANCH = 'main' // Branch containing nginx-deployment.yaml
    }

    stages {
        stage('Create ConfigMap for Nginx') {
            steps {
                script {
                    // Applying the ConfigMap to Kubernetes
                    sh '''
                    kubectl apply -f - <<EOF
                    apiVersion: v1
                    kind: ConfigMap
                    metadata:
                      name: nginx-html
                    data:
                      index.html: |
                        <!DOCTYPE html>
                        <html>
                        <head>
                            <title>Welcome to Nginx12!</title>
                        </head>
                        <body>
                            <h1>Welcome to automate world!</h1>
                            <p>This is served from a Kubernetes ConfigMap.</p>
                        </body>
                        </html>
                    EOF
                    '''
                }
            }
        }
        stage('Clone Repository') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Deploy Nginx') {
            steps {
                script {
                    // Apply the Nginx deployment YAML
                    sh "kubectl apply -f nginx-configmap.yaml --kubeconfig=${KUBECONFIG}"
                    sh "kubectl rollout restart deployment nginx-deployment --kubeconfig=${KUBECONFIG}"
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Check the status of the deployment and pods
                    sh 'kubectl get deployments'
                    sh 'kubectl get pods'
                    sh 'kubectl get svc'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Nginx deployment was successful.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for errors.'
        }
    }
}
