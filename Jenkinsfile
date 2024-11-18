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
           git branch: 'main', url: 'https://github.com/nocturnaldevops/netflix.git'     
           slackSend channel: 'q1project1', message: ':::Netflix:::: source code checked out successfully'
            }
        }
     stage("compile")
        {
            steps
            {
                sh 'mvn compile'
                           slackSend channel: 'q1project1', message: ':::Netflix::::Compilation Successful'

            }
        }
        
     stage("test")
        {
            steps
            {
                sh 'mvn test'
                           slackSend channel: 'q1project1', message: ':::Netflix::::Test cases executed successfully'

            }
        }
    }
    post{
        failure
        {
                       slackSend channel: 'q1project1', message: ':::Netflix::::PROJECT:::::::FAILED:::::::::'
        }
    }
}
