VERSION 0.7

lint:
	ARG EMACS_VERSION=26
	FROM silex/emacs:${EMACS_VERSION}-alpine-ci-eldev
	WORKDIR /earthly-mode
	COPY . /earthly-mode/
	RUN ~/.local/bin/eldev lint
