pipeline {
    agent any

    environment {
        GIT_REPO="https://github.com/paulovitorcl/Jenkins-and-Taurus.git"
        GIT_BRANCH="main"
    }

    stages {
        stage ("Git checkout"){
            steps {
                deleteDir()
                git branch: "$GIT_BRANCH", url: "$GIT_REPO"
            }
        }
        stage ("Build") {
            // Run the build 
            steps {
                script {
                    sh 'echo Build'
                }
            }
        }
        stage ("Push image to ECR") {
            steps {
                script {
                    sh 'echo Push'
                }
            }
        }
        stage ("Tests") {
            when { expression { fileExists("${WORKSPACE}/*.yml") } }
            steps {
                script{
                    try {
                        sh "docker run --rm -v ${WORKSPACE}:/bzt-configs -v ${WORKSPACE}/reports:/tmp/artifacts blazemeter/taurus example.yml"
                  } finally {
                    junit 'reports/report.xml'
                    cleanWs()
                }
                }
            }
        }
        stage ("Deploy") {
            // Run the deploy
            steps {
                script {
                    sh 'echo Deploy'
                }
            }
        }
    }
}
