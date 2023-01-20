help:
	@echo
	@echo "================================================"
	@echo
	@echo "test:       run unit tests + CLI coverage report"
	@echo
	@echo "cov:        HTML coverage report"
	@echo "todo:       view all todos"
	@echo "lint:       lint using flake8"
	@echo "fmt:        autoformat using black"
	@echo "hooks:      set Git hooks w/ pre-commit"
	@echo
	@echo
	@echo "================================================"
	@echo

# requires: python3 -m pip install pytest pytest-sugar
.PHONY: test
test:
	poetry run pytest tests/

###
# legacy
###

.PHONY: clean
clean:
	rm -rf dist/*

# requires: python3 -m pip install wheel
.PHONY: build
build: clean
	python3 setup.py sdist
	python3 setup.py bdist_wheel


# requires: python3 -m pip install twine
.PHONY: publish
publish: build
	twine upload dist/*

