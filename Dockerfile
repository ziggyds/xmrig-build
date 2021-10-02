FROM alpine:3.7 as Download
ARG Version
RUN wget https://github.com/ziggyds/xmrig-build/releases/download/${Version}/xmrig-${Version}-lin64.tar.gz
RUN tar -xzvf xmrig-*.tar.gz && rm xmrig-*.tar.gz
RUN mv xmrig-* xmrig

FROM alpine:3.7
COPY --from=Download xmrig/ xmrig
WORKDIR /xmrig
ENTRYPOINT [ "./xmrig" ]