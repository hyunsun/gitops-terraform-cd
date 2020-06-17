pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile.tf'
            args '-u root:root'
        }
    }
    environment {
        GOOGLE_BACKEND_CREDENTIALS = credentials('gcpCredential')
        TF_VAR_rancher_url = "https://rancher-test.aetherproject.org"
        TF_VAR_rancher_access_key = credentials('rancherAccessKey')
        TF_VAR_rancher_secret_key = credentials('rancherSecretKey')
    }
    stages {
        stage('Terraform Init and Validate') {
            steps {
                  sh '''
                  cd prod
                  terraform init
                  terraform validate
                  '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                cd prod
                terraform plan -out=/tmp/plan
                '''
            }
        }
        stage('Terraform Apply') {
            when {
                branch 'master'
            }
            steps {
                sh '''
                cd prod
                terraform apply /tmp/plan
                '''
            }
        }
    }
}
