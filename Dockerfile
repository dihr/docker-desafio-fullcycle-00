# build stage
FROM golang as builder

WORKDIR /usr/src/app

COPY . .

RUN go build main.go

# final stage
FROM scratch

WORKDIR /

COPY --from=builder /usr/src/app/main /main

ENTRYPOINT ["/main"]