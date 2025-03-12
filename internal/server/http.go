package server

import (
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/docs"
	"rcc-stake-backed/internal/handler"
	"rcc-stake-backed/internal/middleware"
	"rcc-stake-backed/pkg/jwt"
	"rcc-stake-backed/pkg/log"
	"rcc-stake-backed/pkg/server/http"

	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
	swaggerfiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

func NewHTTPServer(
	logger *log.Logger,
	conf *viper.Viper,
	jwt *jwt.JWT,
	userHandler *handler.UserHandler,
	categoryHandler *handler.CategoryHandler,
	productHandler *handler.ProductHandler,
	addressHandler *handler.AddressHandler,
	userAddressHandler *handler.UserAddressHandler,
) *http.Server {
	gin.SetMode(gin.DebugMode)
	s := http.NewServer(
		gin.Default(),
		logger,
		http.WithServerHost(conf.GetString("http.host")),
		http.WithServerPort(conf.GetInt("http.port")),
	)

	// swagger doc
	docs.SwaggerInfo.BasePath = "/v1"
	s.GET("/swagger/*any", ginSwagger.WrapHandler(
		swaggerfiles.Handler,
		//ginSwagger.URL(fmt.Sprintf("http://localhost:%d/swagger/doc.json", conf.GetInt("app.http.port"))),
		ginSwagger.DefaultModelsExpandDepth(-1),
		ginSwagger.PersistAuthorization(true),
	))

	s.Use(
		middleware.CORSMiddleware(),
		middleware.ResponseLogMiddleware(logger),
		middleware.RequestLogMiddleware(logger),
		//middleware.SignMiddleware(log),
	)
	s.GET("/", func(ctx *gin.Context) {
		logger.WithContext(ctx).Info("hello")
		v1.HandleSuccess(ctx, map[string]interface{}{
			":)": "Thank you for using nunu!",
		})
	})

	v1 := s.Group("/v1")
	{
		// No route group has permission
		noAuthRouter := v1.Group("/")
		{
			noAuthRouter.POST("/register", userHandler.Register)
			noAuthRouter.POST("/login", userHandler.Login)
			commonApi(noAuthRouter)
			mallApi(noAuthRouter, categoryHandler, productHandler, addressHandler, userAddressHandler)
		}
		// Non-strict permission routing group
		noStrictAuthRouter := v1.Group("/").Use(middleware.NoStrictAuth(jwt, logger))
		{
			noStrictAuthRouter.GET("/user", userHandler.GetProfile)
		}

		// Strict permission routing group
		strictAuthRouter := v1.Group("/").Use(middleware.StrictAuth(jwt, logger))
		{
			strictAuthRouter.PUT("/user", userHandler.UpdateProfile)

		}

	}

	return s
}

func commonApi(router *gin.RouterGroup) {
	router.GET("/ping", func(ctx *gin.Context) {
		v1.HandleSuccess(ctx, nil)
	})
}

func poolApi(router *gin.RouterGroup) {
	router.GET("/pool", func(ctx *gin.Context) {
		v1.HandleSuccess(ctx, nil)
	})
}

func mallApi(router *gin.RouterGroup, categoryHandler *handler.CategoryHandler, productHandler *handler.ProductHandler, addressHandler *handler.AddressHandler, userAddressHandler *handler.UserAddressHandler) {
	router.GET("/categories", categoryHandler.GetCategoryTree)
	router.POST("/products", productHandler.ListProducts)
	router.POST("/products/getProductDetails", productHandler.GetProductDetail)
	router.POST("/address", addressHandler.GetAllAddress)
	router.POST("/userAddress", userAddressHandler.GetUserAddress)
	router.POST("/userAddress/addAndUpdate", userAddressHandler.AddAndUpdateUserAddress)
	router.DELETE("/userAddress/delete/:id", userAddressHandler.DeleteUserAddress)
	router.GET("/userAddress", userAddressHandler.ListUserAddresses)
	router.POST("/userAddress/setDefault", userAddressHandler.SetDefaultAddress)
}
