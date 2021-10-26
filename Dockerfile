FROM golang:1.17 AS build

WORKDIR /go

COPY *.go . 
RUN go build main.go

FROM scratch
WORKDIR /go
COPY --from=build /go/main .
ENTRYPOINT [ "./main" ]