all: install build

install:
	wget -c -O wordpress.zip http://wordpress.org/latest.zip
	unzip -q -o wordpress.zip

build:
	docker build -t kirinhuang/wordpress ./

shell:
	docker run --name wordpres -i -t kirinhuang/wordpress /bin/bash
