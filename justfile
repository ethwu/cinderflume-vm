
# Call Docker Compose with all project files.
compose := 'docker compose -f ./compose.yaml ' + `fd compose -e yaml --min-depth 2 -x printf '-f %s\n' "{}" | paste -s -d' '`

# Take services online.
up *services:
    {{compose}} up --wait {{services}}
alias u := up

# Take services offline.
down *services:
    {{compose}} down {{services}}
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
    {{compose}} build {{services}}
alias b := build

# Edit the Docker Compose file.
edit:
    {{quote(env_var_or_default('VISUAL', env_var_or_default('EDITOR', '/bin/vi')))}} compose.yaml
alias e := edit

# Run a command with Docker Compose.
compose *args:
    {{compose}} {{args}}

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

