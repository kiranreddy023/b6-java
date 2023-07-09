pipeline{
   // parameters {
 	// choice choices: ['slaveSSH', 'slavePASSWD', 'slaveWEB'], description: 'Choose the Slave Machine', name: 'Slave'
    //}
    //agent {
      //  label "${params.Slave}"
   // }
   agent any
    tools{
        maven 'maven-3.6.3'
    }
    stages{
        stage('build'){
            steps{
                sh 'mvn clean install -DskipTests=true'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('deploy'){
            steps{
                sh 'java -jar target/*.jar'
            }
        }
        stage('docker build'){
            steps{
                sh 'docker build -t kiran023/java:v1 .'
            }
        }
        stage('docker run'){
            steps{
                sh 'docker run kiran023/java:v1'
            }
        }
    }
    post{
        success{
                archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
                junit 'target/**/*.xml'
                cleanWs()
        }
    }
}
