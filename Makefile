SHELL := /bin/bash

set-up:
	echo "==========Setup start=========="
	echo "==========Create venv_test=========="
	# create test environment
	virtualenv venv_test
	echo "==========Activate venv_test=========="
	source venv_test/bin/activate;\
	pip install nose coverage robotframework;\
	deactivate
	echo "==========Install of nose coverage complete=========="
	# create runtime environment
	virtualenv venv
	echo "==========Setup complete=========="

unit-test:
	source venv_test/bin/activate;\
	nosetests --cover-xml --with-coverage -v test/unit/test*;\
	deactivate


robot-test:
	source venv_test/bin/activate;\
	robot test/robot/test*;\
	deactivate
