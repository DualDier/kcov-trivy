FROM alpine:3.20

RUN apk add --no-cache bash bats curl git

COPY . /app
WORKDIR /app

# Default command to run tests
CMD ["bats", "tests"]

