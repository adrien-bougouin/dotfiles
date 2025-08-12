.DEFAULT_GOAL := run

build:
	docker build --progress=plain --tag nvim-renewal .
.PHONY: build

run: build
	docker run --interactive --tty nvim-renewal
.PHONY: run
