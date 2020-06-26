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
        stage('Generate Import Commands') {
            when {
                branch 'master'
            }
            steps {
                sh '''#!/bin/bash
                cd prod
                terraform refresh | while read -r line; do
                    echo "terraform import $line" | \
                          sed 's/\\"/\\\"/g' | \
                          sed 's/: Refreshing state... \\[id=/ /g' | \
                          sed 's/\\(.*\\)]/\\1/'
                done
                '''
            }
        }
    }
}
