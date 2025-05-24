#Dockerfile code to create lightweight image
#---------build stage-------------------------
FROM golang:1.22-alpine AS builder
RUN adduser -D -g "" app_user
WORKDIR /app
COPY . .
RUN go build -o SimpleTimeService main.go
#-----------application run stage-----------------------------------
FROM alpine:latest
RUN adduser -D -g '' appuser
WORKDIR /home/appuser
COPY --from=builder /app/SimpleTimeService .
# Use non-root user
USER appuser
EXPOSE 8080
ENTRYPOINT ["./SimpleTimeService"]