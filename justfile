alias i := install

install *args:
	./bin/dots install {{ args }}

apply *args:
	./bin/dots apply {{ args }}
