#FROM scratch
FROM chmx
MAINTAINER lalyos@yahoo.com

ADD https://github.com/lalyos/lolfiglet/releases/download/v0.0.2/lolfiglet-linux /lolfiglet
RUN ["/chmx","/lolfiglet"]

ENTRYPOINT ["/lolfiglet"]
