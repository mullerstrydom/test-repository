SHELL := /bin/bash

set-up:
	# create test environment
	virtualenv venv_test
	source venv_test/bin/activate;\
	pip install nose coverage robotframework;\
	deactivate
	# create runtime environment
	virtualenv venv

unit-test:
	source venv_test/bin/activate;\
	nosetests --cover-xml --with-coverage -v test/unit/test*;\
	deactivate


robot-test:
	source venv_test/bin/activate;\
	robot test/robot/test*;\
	deactivate
