FROM nginx:1.27-alpine

ARG PORT=80

COPY . /usr/share/nginx/html/

RUN rm -f /etc/nginx/conf.d/default.conf \
    && printf 'server {\n    listen %s;\n    server_name _;\n    root /usr/share/nginx/html;\n    index index.html;\n\n    location / {\n        try_files $uri $uri/ /index.html;\n    }\n}\n' "$PORT" > /etc/nginx/conf.d/default.conf

EXPOSE ${PORT}
