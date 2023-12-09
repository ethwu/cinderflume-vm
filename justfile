
# Call Docker Compose with all project files.
docker-compose := 'docker compose -f ./docker-compose.yaml ' + `fd docker-compose -e yaml --min-depth 2 -x printf '-f %s\n' "{}" | paste -s -d' '`

# Take services online.
up *services:
    {{docker-compose}} up --wait {{services}}
alias u := up

# Take services offline.
down *services:
    {{docker-compose}} down {{services}}
alias d := down

# Cycle services down and up.
cycle *services: (down services) (up services)
alias y := cycle

# Get the logs for a specific service.
logs service:
    docker logs {{quote(service)}}
alias l := logs

# Build services.
build *services:
    {{docker-compose}} build {{services}}
alias b := build

# Edit the Docker Compose file.
edit:
    {{quote(env_var_or_default('VISUAL', env_var_or_default('EDITOR', '/bin/vi')))}} docker-compose.yaml
alias e := edit

# Run a command with Docker Compose.
compose *args:
    {{docker-compose}} {{args}}

# Reload the nginx reverse proxy.
reload:
    docker exec nginx nginx -s reload
alias r := reload

# Get the currently-running services.
ps:
    docker ps

# Clean up artifacts.
clean:
    docker system prune
    just nginx/clean
alias c := clean

