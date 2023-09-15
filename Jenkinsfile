pipeline {
    parameters {
        booleanParam(name:'AutoApprove', defaultValue: false, description:'Automatically run apply after generating plan?')
    }   

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent {
        label 'master'
    }

    stages {
        stage('checkout') {
            steps {
                dir("terraform") {
                    git "https://github.com/TaKj1/Terraform-AWS"
                }
            }
        }

        stage('Plan') {
            steps {
                dir("terraform") {
                    sh '''
                        terraform init
                        terraform plan -out=tfplan
                        terraform show -no-color tfplan > tfplan.txt
                    '''
                }
            }
        }

        stage('Apply') {
            when {
                expression { params.AutoApprove == true }
            }
            steps {
                dir("terraform") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
