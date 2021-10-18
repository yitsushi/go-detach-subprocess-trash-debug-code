# Makefile
.PHONY: all

all: build-a build-b


build-%:
	go build -o bin/detach-test-$* ./$*

