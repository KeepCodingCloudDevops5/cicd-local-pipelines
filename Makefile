CODE_PATH=example-app
DOCKER_IMAGE_NAME=$(DOCKER_USERNAME)/example-image

all: clean build unit-test coverage package publish dockerize push integration-test

clean:
	@echo CLEAN STEP
	find $(CODE_PATH) -type d -name '*cache*' -exec rm -rf {} +
	find $(CODE_PATH) -type f -name '*pyc' -delete
	cd $(CODE_PATH) && rm -rf src/tests/.coverage src/app_example_kc.egg-info dist
	python3 -m pip uninstall -r $(CODE_PATH)/requirements.txt -y
	docker rmi $(DOCKER_IMAGE_NAME) --force 2> /dev/null

build:
	@echo BUILD STEP
	cd $(CODE_PATH) && pip install -r requirements.txt

unit-test:
	@echo TEST STEP
	cd $(CODE_PATH)/src/tests && \
		coverage run -m pytest -s -v

coverage:
	@echo COVERAGE STEP
	cd $(CODE_PATH)/src/tests && coverage report -m --fail-under=90

package:
	@echo PACKAGE STEP
	cd $(CODE_PATH) && python3 -m build

publish:
	@echo PUBLISH STEP
	cd $(CODE_PATH) && python3 -m twine upload dist/* --config-file ~/.pypirc --skip-existing

get-dockerhub-username:
	@echo "What is your Dockerhub username?: "; \
    read DOCKER_USERNAME; \

dockerize: get-dockerhub-username
	@echo DOCKERIZE STEP
	cd docker && docker build -f Dockerfile -t $(DOCKER_IMAGE_NAME):latest .

push:
	@echo PUSH STEP
	docker push $(DOCKER_IMAGE_NAME):latest

integration-test:
	@echo INTEGRATION-TEST STEP
	docker run $(DOCKER_IMAGE_NAME):latest