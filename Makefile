PYTHON_VERSION := 3.8.5
PROJECT_NAME := painel
VENV_NAME := $(PROJECT_NAME)-$(PYTHON_VERSION)
DATABASE_PASS := postgres


create-venv: .create-venv setup

.create-venv: 
	pyenv install -s $(PYTHON_VERSION)
	pyenv uninstall -f $(VENV_NAME)
	pyenv virtualenv $(PYTHON_VERSION) $(VENV_NAME)
	pyenv local $(VENV_NAME)


.pip:
	pip install pip --upgrade

setup: .pip
	pip install -U setuptools
	pip install -r requirements.txt