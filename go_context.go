package main

import (
	"context"
	"fmt"
	"time"
)

func main() {
	cakeQueue := make(chan string, 10)
	ctx, _ := context.WithTimeout(context.Background(), 3*time.Second)

	go makeCake(cakeQueue)
	go eatCake(cakeQueue)

	select {
	case <-time.After(2 * time.Second):
		fmt.Println("2 sec later...")
	case <-ctx.Done():
		fmt.Println(ctx.Err())
	}
}

func eatCake(c <-chan string) {
	for cake := range c {
		fmt.Println(cake)
	}
}

func makeCake(c chan<- string) {
	var totalCakes int = 20
	for i := 0; i < totalCakes; i++ {
		c <- fmt.Sprintf("cake %d", time.Now().Nanosecond())
		time.Sleep(100 * time.Millisecond)
	}
}
