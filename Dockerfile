FROM nginx:alpine

LABEL Description="Dockerized Nginx with a simple HTML page"

WORKDIR /usr/share/nginx/html

COPY ./index.html /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
