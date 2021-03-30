build:
	cd okki-refresh; \
		go build -o okki-refresh

clean:
	rm -f okki-refresh/okki-refresh

install: build
	mv okki-refresh/okki-refresh /usr/local/bin

