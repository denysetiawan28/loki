FROM golang:alpine as builder

#get git
RUN apk update && \
apk upgrade && \
apk add --no-cache git && \
apk add --no-cache tzdata

#add user for golang and maintainer
#RUN addgroup -S golang && adduser -S golang -G golang
#USER golang:golang
MAINTAINER organization-id

#working directory
ADD . /opt/go-template
WORKDIR /opt/go-template

#copy resource
COPY . .

#building
#RUN go mod tidy
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o go-template-server
#RUN chmod a+x tokyo-server-final

FROM scratch

COPY --from=builder /opt/go-template/resources /opt/go-template/resources
COPY --from=builder /opt/go-template/go-template-server /opt/go-template/go-template-server

WORKDIR /opt/go-template

#expose network
EXPOSE 9080

#running
CMD [ "/opt/go-template/go-template-server" ]