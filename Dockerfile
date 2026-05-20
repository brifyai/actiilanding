FROM nginx:1.27-alpine

ENV PORT=80

COPY . /usr/share/nginx/html/
COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80
