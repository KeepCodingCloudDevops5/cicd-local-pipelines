all: build unit-test coverage package

build:
	@echo BUILD STEP
	cd python-aplicacion-ejemplo && pip install -r requirements.txt

unit-test:
	@echo TEST STEP
	cd python-aplicacion-ejemplo/src/tests && \
		coverage run -m pytest -s -v

coverage:
	@echo COVERAGE STEP
	cd python-aplicacion-ejemplo/src/tests && coverage report -m --fail-under=90

package:
	@echo PACKAGE STEP
	cd python-aplicacion-ejemplo && python3 -m build