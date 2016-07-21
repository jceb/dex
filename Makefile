NAME = dex
PREFIX = /usr/local
DOCPREFIX = $(PREFIX)/share/doc/$(NAME)
MANPREFIX = $(PREFIX)/man
VERSION = $(shell git tag | tail -n 1)
TAG = $(NAME)-$(VERSION)

build: dex.1

dex.1: man/dex.rst
	@echo building the manpage in man/
	@sphinx-build -b man -D version=$(TAG) -E man . $+

install: dex dex.1 README.rst LICENSE
	@echo installing executable file to $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@install -m 0755 $< $(DESTDIR)$(PREFIX)/bin/$(NAME)
	@echo installing docs to $(DESTDIR)$(DOCPREFIX)
	@mkdir -p $(DESTDIR)$(DOCPREFIX)
	@install -m 0644 -t $(DESTDIR)$(DOCPREFIX)/ README.rst LICENSE
	@echo installing manual page to $(DESTDIR)$(MANPREFIX)/man1
	@mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	@install -m 0644 dex.1 $(DESTDIR)$(MANPREFIX)/man1/$(NAME).1

tgz: source

source: dex dex.1 README.rst LICENSE Makefile CHANGELOG.md
	@echo "Creating source package: $(TAG).tar.gz"
	@mkdir $(TAG)
	@cp -t $(TAG) $+
	@tar czf $(TAG).tar.gz $(TAG)
	@rm -rf $(TAG)

clean:
	@rm -f $(TAG).tar.gz
	@rm -f dex.1

.PHONY: build install tgz source clean
