# Build container
FROM golang:alpine as builder 
RUN apk update && \
        apk add git && \
        CGO_ENABLED=0 go install github.com/adriaandejonge/helloworld@latest

# Production container
FROM scratch
COPY --from=builder /go/bin/helloworld /helloworld 
EXPOSE 8080
CMD ["/helloworld"]