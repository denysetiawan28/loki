package router

import (
	"loki/src/handler"
	"net/http"
)

func InitializeRouter(server *echo.Echo, handler *handler.Handler) {
	server.GET("/health", func(c echo.Context) error {
		return c.JSON(http.StatusOK, "service up")
	})

	//	g := server.Group("/api")

}
