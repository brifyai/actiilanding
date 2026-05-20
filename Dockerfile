FROM nginx:1.27-alpine

COPY . /usr/share/nginx/html/

RUN rm -f /etc/nginx/conf.d/default.conf \
    && printf 'server {\n    listen 80;\n    listen 4022;\n    server_name _;\n    root /usr/share/nginx/html;\n    index index.html;\n\n    location / {\n        try_files $uri $uri/ /index.html;\n    }\n}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 80 4022
