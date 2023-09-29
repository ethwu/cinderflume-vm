
# Start up the services.
start:
    docker compose up --wait
alias s := start
alias up := start

# Build and deploy services.
deploy: build start

# Build the images for the services.
build:
    docker compose build
alias b := build

# Reload the nginx reverse proxy.
reload:
    docker exec nginx nginx -s reload
alias r := reload

# Stop the services.
stop:
    docker compose down
alias d := stop

# Get the currently-running services.
ps:
    docker ps

# Clean up artifacts.
clean:
    docker system prune
alias c := clean

