FROM amd64/debian

RUN apt-get update && \
    apt-get install -y default-jre-headless && \
    apt-get install -y git

EXPOSE 25565/tcp

RUN git clone https://github.com/MasonRiley/mc-docker.git

WORKDIR /mc-docker/server

RUN touch run.sh

RUN printf "#!/bin/bash\njava -Xms1G -Xmx1G -jar server.jar nogui" > /run.sh

RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
