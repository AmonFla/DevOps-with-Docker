FROM node:16

EXPOSE 5000

WORKDIR /usr/frontend

RUN npm install -g serve

COPY ./package* ./

RUN npm ci

COPY . .

RUN useradd -m appuser

RUN chown -R appuser:appuser /usr/frontend

USER appuser

RUN npm run build

CMD ["serve","-s","-l","5000","build"]