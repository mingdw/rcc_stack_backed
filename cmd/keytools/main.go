package main

import (
	"bufio"
	"flag"
	"fmt"
	"os"
	"rcc-stake-mall-backed/internal/utils"
	"strings"

	"github.com/joho/godotenv"
)

func main() {
	// 加载环境变量
	godotenv.Load(".env.local")

	// 解析命令行参数
	encrypt := flag.Bool("encrypt", false, "Encrypt a private key")
	decrypt := flag.Bool("decrypt", false, "Decrypt an encrypted key")
	flag.Parse()

	// 获取密码
	passphrase := os.Getenv("ETH_KEY_PASSPHRASE")
	if passphrase == "" {
		fmt.Println("ETH_KEY_PASSPHRASE environment variable not set")
		return
	}

	if *encrypt {
		// 加密私钥
		fmt.Print("Enter private key: ")
		reader := bufio.NewReader(os.Stdin)
		privateKey, err := reader.ReadString('\n')
		if err != nil {
			fmt.Printf("Error reading input: %v\n", err)
			return
		}

		// 去除输入中的空白字符
		privateKey = strings.TrimSpace(privateKey)

		encryptedKey, err := utils.EncryptPrivateKey(privateKey, passphrase)
		if err != nil {
			fmt.Printf("Error encrypting: %v\n", err)
			return
		}

		fmt.Printf("Encrypted key: %s\n", encryptedKey)
	} else if *decrypt {
		// 解密私钥
		fmt.Print("Enter encrypted key: ")
		reader := bufio.NewReader(os.Stdin)
		encryptedKey, err := reader.ReadString('\n')
		if err != nil {
			fmt.Printf("Error reading input: %v\n", err)
			return
		}

		// 去除输入中的空白字符
		encryptedKey = strings.TrimSpace(encryptedKey)

		decryptedKey, err := utils.DecryptPrivateKey(encryptedKey, passphrase)
		if err != nil {
			fmt.Printf("Error decrypting: %v\n", err)
			return
		}

		fmt.Printf("Decrypted key: %s\n", decryptedKey)
	} else {
		fmt.Println("Please specify either -encrypt or -decrypt")
	}
}
