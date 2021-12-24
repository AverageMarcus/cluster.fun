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
	@PLAN=$(cd terraform && terraform plan ./terraform) && curl -X "POST" "https://git.cluster.fun/api/v1/repos/AverageMarcus/${REPO}/issues/${PR_ID}/comments?access_token=${ACCESS_TOKEN}" \
		-H 'Content-Type: application/json; charset=utf-8' \
		-d $'{"body": "<details><summary>Terraform Plan:</summary>'"$PLAN"'</details>"}'

.PHONY: release # Release the latest version of the application
release:
	@cd terraform && terraform apply -auto-approve

.PHONY: help # Show this list of commands
help:
	@echo "${REPO_NAME}"
	@echo "Usage: make [target]"
	@echo ""
	@echo "target	description" | expand -t20
	@echo "-----------------------------------"
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/' | expand -t20

default: test
