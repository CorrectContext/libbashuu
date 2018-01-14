libbashuu
=========

Library for building CLIs (command line interfaces) in bash.

Idea
----

- easy to use API (as Linux user)
- easy to install/deploy
- easy to integrate with existing tooling

Getting started
---------------

Copy one of the examples from "tests" directroy and modify to you needs.

Features
--------

- Easy API (just a file with bunch of bash functions, pseudo-declarative)
- Easy to install/deploy (one core file, no building steps)
- Easy to integrate with existing tooling (bash – installed on allmost all Linux system, good enough to work with linux processes, easy enough scripting)
- Automatic help/usage generation (``uu::app::produce-help``, ``uu::command::produce-help``)
- Short options (``cmd -s option``)
- Long options (``cmd --long option``)
- Environment variables options (``LONG=option cmd`` == ``cmd --long option``)
- Sub-commands (``git commit --message "init"``)
- Logging debug messages (``uu::debug "show debug message"`` only when ``DEBUG=1 cmd``, ``UUDEBUG=1 cmd`` for internal libbashuu debugging)
- Logging errors (``uu::error "show error message"``)
- Positional arguments (``cmd one two three``)
- Default option values
- Required or optional options
- Input validation (``uu::option::validate OPTION value function1,function2,internal-functin`` + bunch of builtin functions)
- On error/exit kills all sub-processes (``trap``)

The `why` section
-----------------

Why?

  Just wanted an easy way to wrap bunch of CLI commands and have it configurable via --arguments or ENVIRONMENT_VARIABLES.

Why bash and not X

  I have made implementations in python and haskell previously, but that's not easy enough to write just tiny wrappers around your favourite commands. Sometimes you just need to group some commands with configurable options and don't need another language, compiler and bunch of tools. In a lot of times you just need to wrap something quickly, in a dirty way, so better make dirty way as easy, convinient and hackable as possible.
