package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"time"
)

type Status struct {
	Status      string `json:"status"`
	Chain       string `json:"chain"`
	Timestamp   string `json:"timestamp"`
	BlockHeight int    `json:"block_height"`
}

func main() {
	chain := os.Getenv("CHAIN_NAME")
	if chain == "" {
		chain = "unknown"
	}

	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(Status{
			Status:      "ok",
			Chain:       chain,
			Timestamp:   time.Now().UTC().Format(time.RFC3339),
			BlockHeight: 100,
		})
	})

	fmt.Println("Node health API running on :8080")
	http.ListenAndServe(":8080", nil)
}
