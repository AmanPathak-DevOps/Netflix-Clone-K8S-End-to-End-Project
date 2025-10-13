pipeline{
    agent any
    tools{
        nodejs 'nodejs'
    }
    environment {
        SCANNER_HOME=tool 'sonar-server'
    }
    stages {
        stage('Workspace Cleaning'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout from Git'){
            steps{
                git branch: 'master', url: 'https://github.com/AmanPathak-DevOps/Netflix-Clone-K8S-End-to-End-Project.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                dir('Application-Code') {
                    // Install project dependencies (needed for OWASP + build)
                    sh 'npm install'
                }
            }
        }
        stage("SonarQube Analysis") {
            steps {
                dir('Application-Code') {
                    withSonarQubeEnv('sonar-server') {
                        // Run SonarQube scanner using npx (no global install)
                        sh '''
                        echo "🔍 Starting SonarQube Analysis..."
                        npx @sonar/scan \
                        -Dsonar.projectKey=NetflixClone \
                        -Dsonar.projectName=NetflixClone \
                        -Dsonar.sources=src \
                        -Dsonar.language=ts \
                        -Dsonar.exclusions=dist/**,node_modules/**,public/** \
                        -Dsonar.host.url=$SONAR_HOST_URL \
                        -Dsonar.login=$SONAR_AUTH_TOKEN
                        '''
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                    script {
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token' 
                    }
                } 
            }
        stage('OWASP Dependency Check') {
            steps {
                dir('Application-Code') {
                    echo "🔒 Running OWASP Dependency Check..."
                    dependencyCheck additionalArguments: '--scan ./ --format XML --out .', odcInstallation: 'owasp-dp-check'
                    dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
                }
            }
        }
        stage('TRIVY FS SCAN') {
            steps {
                dir('Application-Code') {
                    sh "trivy fs . > trivyfs.txt"
                }
            }
        }
        stage("Docker Image Build"){
            steps{
                dir('Application-Code') {
                    script{
                       withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){   
                           
                           withCredentials([string(credentialsId: 'tmdb-api', variable: 'TMDB_API_KEY')]) {
                                sh """
                                    docker build \
                                    --build-arg TMDB_V3_API_KEY=${TMDB_API_KEY} \
                                    -t netflix .
                                """
                            }
                        }
                    }
                }
            }
        }
        stage("Docker Image Pushing"){
            steps{
                dir('Application-Code') {
                    script{
                       withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){   
                           sh "docker tag netflix avian19/netflix:latest "
                           sh "docker push avian19/netflix:latest "
                        }
                    }
                }
            }
        }
        stage("TRIVY Image Scan"){
            steps{
                sh "trivy image avian19/netflix:latest > trivyimage.txt" 
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    dir('Kubernetes') {
                        withKubeConfig(credentialsId: 'k8s') {
                            sh 'kubectl apply -f deployment.yml'
                            sh 'kubectl apply -f service.yml'
                            sh 'kubectl get svc'
                            sh 'kubectl get all'
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                def colorCode = currentBuild.result == 'SUCCESS' ? '#2eb886' : 
                                currentBuild.result == 'FAILURE' ? '#ff0000' : '#daa038'
    
                slackSend(
                    channel: '#devops-alerts',
                    color: colorCode,
                    message: """
                    *🚀 Jenkins Build Notification*
                    *Project:* ${env.JOB_NAME}
                    *Build Number:* #${env.BUILD_NUMBER}
                    *Status:* *${currentBuild.result}*
                    *URL:* <${env.BUILD_URL}|Open Build>
    
                    ${currentBuild.result == 'SUCCESS' ? '✅ All steps completed successfully!' : 
                    currentBuild.result == 'FAILURE' ? '❌ Build failed. Please check logs.' : 
                    '⚠️ Build is unstable or aborted.'}
                    """.stripIndent()
                )
            }
        }
    }
}
