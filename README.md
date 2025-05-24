# SimpleTimeService

SimpleTimeService is a Go-based HTTP server that returns pure JSON response of **client's IP address** and the **current timestamp** with the following structure, when its / URL path is accessed.

```
{
  "timestamp": "<current date and time>",
  "ip": "<the IP address of the visitor>"
}
```

---

## Features

- Returns JSON response with:
  - `timestamp` – Server time in RFC3339 format.
  - `ip` – Client’s IP address (support for `X-Forwarded-For`, `X-Real-IP`, and `RemoteAddr`).
- Minimal dependencies.
- Dockerized using multi-stage build for optimized image size.

---
## Implementation Approach

The application is designed to:
- Be simple and stateless.
- Use standard Go libraries (`net/http`, `time`, `log`).
- We are following UTC timezone by default in this application.
- Return IP address with support for proxy headers (`X-Forwarded-For`, `X-Real-IP`).
- Be containerized with a lightweight Docker image.

---

## Technology Stack

- **Language**: Go (Golang)
- **Version**: Go 1.18
- **HTTP Library**: Built-in `net/http`
- **JSON Encoding**: Built-in `encoding/json`
- **Time Formatting**: `time.RFC3339`
- **Logging**: Built-in `log`
- **Containerization**: Docker (multi-stage build)

---

## Quick Start

> Guidelines to run the application with Docker:

### Prerequisites

You need to have Docker installed on your machine.

- **Install Docker:** https://docs.docker.com/get-docker/

---

### Run the application using Docker
Image is available on my [DockerHub Account](https://hub.docker.com/u/ksahu5505), run the following:

```bash
docker pull ksahu5505/simpletimeservice
docker run -d -p 8080:8080 --name container_name ksahu5505/simpletimeservice
```
---
Once the application is running on the machine, it can be tested by accessing the following link:

`http://localhost:8080`
