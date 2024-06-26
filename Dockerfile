FROM golang:alpine AS build

RUN go version \
    && go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

WORKDIR /go

RUN xcaddy build --with github.com/caddy-dns/alidns

# Get caddy alpine image to keep the container as small as possible
FROM caddy:alpine AS final

# Copy caddy executable from builder step
COPY --from=build /go/caddy /usr/bin/caddy
