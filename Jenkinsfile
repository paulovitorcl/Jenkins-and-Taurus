node {
   stage('Build') {
      // Run the Taurus build
   }
   stage('Performance Tests') {
    parallel(
        BlazeMeterTest: {
            dir ('/var/jenkins_home/scripts') {
               sh 'sudo su - root; bzt quick_test.yml'
            }
        },
        Analysis: {
            sleep 60
        })
   }

   stage('Deploy') {
   }
}