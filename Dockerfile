FROM alpine:3.7
ADD xmrig.tar.gz ./
ENTRYPOINT [ "./xmrig" ]