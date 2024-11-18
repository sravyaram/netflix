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
        /*
stage('Trivy-Scan') {
            steps {
                script {
                    // Run Trivy scan and save the results to a file
                    sh 'trivy fs --format json --output trivy_scan_report.json .'
                    
                }
            }
        }
        
      stage('sqanalysis')
        {
            steps
            {
                withSonarQubeEnv('sonarserver'){
                sh ' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=projectNetflix -Dsonar.projectKey=projectNetflix -Dsonar.java.binaries=. '
                slackSend channel: 'q1project1', message: 'code scan over - report of the scan is available at : http://13.50.206.33:9000/dashboard?id=projectNetflix'
            }
        }
    }
stage('Quality Gate') {
            steps {
                script {
                    // Wait for the SonarQube analysis to finish
                    def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                        error "Quality Gate failed: ${qg.status}"
                        slackSend channel: 'q1project1', message: 'qg failed'
                    }
                    slackSend channel: 'q1project1', message: 'qg successful'
                }
            }
      }   
stage("deploy")
        {
            steps
        {
        withMaven(globalMavenSettingsConfig: 'jenkins-nexus',  maven: 'maven3', mavenSettingsConfig: '', traceability: true)
            {
                sh 'mvn deploy'
            }
        }
    }
    */
         stage("createdockerimage")
    {
        steps
        {
            sh 'docker build -t nareshtechnologies/netflixv1 .'
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
