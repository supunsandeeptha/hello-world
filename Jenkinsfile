pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }

        stage('Build') { 
            steps { 
                dir('/var/lib/jenkins/workspace/BuildAndDeployECR'){
                    sh'whoami'
                    sh'echo " ===== Build Maven ======= "'
                    sh'/opt/maven/bin/mvn clean install'
                    sh' cp /var/lib/jenkins/workspace/BuildAndDeployECR/webapp/target/webapp.war /var/lib/jenkins/workspace/BuildAndDeployECR/ '
                }

            }
        }
        stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        stage('Deploy') {
            steps {
                script{
                 app = docker.build("underwater")
                }
                script{
                        docker.withRegistry('https://943621582633.dkr.ecr.ap-southeast-2.amazonaws.com/jenkins-pipeline', 'ecr:ap-southeast-2:aws-credentials') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
    }
}