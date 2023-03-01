FROM golang:1-alpine AS build
RUN mkdir /app
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./..

FROM alpine:latest
COPY --from=build /app/main /app/main
EXPOSE 8081
ENTRYPOINT [ "./main" ]

