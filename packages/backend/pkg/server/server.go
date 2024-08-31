package server

import (
	"github.com/gin-gonic/gin"
)

func Server() {
	server := gin.Default()

	server.GET("/health", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"message": "pong",
		})
	})

	server.Run()
}
