pipeline {
    agent { label 'master' }
    stages {
        stage('1-Checkout'){
            steps {
                git branch: 'main',
                    credentialsId: 'ssh_seruff',
                    url: 'git@github.com:seruff84/10-sf-pr.git'
                sh "ls -lat"
            }
        }
        stage('2-decrypt-secret'){
            steps{
                ansibleVault(action: 'decrypt', input: 'hash', vaultCredentialsId: 'ansible_vault')
                ansibleVault(action: 'decrypt', input: 'ansible/files/jenkins-slave.service', vaultCredentialsId: 'ansible_vault')
            }
        }
        stage('3-build-vms'){
            steps{
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'ssh_seruff',
                    keyFileVariable: 'SSH_KEY')])
                {
                    sh 'cp "$SSH_KEY" ~/.ssh/id_rsa'
                    sh 'chmod 600 ~/.ssh/id_rsa'
                    sh "terraform init"
                    sh "terraform plan -var-file=hash"
                    sh "terraform apply -auto-approve -var-file=hash"
                }
            }
        }
        stage('4-Prepare-vm1'){
            steps {
                ansiblePlaybook(
                    playbook: 'ansible/configure_vm1.yml',
                    inventory:'ansible/inventory',
                    credentialsId: 'ssh_seruff',
            		hostKeyChecking: false,
                )
            }
        }
        stage('5-stash-file') {
            steps {
                sh "ls -la ansible"
                stash name: "first-stash", includes: "ansible/**/*"
            }
        }
        stage('6-unstash-file') {
            steps {
                node('yandex') {
                    dir(".") {
                        unstash "first-stash"
                    }
                }
            }
        }
        stage('7-configure-vms'){
            steps {
                node('yandex') {
                    ansiblePlaybook(
                        playbook: 'ansible/playbook10.yml',
                        inventory:'ansible/inventory',
                        credentialsId: 'ssh_seruff',
                		hostKeyChecking: false,
                    )
                }
            }
        }
    }
}