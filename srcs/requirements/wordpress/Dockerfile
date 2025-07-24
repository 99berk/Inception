FROM debian:bullseye

RUN apt-get update && \
    apt-get install php-fpm -y \
    php-mysqli \
    curl

COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]

CMD ["php-fpm7.4", "-F"]