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

RUN apk add --no-cache nginx

# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
