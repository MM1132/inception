FROM alpine:3.22.2

# Where RUN, CMD, COPY, ADD, ENTRYPOINT instructions are executed from
WORKDIR /

# COPY is preferred over ADD
# RUN executes commands during image build stage. Can be used to install stuff
# CMD, defines the command that will get run when the image starts
# EXPOSE specify the port(s) that the image will be listening on (does not open the ports)
# ENV environment variables inside the image somehow
# ARG define build arguments that users can pass when building the image
# VOLUME define volumes, which folder mounts to which folder

RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/ssl/certs /etc/ssl/private

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=DE/ST=Berlin/L=Berlin/O=42School/OU=Student/CN=rreimann.42.fr"

COPY nginx.conf /etc/nginx/http.d/my_site.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
