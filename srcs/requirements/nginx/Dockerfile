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

# Generate self-signed SSL certificate for HTTPS
# -x509: Create self-signed certificate
# -nodes: No password encryption
# -days 365: Valid one year
# -newkey rsa:2048: Generate 2048-bit key
# -keyout: Save private key
# -out: Save public certificate
# -subj: Set domain name
RUN openssl req \
	-x509 \
	-nodes \
	-days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/CN=rreimann.42.fr"

COPY ./conf/nginx.conf /etc/nginx/http.d/my_site.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
