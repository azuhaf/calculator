pipeline {
     agent any
     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
          stage("Unit test") {
               steps {
                    sh "./gradlew test"
               }
          }
          stage("Package") {
               steps {
                    sh "./gradlew build --scan -s"
               }
          }

          stage("Docker build") {
               steps {
                    sh "chmod +x -R ${env.WORKSPACE}"
                    sh "docker build -f Dockerfile -t azuhav/calculator . "
               }
          }
          stage("Docker push") {
               steps {
                    sh "docker push azuhav/calculator"
               }
          }

          stage("Deploy to staging") {
               steps {
                    sh "docker run -d --rm -p 8765:8080 --name calculator azuhav/calculator"
               }
          }
          stage("Acceptance test") {
               steps {
                    sleep 60
                    sh "./gradlew acceptanceTest -Dcalculator.url=http://localhost:8765"
               }
          }
     }
     post {
          always {
               sh "docker stop calculator"
          }
     }
}