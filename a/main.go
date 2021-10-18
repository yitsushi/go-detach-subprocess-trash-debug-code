// a/main.go
package main

import (
	"fmt"
	"os"
	"os/exec"
	"os/signal"
	"time"
)

func main() {

	signalCh := make(chan os.Signal, 1)
	signal.Notify(signalCh, os.Interrupt)

	go func() {
		<-signalCh

		os.Exit(0)
	}()

	//cmd := exec.Command("./bin/detach-test-b")
	cmd := exec.Command("firecracker", "--api-sock", "/tmp/firecracker.socket")

	if err := cmd.Start(); err != nil {
		fmt.Println(err)

		return
	}

	fmt.Println("It's running...")

	go func() {
		cmd.Process.Wait()
		cmd.Process.Release()
	}()

	time.Sleep(time.Minute)
}
