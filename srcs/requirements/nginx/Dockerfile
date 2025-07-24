FROM debian:bullseye

RUN apt-get update && \
apt-get install -y nginx && \
apt-get install -y openssl

COPY ./default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]