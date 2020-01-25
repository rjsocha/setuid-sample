all:	showuid.static showuid.glibc showuid.alpine docker-image setup
showuid.static: showuid.c
	gcc -o showuid.static -s -static showuid.c

showuid.glibc: showuid.c
	gcc -o showuid.glibc -s showuid.c

showuid.alpine: showuid.c
	docker run -v `pwd`:/src -w /src --rm  -it alpine sh -c "apk add --update gcc musl-dev && gcc -o showuid.alpine -s showuid.c"

docker-image:
	docker build -t sample .

setup:
	sudo sh -c "chown root:root showuid.static showuid.glibc showuid.alpine && chmod u+s showuid.static showuid.glibc showuid.alpine"

clean:
	rm -f showuid.glibc showuid.static showuid.alpine
