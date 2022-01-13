ARG NODE_VERSION=lts
FROM node:${NODE_VERSION}
ARG ANGULAR_VERSION=8.3.26

RUN echo "Node version" && node -v \
    && echo "NPM version" && npm -v \
    && npm install -g "@angular/cli@$ANGULAR_VERSION" \
	&& npm cache clear --force

WORKDIR /usr/src

USER 1000:1000
