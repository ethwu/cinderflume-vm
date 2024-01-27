FROM alpine:latest

# Install dependencies.
RUN apk add \
    ffmpeg \
    ghostscript \
    git \
    graphicsmagick \
    npm

# Create the `spacedeck` user.
RUN adduser -D spacedeck
USER spacedeck

# Download the sources.
RUN git clone --depth=1 https://github.com/spacedeck/spacedeck-open.git /home/spacedeck/spacedeck
WORKDIR /home/spacedeck/spacedeck

# Install dependencies.
RUN npm install

# Run OpenBoard.
CMD node spacedeck.js

