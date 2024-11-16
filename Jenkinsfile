pipeline {
    agent any
    tools {
        maven 'maven3'
    }

    stages {
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/nocturnaldevops/Project1.git'
            }
        }
        
        stage('compile') {
            steps {
                sh 'mvn package'
            }
        }
        /*
        stage('test') {
            steps {
                         sh 'mvn test'
           
            }
        }
        stage('trivy_test') {
            steps {
                sh '''trivy fs --format table -o trivy-fs-report.html .'''
            }
        }
        stage('sqanalysis')
        {
            steps
            {
                withSonarQubeEnv('sonarqube'){
                sh ' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=project1 -Dsonar.projectKey=project1 -Dsonar.java.binaries=. '
            }
        }
    }
    stage("quality analysis")
    {
        steps
        {
            script{
                waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
            }
        }
    }
    stage("package")
    {
        steps
        {
            sh 'mvn package'
        }
    }
    stage("deploy")
    {
        steps{
        withMaven(globalMavenSettingsConfig: 'globalnexus', jdk: 'java17', maven: 'maven3', mavenSettingsConfig: '', traceability: true)
        {
    sh 'mvn deploy'
}
    }
}
*/
stage('Buildandtagdockerimage')
{
    steps
    {
        script{
            // This step should not normally be used in your script. Consult the inline help for details.
withDockerRegistry(credentialsId: 'dockercreds', toolName: 'docker') {
    sh "docker build -t nareshtechnologies/netflix:v1 ."
   
}
        }
    }
}

stage("push docker image")
{
    steps
    {
        script {
 // This step should not normally be used in your script. Consult the inline help for details.
withDockerRegistry(credentialsId: 'dockercreds', toolName: 'docker') {
    sh "docker push  nareshtechnologies/netflix:v1"
   
}          
        }
    }
}
        stage("deploytheapplicationtok8s")
        {
            steps
            {
 sh 'kubectl apply -f manifest1.yaml'                
}
}
    }
}
