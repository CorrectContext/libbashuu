# SHELL=/bin/sh
.PHONY: test coverage-report

test: build/test.log coverage-report

coverage-report: build/coverage-report/index.html

build/test.log: libbashuu ./tests/run-tests.bash $(shell find tests -type f)
	@export PATH=$(PATH):. && \
		nix-shell -p bash --command "./tests/run-tests.bash | tee build/test.log.progress"
	@mv build/test.log.progress build/test.log

# yes, we run tests twice. kcov keeps going and doesn't exit on errors, it can be confusing for CI or what to not have proper exit code
build/coverage-report/index.html: libbashuu build/nix-installed $(shell find tests -type f) ./tests/run-tests.bash
	@export PATH=$(PATH):. && \
		nix-shell -p kcov bash --command "kcov --bash-handle-sh-invocation --bash-method=PS4 $(@D) ./tests/run-tests.bash"
