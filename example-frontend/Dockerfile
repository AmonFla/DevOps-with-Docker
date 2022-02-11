FROM node:16

EXPOSE 5000

WORKDIR /usr/src/app

RUN npm install -g serve

COPY ./package* ./

RUN npm ci

COPY . .

ENV REACT_APP_BACKEND_URL="http://localhost:8080"

RUN npm run build

CMD ["serve","-s","-l","5000","build"]