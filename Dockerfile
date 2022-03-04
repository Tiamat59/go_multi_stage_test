FROM golang:alpine
WORKDIR /usr/src/app
# CGO_ENABLED enabled the static compiling
# ENV CGO_ENABLED=0
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . ./
RUN go build -o app
FROM alpine 
COPY --from=0 /usr/src/app ./
CMD [ "./app" ]
