build:
	go build -o okki-refresh -buildvcs=false

clean:
	rm -f okki-refresh

install: build
	mv okki-refresh /usr/local/bin

