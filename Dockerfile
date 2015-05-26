FROM lalyos/scratch-chmx
ADD https://github.com/lalyos/lolfiglet/releases/download/v0.0.2/lolfiglet-linux /bin/lolfiglet
RUN ["/bin/chmx", "/bin/lolfiglet"]
ENTRYPOINT ["/bin/lolfiglet"]
