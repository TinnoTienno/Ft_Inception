FROM alpine:3.20

RUN apk update

RUN apk add -i nginx openssl

RUN openssl req -x509 -newkey rsa:4096 \
	-keyout /etc/nginx/inception.key -out /etc/nginx/inception.crt -sha256 -days 3650 -nodes \
	-subj "/C=XX/ST=France/L=Paris/O=42/OU=Stud/CN=eschussl"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]