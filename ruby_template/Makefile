# Not really a "real" Makefile. This isn't for any sort of compilation step.
# It just makes it easy for me to run my code (I have a shortcut for "make" in
# my text editor.)
#
# Piping to tee >(tail -n1 | pbcopy) allows me to simultaneously
# - View the full output
# - Copy just the last line into my clipboard

.PHONY: run test copy-last example

SHELL=/bin/bash

run:
	clear
	@./s in

copy-last:
	./s in | tee >(tail -n1 | pbcopy)

test:
	../check-answers.py -p1 "./a.rb in"
	../check-answers.py -p2 "./b.rb in"

example:
	clear
	@./s ex
