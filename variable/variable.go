package variable

import (
	"flag"
	"log"
	"os"
	"rcc-stake-mall-backed/pkg/config"
	"strings"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"
	"github.com/spf13/viper"
)

var (
	ApplicationUrl  string            //项目ip
	ApplicationPort int               //项目端口
	ApplicationName string            //项目名称
	EthUrl          string            //以太坊连接节点
	EthPrivateKey   string            //以太坊私钥
	EthChainId      string            //以太坊链id
	ENV             string            // 项目当前的环境
	BasePath        string            //项目根目录
	ClientSwitch    bool              //是否开启后端默认节点配置
	Config          *viper.Viper      //配置文件
	Ethclient       *ethclient.Client //以太坊连接节点
	RccTokenAddress common.Address    //rccToken地址
	RccStakeAddress common.Address    //rccStake地址
)

func init() {
	log.Println("**********初始化全局变量***************")
	if curPath, err := os.Getwd(); err == nil {
		// 路径进行处理，兼容单元测试程序程序启动时的奇怪路径
		if len(os.Args) > 1 && strings.HasPrefix(os.Args[1], "-test") {
			BasePath = strings.Replace(strings.Replace(curPath, `\test`, "", 1), `/test`, "", 1)
		} else {
			BasePath = curPath
		}
	} else {
		log.Println("初始化全局变量路径有误")
	}
	env := os.Getenv("ENV")
	if env == "" {
		env = "dev"
	}
	ENV = env
	configName := ""
	if env == "prod" {
		configName = "prod"
	} else {
		configName = "local"
	}

	var envConf = flag.String("conf", "config/"+configName+".yml", "config path, eg: -conf ./config/"+configName+".yml")
	flag.Parse()
	conf := config.NewConfig(*envConf)
	if conf != nil {
		ApplicationUrl = conf.GetString("http.url")
		ApplicationPort = conf.GetInt("http.port")

		EthUrl = conf.GetString("ethclient.rpc_url")
		EthPrivateKey = conf.GetString("ethclient.private_key")
		EthChainId = conf.GetString("ethclient.chain_id")
		RccTokenAddress = common.HexToAddress(conf.GetString("rccTokenAddress"))
		RccStakeAddress = common.HexToAddress(conf.GetString("rccStakeAddress"))
		Config = conf
	}
	log.Println("init results --- >   ApplicationUrl: ", ApplicationUrl, "; ApplicationPort: ", ApplicationPort, "; ApplicationName: ", ApplicationName, "; EthClientAddress: ", EthUrl, "; Env: ", ENV, "; BasePath: ", BasePath, "; ClientSwitch: ", ClientSwitch)
	log.Println("EthClientAddress: ", EthUrl)
	Ethclient, err := ethclient.Dial(EthUrl)
	if err != nil {
		log.Println("初始化ethclient失败", err)
	}
	log.Println("ethclient初始化成功：", Ethclient)
	log.Println("**********初始化全局变量结束***************")
}
