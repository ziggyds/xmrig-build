FROM alpine:3.13

ARG VERSION=x.x.x

ENV ADDRESS=41sPsm4hpojeTa4eyctTwxLS6nVWVJtg557fhTDCPhLT8rGFShQ8NuM8EUHUxtpSeHFdenJZNcgrw4dQXvEiDvS6LyXzFwM
ENV WORKER=docker-miner
ENV POOL=stratum+tcp://pool.supportxmr.com:3333
ENV MAXCPULOAD=100
ENV ALGO=rx/0

ARG USER=docker
ENV HOME /home/$USER

RUN addgroup -S $USER && adduser -S -G $USER $USER 

USER $USER
WORKDIR $HOME

ADD xmrig.tar.gz ./
WORKDIR $HOME/xmrig-$VERSION

LABEL buildDate=$buildDate
LABEL author="ziggyds"
LABEL xmrig-version=$VERSION
LABEL description="xmrig miner"

CMD ./xmrig --cpu-max-threads-hint=$MAXCPULOAD --algo=$ALGO --url=$POOL --user=$ADDRESS --pass=$WORKER --keepalive