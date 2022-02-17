FROM node:16

EXPOSE 5000

WORKDIR /usr/frontend

COPY . .

RUN npm install -g serve && \
    npm ci && \
    useradd -m appuser && \
    chown -R appuser:appuser /usr/frontend && \
    npm run build && \
    rm -Rf node_modules

USER appuser 

CMD ["serve","-s","-l","5000","build"]