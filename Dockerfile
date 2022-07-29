FROM golang:1.17.7-alpine3.15

RUN mkdir -p /usr/app
WORKDIR /usr/app
RUN wget https://github.com/42wim/matterbridge/releases/download/v1.24.0/matterbridge-1.24.0-linux-64bit

COPY . .

ARG DISCORD_TOKEN
ARG MATTERBRIDGE_IRC_TGBOT_PASSWORD
RUN sed -i s/DISCORD_TOKEN/\"$DISCORD_TOKEN\"/ matterbridge.toml
RUN sed -i s/MATTERBRIDGE_IRC_TGBOT_PASSWORD/\"$MATTERBRIDGE_IRC_TGBOT_PASSWORD\"/ matterbridge.toml
RUN cat matterbridge.toml
RUN chmod +x matterbridge*
CMD ./matterbridge-1.24.0-linux-64bit

