FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/backend

COPY ./go* ./

RUN go mod download

COPY . .

RUN go build .

RUN useradd -m appuser

RUN chown -R appuser:appuser /usr/backend

USER appuser

ENV REQUEST_ORIGIN="http://localhost:5000"

CMD ["./server"]