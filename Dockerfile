FROM golang:alpine as builder

#get git
RUN apk update && \
apk upgrade && \
apk add --no-cache git && \
apk add --no-cache tzdata

#add user for golang and maintainer
#RUN addgroup -S golang && adduser -S golang -G golang
#USER golang:golang
MAINTAINER titipaja.id

#working directory
ADD . /opt/loki
WORKDIR /opt/loki

#copy resource
COPY . .

#building
#RUN go mod tidy
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o loki-server
#RUN chmod a+x tokyo-server-final

FROM scratch

COPY --from=builder /opt/loki/resources /opt/loki/resources
COPY --from=builder /opt/loki/loki-server /opt/loki/loki-server

WORKDIR /opt/loki

#expose network
EXPOSE 9080

#running
CMD [ "/opt/loki/loki-server" ]