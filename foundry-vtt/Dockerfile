FROM alpine:latest

# Install current Node.
RUN apk add nodejs-current

# Create the `foundry` user.
RUN adduser -D foundry
USER foundry

# Create data directories for foundry.
RUN mkdir -p /home/foundry/foundry-vtt /home/foundry/foundry-data
RUN ls -lah /home/foundry
VOLUME /home/foundry/foundry-data

ENV FOUNDRY_HOME /home/foundry/foundry-vtt
ENV FOUNDRY_DATA /home/foundry/foundry-data

WORKDIR "$FOUNDRY_HOME"
COPY ./FoundryVTT-11.308.zip .
RUN unzip ./FoundryVTT-11.308.zip ; rm ./FoundryVTT-11.308.zip

EXPOSE 30000

CMD node "$FOUNDRY_HOME"/resources/app/main.mjs --dataPath="$FOUNDRY_DATA" 
