PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man/man1

BIN_INSTALL = $(DESTDIR)$(PREFIX)/bin
MAN_INSTALL = $(DESTDIR)$(MANPREFIX)

build:
	@mkdir -p build/bin
	@mkdir -p build/man
	@cp src/git-task build/bin
	@help2man -s 1 \
		-n git-task \
		./build/bin/git-task \
		| gzip -c > build/man/git-task.1.gz

install:
	@mkdir -p $(BIN_INSTALL)
	@echo "... installing executable to $(BIN_INSTALL)"
	@install -m 755 build/bin/git-task $(BIN_INSTALL)/git-task
	@mkdir -p $(MAN_INSTALL)
	@echo "... installing man page to $(MAN_INSTALL)"
	@install -m 644 build/man/git-task.1.gz $(MAN_INSTALL)/git-task.1.gz

uninstall:
	rm $(BIN_INSTALL)/git-task
	rm $(MAN_INSTALL)/git-task.1.gz

clean:
	rm -r build
