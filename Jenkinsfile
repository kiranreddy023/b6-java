pipeline{
    parameters {
 	 choice choices: ['slaveSSH', 'slavePASSWD', 'slaveWEB'], description: 'Choose the Slave Machine', name: 'Slave'
    }
    agent {
        label "${params.Slave}"
    }
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
    }
    post{
        always{
                archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
                junit 'target/**/*.xml'
        }
    }
}
