pipeline {
    agent any
    parameters {
        choice(name: 'workspace', choices: ["dev", "prod"], description: 'Select Environment')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Infrastructure?')
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Pull Code') {
            steps {
                 script{
                            git "https://github.com/Ziad-Tawfik/Terraform-Playground.git"
                    }
                }
            }
        stage('Choose workspace & initialize') {
            steps {
                dir("Lab2") {
                    echo 'Choosing Workspace .....'
                    sh "terraform workspace list"
                    sh "terraform workspace select -or-create ${params.workspace}"
                    sh "terraform workspace list"
                    sh "terraform init"
                }
            }
        }
        stage('Plan & Apply or Destroy') {
            steps {
                dir("Lab2") {
                script {
                    if (params.destroy) {
                        sh "terraform destroy --var-file=${params.workspace}.tfvars -auto-approve"
                    }
                    else {
                        sh "terraform plan --var-file=${params.workspace}.tfvars"
                        sh "terraform apply --var-file=${params.workspace}.tfvars -auto-approve"
                    }
                }
                    
                }
                
            }
        }
    }
}