//go:build wireinject
// +build wireinject

package wire

import (
	"rcc-stake-mall-backed/internal/handler"
	"rcc-stake-mall-backed/internal/job"
	"rcc-stake-mall-backed/internal/repository"
	"rcc-stake-mall-backed/internal/server"
	"rcc-stake-mall-backed/internal/service"
	"rcc-stake-mall-backed/pkg/app"
	"rcc-stake-mall-backed/pkg/jwt"
	"rcc-stake-mall-backed/pkg/log"
	"rcc-stake-mall-backed/pkg/server/http"
	"rcc-stake-mall-backed/pkg/sid"

	"github.com/google/wire"
	"github.com/spf13/viper"
)

var repositorySet = wire.NewSet(
	repository.NewDB,
	//repository.NewRedis,
	repository.NewRepository,
	repository.NewTransaction,
	repository.NewUserRepository,
	repository.NewProductRepository,
	repository.NewProductSpuRepository,
	repository.NewProductSpuDetailRepository,
	repository.NewProductSpuAttrParamsRepository,
	repository.NewProductSkuRepository,
)

var serviceSet = wire.NewSet(
	service.NewService,
	service.NewUserService,
)

var handlerSet = wire.NewSet(
	handler.NewHandler,
	handler.NewUserHandler,
)

var jobSet = wire.NewSet(
	job.NewJob,
	job.NewUserJob,
)
var serverSet = wire.NewSet(
	server.NewHTTPServer,
	server.NewJobServer,
)

// build App
func newApp(
	httpServer *http.Server,
	jobServer *server.JobServer,
	// task *server.Task,
) *app.App {
	return app.NewApp(
		app.WithServer(httpServer, jobServer),
		app.WithName("demo-server"),
	)
}

func NewWire(*viper.Viper, *log.Logger) (*app.App, func(), error) {
	panic(wire.Build(
		repositorySet,
		serviceSet,
		handlerSet,
		jobSet,
		serverSet,
		sid.NewSid,
		jwt.NewJwt,
		newApp,
	))
}
