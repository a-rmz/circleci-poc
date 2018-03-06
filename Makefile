
BUILD = docker build

all: lint unit-test build

lint:
	$(BUILD) -t circleci-poc-lint --file=./devops/lint/Dockerfile ./devops/lint

unit-test:
	$(BUILD) -t circleci-poc-unit-test --file=./devops/unit-test/Dockerfile ./devops/unit-test

build:
	$(BUILD) -t circleci-poc-build --file=./devops/build/Dockerfile ./devops/build

run:
	docker run circleci-poc-lint
	docker run circleci-poc-unit-test
	docker run circleci-poc-build

clean:
	docker rmi circleci-poc-lint
	docker rmi circleci-poc-unit-test
	docker rmi circleci-poc-build
