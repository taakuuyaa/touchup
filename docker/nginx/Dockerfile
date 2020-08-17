FROM nginx:1.19.0

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD touchup.conf /etc/nginx/conf.d/touchup.conf

CMD nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
