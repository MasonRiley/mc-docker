FROM amd64/debian

RUN apt-get update && \
    apt-get install -y apt-utils

RUN apt-get install -y default-jre-headless && \
    # apt-get install -y wget && \
    # apt-get install -y screen && \
    apt-get install -y git && \
    apt-get install -y procps

EXPOSE 25565/tcp

RUN mkdir -p ~/minecraft && \
    cd ~/minecraft

WORKDIR /minecraft

RUN git clone https://github.com/MasonRiley/mc-docker.git

RUN cd mc-docker

WORKDIR /minecraft/mc-docker

RUN cd server

WORKDIR /minecraft/mc-docker/server

RUN touch run.sh

RUN printf "#!/bin/bash\njava -Xms1G -Xmx1G -jar server.jar nogui" > /run.sh

ENTRYPOINT ["/run.sh"]]

RUN chmod 755 /run.sh

# RUN ls

#RUN screen -d -m java -Xms1G -Xmx1G -jar server.jar nogui

#RUN (java -Xms1G -Xmx1G -jar server.jar nogui) &
