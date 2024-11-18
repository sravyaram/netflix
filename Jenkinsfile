pipeline {
    agent any
    tools {
        maven 'maven3'
        dockerTool 'docker'
          }
        environment {
        SCANNER_HOME= tool 'sonarscanner'
        }
stages 
    {
    stage('checkoutsc') 
       {
        steps {
           git 'https://github.com/nocturnaldevops/netflix.git'            
           slackSend channel: 'q1project1', message: ':::Netflix:::: source code checked out successfully'
            }
        }
    }
}
