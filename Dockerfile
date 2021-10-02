FROM ubuntu:hirsute

ARG VERSION=x.x.x

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get install -qq -y hwloc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash monero
USER monero
WORKDIR /home/monero

ADD xmrig.tar.gz .

LABEL buildDate=$buildDate
LABEL author="ziggyds"
LABEL xmrig-version=$VERSION
LABEL description="xmrig miner"

ENTRYPOINT ["./xmrig"]
CMD ["--coin=monero", "-o stratum+tcp://pool.supportxmr.com:3333", "-u 41sPsm4hpojeTa4eyctTwxLS6nVWVJtg557fhTDCPhLT8rGFShQ8NuM8EUHUxtpSeHFdenJZNcgrw4dQXvEiDvS6LyXzFwM", "-p unraid", "-k", "--max-cpu-usage=100", "--donate-level=0"]