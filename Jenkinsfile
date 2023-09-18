pipeline {
    agent any

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
                    script {
                        withCredentials([aws(credentialsId: 'AWS-USer', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                            sh '''
                                terraform init
                                terraform plan -out=tfplan
                                terraform show -no-color tfplan > tfplan.txt
                            '''
                        }
                    }
                }
            }
        }

        // You can add more stages as needed, e.g., an 'Apply' stage.
    }

    post {
        always {
            // Optional: Archive the plan for review or other purposes
            archiveArtifacts artifacts: 'terraform/tfplan.txt', allowEmptyArchive: true
        }
    }
}
