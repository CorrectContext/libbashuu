SHELL=/bin/bash
.PHONY: test coverage-report

build/nix-installed:
	@command -v nix-env >/dev/null
	@mkdir -p $(@D)
	@touch "$@"

build/kcov-installed: build/nix-installed
	@mkdir -p $(@D)
	@rm -rf "$@"
	@ln -s "$$(nix-build '<nixpkgs>' -A kcov)/bin/kcov" "$@"

test: build/test.log coverage-report

coverage-report: build/coverage-report/index.html
build/test.log: libbashuu build/nix-installed ./tests/run-tests.bash $(shell find tests -type f)
	@export PATH=$(PATH):. && \
		./tests/run-tests.bash | tee build/test.log.progress
	@mv build/test.log.progress build/test.log

# yes, we run tests twice. kcov keeps going and doesn't exit on errors, it can be confusing for CI or what to not have proper exit code
build/coverage-report/index.html: libbashuu build/nix-installed $(shell find tests -type f) ./tests/run-tests.bash
	@export PATH=$(PATH):. && \
		kcov --bash-handle-sh-invocation --bash-method=PS4 $(@D) ./tests/run-tests.bash
