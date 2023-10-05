pipeline {
    agent any
    parameters {
        choice(name: 'workspace', choices: ["dev", "prod"], description: 'Select Environment')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy?')
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
         stage('authenticate with aws'){
            steps{
                script {
                sh 'echo [terraform] > credentials'
                sh 'echo aws_access_key_id=$AWS_ACCESS_KEY_ID >> credentials'
                sh 'echo aws_secret_access_key=$AWS_SECRET_ACCESS_KEY >> credentials'
               }
            }
        }
        stage('Pull Code') {
            steps {
                 script{
                        git "https://github.com/joeafify/terraform-lab2.git"
                    }
                }
            }
        stage('Choose workspace & initialize') {
            steps {
                script {
                    sh "terraform init"
                    sh "terraform workspace select -or-create ${params.workspace}"
                    sh "terraform init"
                }
            }
        }
        stage('Plan & Apply or Destroy') {
            steps {
                script {
                    if (params.destroy) {
                        sh "terraform destroy --var-file=${params.workspace}.tfvars -auto-approve"
                    }
                    else {
                        sh "terraform apply --var-file=${params.workspace}.tfvars -auto-approve"
                    }
                }
            }
        }
    }
}