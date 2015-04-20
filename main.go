package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"

	"github.com/getwe/figlet4go"
)

var f float64

func rgb2ansi(r, g, b int) int {
	return 16 + 36*r + 6*g + b
}

func lolrgb(i int) (int, int, int) {
	return int(math.Sin(f*float64(i)+0)*2.5 + 2.5),
		int(math.Sin(f*float64(i)+2)*2.5 + 2.5),
		int(math.Sin(f*float64(i)+4)*2.5 + 2.5)
}

func init() {
	if lolf := os.Getenv("LOL_FREQUENCY"); lolf != "" {
		f, _ = strconv.ParseFloat(lolf, 64)
	}
	if f <= 0 {
		f = 0.1
	}
}

func main() {
	ascii := figlet4go.NewAsciiRender()
	renderStr, _ := ascii.Render(strings.Join(os.Args[1:], " "))

	scanner := bufio.NewScanner(strings.NewReader(renderStr))
	line := 0
	for scanner.Scan() {
		for i, ch := range scanner.Text() {
			fmt.Printf("\033[38;5;%dm%c", rgb2ansi(lolrgb(i+line)), ch)
		}
		fmt.Println()
		line++
	}
}
