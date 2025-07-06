# docker/node.Dockerfile
FROM node:20-alpine

WORKDIR /app

COPY vue/package.json ./

RUN npm install

COPY vue .

CMD ["npm", "run", "dev"]
