
build:
	mkdir -p build/bin
	mkdir -p build/man/man1
	cp git-task build/bin
	help2man -n git-task -s 1 ./git-task | gzip -c > build/man/man1/git-task.1.gz

install:
	install -m 644 build/man/man1/git-task.1.gz /usr/local/man/man1/git-task.1.gz
	install -m 644 build/bin/git-task /usr/local/bin/git-task

uninstall:
	rm /usr/local/man/man1/git-task.1.gz
	rm /usr/local/bin/git-task

clean:
	rm -r build
