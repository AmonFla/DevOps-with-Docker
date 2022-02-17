FROM golang:1.16 as build

EXPOSE 8080

WORKDIR /usr/backend

COPY . .
ENV CGO_ENABLED=0 
ENV GOOS=linux 
RUN go mod download && \
    go build -a -installsuffix cgo -o server .     

FROM scratch

COPY --from=build /usr/backend/server .
ENV REQUEST_ORIGIN="http://localhost:80"

CMD ["/server"]