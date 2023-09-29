FROM alpine:latest

# Get the verison of Foundry to run.
ARG version=11.311

# Install current Node.
RUN apk add nodejs-current

# Create the `foundry` user.
RUN adduser -D foundry
USER foundry

# Create data directories for foundry.
RUN mkdir -p /home/foundry/foundry-vtt /home/foundry/foundry-data
VOLUME /home/foundry/foundry-data

ENV FOUNDRY_HOME /home/foundry/foundry-vtt
ENV FOUNDRY_DATA /home/foundry/foundry-data

WORKDIR "$FOUNDRY_HOME"
COPY --chown=foundry:foundry ./versions/FoundryVTT-"$version".zip .
RUN unzip ./FoundryVTT-$version.zip ; rm ./FoundryVTT-"$version".zip

EXPOSE 30000

CMD node "$FOUNDRY_HOME"/resources/app/main.mjs --dataPath="$FOUNDRY_DATA" 
