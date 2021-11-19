apply:
	terraform apply -auto-approve -var-file=hash
destroy:
	terraform destroy -auto-approve -var-file=hash
encrypt:
	ansible-vault encrypt ansible/files/jenkins-slave.service  --vault-password-file vault_pass;
	ansible-vault encrypt hash --vault-password-file vault_pass
decrypt:
	ansible-vault decrypt ansible/files/jenkins-slave.service  --vault-password-file vault_pass;
	ansible-vault decrypt hash --vault-password-file vault_pass
