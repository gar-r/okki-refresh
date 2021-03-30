build:
	go build -o okki-refresh

clean:
	rm -f okki-refresh

install: build
	mv okki-refresh /usr/local/bin

