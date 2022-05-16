node {
   stage('Build') {
      // Run the Taurus build
   }
   stage('Performance Tests') {
    parallel(
        BlazeMeterTest: {
            dir ('C:\\Users\\paulo.l\\Taurus Resources') {
               bat 'bzt taurus_jmeter_script3.yml -report'
            }
        },
        Analysis: {
            sleep 60
        })
   }

   stage('Deploy') {
   }
}