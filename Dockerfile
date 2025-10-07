FROM alpine:3.20

# Install bash
RUN apk add --no-cache bash

# Copy application files
COPY sample-script.sh /app/sample-script.sh

# Set working directory
WORKDIR /app

# Make script executable
RUN chmod +x sample-script.sh

# Default command
CMD ["/bin/bash", "/app/sample-script.sh"]