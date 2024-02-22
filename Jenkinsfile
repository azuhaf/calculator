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
                    sh "./gradlew build"
               }
          }

          stage("Docker build") {
               steps {
                    sh "usermod -aG docker $USER"
                    sh "docker build -t azuhav/calculator ."
               }
          }
          stage("Docker push") {
               steps {
               sh "docker login --username=azuhav --password=TIstlgAGlpu546wl2e?5"
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
                    sleep 30
                    sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
               }
          }
     }
     post {
          always {
               sh "docker stop calculator"
          }
     }
}