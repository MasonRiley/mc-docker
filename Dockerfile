FROM amd64/debian

RUN apt-get update && \
    apt-get install -y apt-utils

RUN apt-get install -y default-jre-headless && \
    apt-get install -y wget && \
    apt-get install -y screen
 
RUN mkdir -p ~/minecraft && \
    cd ~/minecraft

RUN  wget https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar

RUN java -Xms1G -Xmx1G -jar server.jar nogui

RUN rm eula.txt

RUN touch eula.txt

RUN printf "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).\n#Sun Jul 19 09:36:49 PDT 2020\neula=true" >> eula.txt

RUN ls -la

RUN screen -d -m java -Xms1G -Xmx1G -jar server.jar nogui
