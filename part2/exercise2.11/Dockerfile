FROM node:16 

WORKDIR /usr/src/app 

RUN npm install -g nodemon ts-node

COPY ./package* ./
 
RUN npm ci 

COPY . .

CMD ["npm", "run", "docker:dev"]
