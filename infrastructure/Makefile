SHELL := /bin/bash

init:
	# Check for environment variable
	@if [[ -z "${ENV}" ]]; then \
		echo "Failed to set environment. Exiting"; \
		exit 10; \
	fi

	# Run terraform init command
	@pushd ./environments/"${ENV}" && \
	terraform init && \
	popd

plan: init
	@pushd ./environments/"${ENV}" && \
	terraform plan -refresh=true && \
	popd
	
apply: init
	@pushd ./environments/"${ENV}" && \
	terraform apply -refresh=true && \
	popd

destroy:
	 @pushd ./environments/"${ENV}" && \
	 terraform destroy
	 popd
	
.PHONY: init apply
