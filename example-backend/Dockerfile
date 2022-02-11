FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

COPY ./go* ./

RUN go mod download

COPY . .

RUN go build .

ENV REQUEST_ORIGIN="http://localhost:5000"

CMD ["./server"]