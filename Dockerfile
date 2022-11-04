FROM ubuntu:jammy

ARG VERSION=x.x.x

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get install -qq -y hwloc msr-tools kmod && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
    
RUN wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
    dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb

RUN useradd -ms /bin/bash monero
USER monero
WORKDIR /home/monero
ADD xmrig.tar.gz .

LABEL author="ziggyds"
LABEL xmrig-version=$VERSION
LABEL description="xmrig miner"

ENTRYPOINT ["./xmrig"]
CMD ["--coin=monero", "-o stratum+tcp://pool.supportxmr.com:3333", "-u 41sPsm4hpojeTa4eyctTwxLS6nVWVJtg557fhTDCPhLT8rGFShQ8NuM8EUHUxtpSeHFdenJZNcgrw4dQXvEiDvS6LyXzFwM", "-p unraid", "-k", "--max-cpu-usage=100", "--donate-level=0", "--randomx-1gb-pages"]
