pipeline {
     agent any
     triggers {
          pollSCM('* * * * *')
     }
     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
          stage("Test") {
               steps {
                    sh "./gradlew test"
               }
          }
          stage("Code Coverage") {
               steps {
                    sh "./gradlew jacocoTestReport"
                    publishHTML (target: [
                         reportDir: 'build/reports/jacoco/test/html',
                         reportFiles: 'index.html',
                         reportName: 'JaCoCo Report',
                    ])
                    sh "./gradlew jacocoTestCoverageVerification"
               }
          }
     }
}