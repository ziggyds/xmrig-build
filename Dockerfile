FROM alpine:3.7
ADD xmrig.tar.gz ./
RUN pwd && ls -la
WORKDIR /xmrig
ENTRYPOINT [ "./xmrig" ]