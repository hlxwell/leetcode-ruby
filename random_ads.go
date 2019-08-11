package main

import (
	"fmt"
	"math/rand"
	"time"
)

type Ads struct {
	data []int
	size int
}

func (ads *Ads) PopRandomAd() (int, bool) {
	if ads.size <= 0 {
		return 0, false
	}

	x := rand.Intn(ads.size)
	result := ads.data[x]
	ads.data[x] = ads.data[ads.size-1]
	ads.data[ads.size-1] = result
	ads.size--
	return result, true
}

func (ads *Ads) SetData(data []int) {
	ads.data = data
	ads.size = len(data)
}

func main() {
	rand.Seed(time.Now().UnixNano())

	ads := Ads{}
	ads.SetData([]int{7, 6, 2, 3, 1, 9, 4})
	for i := 0; i < 8; i++ {
		if result, ok := ads.PopRandomAd(); ok {
			fmt.Println(result)
		}
	}
}
