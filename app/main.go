package main

import (
	"encoding/json"
	"log"
	"net/http"
	"strings"
	"time"
)

type Response struct {
	Timestamp string `json:"timestamp"`
	IP        string `json:"ip"`
}

func getclientIP(req *http.Request) string {

	//Trying to get IP from X-forwarded-for header
	xfh := req.Header.Get("X-Forwarded-For")

	if xfh != "" {
		partsofxfh := strings.Split(xfh, ",")
		return strings.TrimSpace(partsofxfh[0])
	}

	// Check X-Real-IP header
	if xrip := req.Header.Get("X-Real-IP"); xrip != "" {
		return xrip
	}

	//trying to get IP from Remote Address
	ip := req.RemoteAddr
	if colon := strings.LastIndex(ip, ":"); colon != 1 {
		ip = ip[:colon]
	}
	return ip
}

func handler(w http.ResponseWriter, r *http.Request) {
	ip := getclientIP(r)
	timestamp := time.Now().Format(time.RFC3339)

	// Log the request
	log.Printf("Received request - IP: %s, Timestamp: %s\n", ip, timestamp)

	resp := Response{
		Timestamp: timestamp,
		IP:        ip,
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}

func main() {
	// Initialize logger with timestamp
	log.SetFlags(log.LstdFlags)

	http.HandleFunc("/", handler)

	port := ":8080"
	log.Printf("SimpleTimeService running on http://localhost%s\n", port)
	err := http.ListenAndServe(port, nil)
	if err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}
