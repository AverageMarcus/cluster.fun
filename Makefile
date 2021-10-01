.DEFAULT_GOAL := default

.PHONY: test # Run all tests, linting and format checks
test: lint check-format run-tests

.PHONY: lint # Perform lint checks against code
lint:
	@echo "⚠️ 'lint' unimplemented"

.PHONY: check-format # Checks code formatting and returns a non-zero exit code if formatting errors found
check-format:
	@cd terraform && terraform fmt -check

.PHONY: format # Performs automatic format fixes on all code
format:
	@cd terraform && terraform fmt

.PHONY: run-tests # Runs all tests
run-tests:
	@cd terraform && terraform plan

.PHONY: fetch-deps # Fetch all project dependencies
fetch-deps:
	@cd terraform && terraform init

.PHONY: build # Build the project
build: lint check-format fetch-deps
	@echo "⚠️ 'build' unimplemented"

.PHONY: docker-build # Build the docker image
docker-build:
	@echo "⚠️ 'docker-build' unimplemented"

.PHONY: docker-publish # Push the docker image to the remote registry
docker-publish:
	@echo "⚠️ 'docker-publish' unimplemented"

.PHONY: run # Run the application
run:
	@echo "⚠️ 'run' unimplemented"

.PHONY: ci # Perform CI specific tasks to perform on a pull request
ci:
	@echo "⚠️ 'ci' unimplemented"

.PHONY: release # Release the latest version of the application
release:
	@cd terraform && terraform apply -auto-approve && \
		kubectx admin@clusterfun-scaleway && \
		cd ../tekton && \
		kubectl apply -f ./1-Install/ && \
		kubectl apply -f ./2-Setup/ && \
		kubectl apply -f ./bindings/ && \
		kubectl apply -f ./conditions/ && \
		kubectl apply -f ./eventlisteners/ && \
		kubectl apply -f ./pipelines/ && \
		kubectl apply -f ./tasks/ && \
		kubectl apply -f ./triggertemplates/ && \
		cd ../manifests && \
		kubectl apply -f ./

.PHONY: help # Show this list of commands
help:
	@echo "cluster.fun"
	@echo "Usage: make [target]"
	@echo ""
	@echo "target	description" | expand -t20
	@echo "-----------------------------------"
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/' | expand -t20

default: test
