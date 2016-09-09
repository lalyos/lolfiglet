FROM alpine
ADD https://github.com/lalyos/lolfiglet/releases/download/v0.0.2/lolfiglet-linux /bin/lolfiglet
RUN chmod +x /bin/lolfiglet
RUN apk add -U bash
#ENTRYPOINT ["/bin/lolfiglet"]
ADD start /bin/start
LABEL io.cmd.description="Generates lolcat figlet"
ENTRYPOINT [ "/bin/start" ]
