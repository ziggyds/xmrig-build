FROM ubuntu:lunar

ARG VERSION=x.x.x
  
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get install -qq -y hwloc msr-tools kmod && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash monero
USER monero
WORKDIR /home/monero
ADD xmrig.tar.gz .

LABEL author="ziggyds"
LABEL xmrig-version=$VERSION
LABEL description="xmrig miner"

ENTRYPOINT ["./xmrig"]
CMD ["--coin=monero", "-o stratum+tcp://rx.unmineable.com:3333", "-u CRO:0xe12f072aA4981e49cE8dBB21C79ead3E7E9F7bE9.Docker#n92f-06d3", "-p unraid", "-k", "--max-cpu-usage=100", "--donate-level=0", "--randomx-1gb-pages"]
