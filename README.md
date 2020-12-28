# dotfiles
These are my dotfiles. You can use anything you find here.

## Management
I do all my management using only git and make.
The structure is as follows : 
 - Base dir with a Makefile
 - Each dir has a makefile of its own

The root Makefile lists all dependencies, exposes the main targets and the `parse` target, used by the dependency-specific makefiles. Modifying this one should be enough when setting them up on a new system for example.

The level 2 makefiles are dependency-specific. They have to expose the `link-xxxxx` target, which is a dependency for the `dotfiles` one.
Some of them have a `build-xxxxx` target, required by the `link-xxxxx`. This one usually has the following syntax : 
```make
build-xxxxx: VAR_FILE = $(HOME)/.cache/wal/colors.sh # This file will be sourced to get variables
build-xxxxx: DIR = $(DOTFILES)/xxxxx # The base dir for this dependency
build-xxxxx: FILE = config # The path to the file from the base dir

bulid-xxxxx: parse
```
the `parse` target, defined in the main makefile, replaces all occurences of `%{{var}}` by the shell variable `var`. This variable can either be an environment variable or defined in the `VAR_FILE`. This is useful for color definitions for example.
