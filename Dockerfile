FROM node:8.12.0-alpine

LABEL maintainer="https://suk.kr"

RUN apk add --no-cache \
    python \
    build-base \
    git

ENV NODE_ENV=development
ENV TARGET=http://oj-backend:8000

WORKDIR /OJ_FE
COPY . .

RUN npm install
RUN npm run build:dll
RUN npm run build

# CMD ["/bin/sh", "/OJ_FE/deploy/run.sh"]
CMD [ "node", "/OJ_FE/build/dev-server.js" ]