FROM node
LABEL maintainer ReSearchITEng

ENV USR="term"

#RUN apt-get install git make g++ python bash procps \
RUN git clone https://github.com/krishnasrinivas/wetty \
    && cd wetty \
    && npm install #\
#    && apt-get remove git python make g++

RUN useradd -d /home/$USR -m -s /bin/bash $USR
RUN echo "$USR:${PASS:-$USR}" | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
