FROM amd64/debian

RUN apt-get update && \
    apt-get install -y default-jre-headless && \
    apt-get install -y git

EXPOSE 25565/tcp

RUN git clone https://github.com/MasonRiley/mc-docker.git

WORKDIR /mc-docker/servers/kingdom-of-riley

RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
