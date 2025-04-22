FROM alpine

RUN apk update

RUN apk add -i nginx openssl

RUN openssl req -x509 -newkey rsa:4096 \
	-keyout /etc/nginx/inception.key -out /etc/nginx/inception.crt -sha256 -days 3650 -nodes \
	-subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY index.html /usr/share/nginx/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]