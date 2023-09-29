
# Start up the services.
start:
    make start
alias s := start

# Build and deploy services.
deploy: build start

# Build the images for the services.
build:
    make build
alias b := build

# Stop the services.
stop:
    make stop

# Get the currently-running services.
ps:
    make ps

# Clean up artifacts.
clean:
    make clean
alias c := clean

