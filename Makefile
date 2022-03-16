all: clean build unit-test coverage package publish dockerize push integration-test

clean:
	@echo CLEAN STEP
	find example-app -type d -name '*cache*' -exec rm -rf {} +
	find example-app -type f -name '*pyc' -delete
	cd example-app && rm -rf src/tests/.coverage src/app_example_kc.egg-info dist
	python3 -m pip uninstall -r example-app/requirements.txt -y
	docker rmi martaarcones/example-image --force 2> /dev/null

build:
	@echo BUILD STEP
	cd example-app && pip install -r requirements.txt

unit-test:
	@echo TEST STEP
	cd example-app/src/tests && \
		coverage run -m pytest -s -v

coverage:
	@echo COVERAGE STEP
	cd example-app/src/tests && coverage report -m --fail-under=90

package:
	@echo PACKAGE STEP
	cd example-app && python3 -m build

publish:
	@echo PUBLISH STEP
	cd example-app && python3 -m twine upload dist/* --config-file ~/.pypirc --skip-existing

dockerize:
	@echo DOCKERIZE STEP
	cd docker && docker build -f Dockerfile -t martaarcones/example-image:latest .

push:
	@echo PUSH STEP
	docker push martaarcones/example-image:latest

integration-test:
	@echo INTEGRATION-TEST STEP
	docker run martaarcones/example-image:latest