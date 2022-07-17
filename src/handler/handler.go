package handler

import (
	"go-template/src/server/container"
)

type Handler struct {
}

func InitializeHandler(container *container.DefaultContainer) *Handler {
	return &Handler{}
}
