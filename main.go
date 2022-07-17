package main

import (
	"go-template/src/server"
	"go-template/src/server/container"
)

func main() {
	server.StartHttpServer(container.IntializeContainer())
}
