package utils

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"encoding/hex"
	"errors"
	"io"
)

// 加密私钥 AES加密算法，使用passphrase作为密钥，推荐passphrase的长度为16字节、24字节、32字节、64字节、128字节、256字节
func EncryptPrivateKey(privateKey, passphrase string) (string, error) {
	key := []byte(passphrase)
	plaintext := []byte(privateKey)

	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}

	ciphertext := make([]byte, aes.BlockSize+len(plaintext))
	iv := ciphertext[:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		return "", err
	}

	stream := cipher.NewCFBEncrypter(block, iv)
	stream.XORKeyStream(ciphertext[aes.BlockSize:], plaintext)

	return hex.EncodeToString(ciphertext), nil
}

// 解密私钥 AES解密算法，使用passphrase作为密钥
func DecryptPrivateKey(encryptedKey, passphrase string) (string, error) {
	key := []byte(passphrase)
	ciphertext, err := hex.DecodeString(encryptedKey)
	if err != nil {
		return "", err
	}

	if len(ciphertext) < aes.BlockSize {
		return "", errors.New("ciphertext too short")
	}

	block, err := aes.NewCipher(key)
	if err != nil {
		return "", err
	}

	iv := ciphertext[:aes.BlockSize]
	ciphertext = ciphertext[aes.BlockSize:]

	stream := cipher.NewCFBDecrypter(block, iv)
	stream.XORKeyStream(ciphertext, ciphertext)

	return string(ciphertext), nil
}
