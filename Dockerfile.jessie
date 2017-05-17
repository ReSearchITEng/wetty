FROM node
LABEL maintainer ReSearchITEng

#RUN apt-get install git make g++ python bash procps \
RUN git clone https://github.com/krishnasrinivas/wetty \
    && cd wetty \
    && npm install

RUN echo $'#!/bin/sh\n\
USR=${USR:-wetty} \n\
PORT=${PORT:-3000}\n\
HOST=${HOST:-wetty}\n\
adduser -D -h /home/$USR -s /bin/bash $USR\n\
echo $USR:${PASS:-$USR} | chpasswd\n\
exec node app.js -p 3000 --sshhost $HOST --sshport $PORT --sshuser $USR\n'\
>/entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["app.js", "-p", "3000"]
