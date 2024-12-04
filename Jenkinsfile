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
           git branch: 'main', url: 'https://github.com/sravyaram/netflix.git'     
           slackSend channel: 'devopsproject1', message: ':::Netflix:::: source code checked out successfully'
            }
        }
     stage("compile")
        {
            steps
            {
                sh 'mvn compile'
                           slackSend channel: 'devopsproject1', message: ':::Netflix::::Compilation Successful'

            }
        }
        
     stage("test")
        {
            steps
            {
                sh 'mvn test'
                           slackSend channel: 'devopsproject1', message: ':::Netflix::::Test cases executed successfully'

            }
        }
        
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
                slackSend channel: 'devopsproject1', message: 'code scan over - report of the scan is available at : http://13.50.206.33:9000/dashboard?id=projectNetflix'
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
                        slackSend channel: 'devopsproject1', message: 'qg failed'
                    }
                    slackSend channel: 'devopsproject1', message: 'qg successful'
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
    
         stage("createdockerimage")
    {
        steps
        {
            sh 'docker build -t sravyaram/netflix .'
        }
    }
        stage("push docker image")
{
    steps
    {
        script {
 // This step should not normally be used in your script. Consult the inline help for details.
withDockerRegistry(credentialsId: 'dockercreds', toolName: 'docker') {
    sh "docker push  sravyaram/netflix"
   
}          
        }
    }
}
  /*
        stage("deploytok8s")
{
    steps
    {
        withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://6D07A459EB9FC793B0AE8713BBB2B6D8.yl4.eu-north-1.eks.amazonaws.com') {
    sh "kubectl apply -f manifest.yaml"
}
    }
}
        stage("checkforapplication")
        {
            steps
            {
                 withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://6D07A459EB9FC793B0AE8713BBB2B6D8.yl4.eu-north-1.eks.amazonaws.com') {
    sh "kubectl get pods --all-namespaces"
    sh "kubectl get service --all-namespaces"
    slackSend channel: 'q1project1', message: 'find the application on http://16.16.96.217:32000'
                 }
            }    
        }
    }
    */
    post{
        failure
        {
                       slackSend channel: 'devopsproject1', message: ':::Netflix::::PROJECT:::::::FAILED:::::::::'
        }
    }
}
}
