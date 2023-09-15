pipeline{
        parameters{
            booleanParam(name:'AutoApprove', defaultValue: false, description:'Automatically run apply after generating plan?')
        }   

     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
      agent {
        label 'master'
    }

    stages{

            stage('checkout'){
                script{
                    dir("terraform")
                    {
                        git "https://github.com/TaKj1/Terraform-AWS"
                    }
                



            }

}           stage('Plan') {
                 steps {
                sh 'pwd;cd terraform/ ; terraform init'
                sh "pwd;cd terraform/ ; terraform plan -out tfplan"
                sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
}}