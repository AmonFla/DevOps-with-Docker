FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/backend

COPY . ./code

RUN cd ./code && \
    go mod download && \
    go build . && \
    useradd -m appuser && \
    chown -R appuser:appuser /usr/backend/code && \
    mv ./server ../server && \
    cd .. && \
    rm -Rf ./code 

USER appuser

ENV REQUEST_ORIGIN="http://localhost:5000"

CMD ["./server"]