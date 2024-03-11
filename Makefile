.PHONY: help plan-master apply-master

help:
	@echo "Available options:"
	@echo "  make plan-master    - Run Terraform plan for master account"
	@echo "  make apply-master   - Apply Terraform changes for master account"
	@echo "  make security-master   - Run trivy tool to analyze aws account"

plan-master:
	@echo "Running Terraform plan and locking the changes"
	@echo ""
	@echo ""
	@echo "Lock file - tfplan.lock"
	@echo "Visual file - tfplan.json"
	@echo ""
	@echo ""
	cd ./iac/terraform/account-master && \
	terraform init && \
	terraform plan -lock=true -out=tfplan.lock && \
	terraform show -json tfplan.lock > tfplan.json && \
	echo "Analyzing Terraform cost" && \
	infracost breakdown --path . --show-skipped | tee -a log_infracost.log && \
	echo "========================" >> log_infracost.log && \
	echo "Analyzing Terraform configurations for security issues" && \
	tfsec . --tfvars-file terraform.tfvars | tee -a log_security.log && \
	echo "========================" >> log_security.log


apply-master:
	@echo "Applying Terraform changes for master account"
	cd ./iac/terraform/account-master && \
	terraform apply tfplan.lock

security-master: 
	@echo "Running trivy in master aws account"
	cd ./iac/terraform/account-master && \
	trivy aws --update-cache | tee -a log_trivy.log && \
	echo "========================" >> log_trivy.log && \
	echo "" >> log_trivy.log