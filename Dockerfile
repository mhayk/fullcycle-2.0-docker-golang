###### Stage 1 ######
FROM golang:1.17-alpine AS builder

RUN mkdir -p /app
WORKDIR /app

COPY . .

ENV CGO_ENABLED=0

RUN GOOS=linux go build ./main.go

###### Stage 2 ######
FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["/app/main"]
