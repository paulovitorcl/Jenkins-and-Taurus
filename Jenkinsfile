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
        stage ("Tests") {
            steps {
                script{
                    try {
                    sh "docker run --rm -v /var/jenkins_home/workspace/TestTaurus:/bzt-configs -v /var/jenkins_home/workspace/TestTaurus/reports:/tmp/artifacts blazemeter/taurus example.yml"
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
