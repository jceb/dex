NAME = dex
PREFIX = /usr/local
INSTALLDIR = $(PREFIX)/bin
DOCDIR = $(PREFIX)/share/doc/$(NAME)
TAG = dex-$(shell git tag | tail -n 1)

build:

install: dex README LICENSE
	mkdir -p $(DESTDIR)$(INSTALLDIR)
	install -m 0755 $< $(DESTDIR)$(INSTALLDIR)/

	mkdir -p $(DESTDIR)$(DOCDIR)
	install -m 0644 -t $(DESTDIR)$(DOCDIR)/ README LICENSE

tgz: source

source: dex README LICENSE Makefile
	mkdir $(TAG)
	cp -t $(TAG) $+
	tar czf $(TAG).tar.gz $(TAG)
	rm -rf $(TAG)
	@echo "Source package is ready: $(TAG).tar.gz"

clean:
	@rm $(TAG).tar.gz

.PHONY: build install tgz source
