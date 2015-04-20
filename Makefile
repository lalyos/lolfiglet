NAME=lolfiglet
ARCH=$(shell uname -m)
VERSION=$(shell cat VERSION)

build:
	mkdir -p build/Linux  && GOOS=linux  go build -o build/Linux/$(NAME)
	mkdir -p build/Darwin && GOOS=darwin go build -o build/Darwin/$(NAME)

build-linux:
	mkdir -p build && docker build -f Dockerfile.build -t $(NAME):bin .
	docker run --rm $(NAME):bin cat /go/bin/$(NAME) > build/$(NAME)-linux
	chmod +x build/$(NAME)-linux

deps:
	go get -u github.com/progrium/gh-release/...
	go get || true

release:
	rm -rf release && mkdir release
	cp build/$(NAME)-linux release
	tar -zcf release/$(NAME)_$(VERSION)_Linux_$(ARCH).tgz -C build/Linux $(NAME)
	tar -zcf release/$(NAME)_$(VERSION)_Darwin_$(ARCH).tgz -C build/Darwin $(NAME)
	gh-release checksums sha256
	gh-release create lalyos/$(NAME) $(VERSION)

clean:
	rm -rf build release

.PHONY: build build-linux release
