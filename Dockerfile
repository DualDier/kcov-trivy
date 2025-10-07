FROM alpine:3.20

RUN apk add --no-cache bash bats kcov curl git

COPY . /app
WORKDIR /app

# Default command to run tests
CMD ["bats", "tests"]

