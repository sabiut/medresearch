FROM nginx:1.19.0-alpine
COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off; error_log /dev/stderr debug;", "-c", "/etc/nginx/nginx.conf"]

