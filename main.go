package main

import (
	"loki/src/server"
	"loki/src/server/container"
)

func main() {
	server.StartHttpServer(container.IntializeContainer())
}
