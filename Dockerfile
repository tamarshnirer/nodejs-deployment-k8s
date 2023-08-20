FROM node:18

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm config set fund false

RUN npm install --save express

RUN npm ci --omit=dev

COPY . /usr/src/app/

EXPOSE 3000

CMD [ "node", "app.js" ]
