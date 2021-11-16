FROM node:12.8-alpine AS builder
LABEL Component="nodejs" \
      Name="nodejs" \
      version="1.2" \
      release="1" \
      author="JanoPL"

ARG APP_CODE_PATH_CONTAINER="/var/www/html"
ARG APP_CODE_PATH_HOST_FRONTEND="./../../../silver-frontend"

WORKDIR ${APP_CODE_PATH_CONTAINER}

RUN npm install -g @angular/cli

EXPOSE 4200

RUN chown -R node:node ${APP_CODE_PATH_CONTAINER}
RUN chmod 755 ${APP_CODE_PATH_CONTAINER}

CMD ng build
ENTRYPOINT ng serve --host 0.0.0.0 --port 4200