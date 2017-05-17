FROM node
LABEL maintainer ReSearchITEng

#RUN apt-get install git make g++ python bash procps \
RUN cd / \
    && git clone https://github.com/krishnasrinivas/wetty \
    && cd wetty \
    && npm install

RUN apt-get update \
    && apt-get install -y sudo vim nethogs procps htop

RUN echo '#!/bin/sh\n\
USR=${USR:-wetty} \n\
PORT=${PORT:-3000}\n\
HOST=${HOST:-wetty}\n\
adduser --home /home/$USR --shell /bin/bash $USR --gecos "" --disabled-password \n\
echo $USR:${PASS:-$USR} | chpasswd\n\
if [[ -n $SUDO ]]; then echo "$USR ALL=(ALL:ALL) ALL" >> /etc/sudoers ; fi\n\
cd /wetty \n\
exec node app.js -p 3000 --sshhost $HOST --sshport $PORT --sshuser $USR\n'\
>/entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["app.js", "-p", "3000"]
