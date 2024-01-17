FROM golang:1.20.5-alpine3.18 AS builder

WORKDIR /build
# Copy and download dependencies using go mod
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the code into the container
COPY . .

# Build the application
RUN cd cmd/livefuzzer && go build

FROM alpine:latest

COPY --from=builder /build/cmd/livefuzzer/livefuzzer /livefuzzer
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
