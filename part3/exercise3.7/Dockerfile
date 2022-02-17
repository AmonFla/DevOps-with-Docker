 
FROM node:16 as build

WORKDIR /usr/src/app

RUN npm install webpack -g 

COPY . .
 
RUN npm ci && npm run build

FROM nginx:1.19-alpine

COPY --from=build /usr/src/app/dist /usr/share/nginx/html

