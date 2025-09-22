.DEFAULT_GOAL := help

install: stow-check
	./link up
.PHONY: install

docker:
	docker build $(ARGS) --progress=plain --tag dotfiles .
	docker run --interactive --tty --name dotfiles-sandbox dotfiles
.PHONY: docker

docker--no-cache:
	$(MAKE) docker ARGS="--no-cache"
.PHONY: docker--no-cache

stow-check:
	@if [ -z "`command -v stow`" ]; then \
		echo "Error: GNU Stow is not installed."; \
		exit 1; \
	fi
.PHONY: stow-check

help:
	@echo "Usage:"
	@echo "    make docker     Test configurations in a Docker container."
	@echo "    make install    Stow configurations for all installed programs."
	@echo "    make help       Show this help."
	@echo
	@echo "    ./link --help   Show more advance usage."
.PHONY: help
