FROM alpine:latest

RUN apk add --update nodejs npm chromium

ENV USER lighthouse
ENV GROUP lighthouse
RUN addgroup $GROUP
RUN adduser -S $USER -G $GROUP

WORKDIR /home/$USER
COPY entrypoint.sh .
COPY package.json .

RUN chown $USER:$GROUP entrypoint.sh package.json
RUN chmod 755 entrypoint.sh

USER $USER
RUN npm i

RUN mkdir reports

ENTRYPOINT ["./entrypoint.sh"]
