FROM node:16 as build


WORKDIR /usr/frontend

COPY . .

RUN npm ci && \
    npm run build 

FROM nginx:1.19-alpine

COPY --from=build /usr/frontend/build /usr/share/nginx/html
