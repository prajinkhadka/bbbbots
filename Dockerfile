FROM ubuntu:latest
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y npm 
WORKDIR /app

RUN groupadd -r myuser && useradd -r -g myuser -G audio,video myuser \
   && mkdir -p /home/myuser/Downloads \
   && chown -R myuser:myuser /home/myuser \
   && chown -R myuser:myuser /app

RUN chmod 777 .
RUN apt install -y vim
RUN apt install -y iputils-ping
RUN apt-get update \
 && apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm-dev\
 && apt-get clean \
 && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/*

USER myuser
RUN npm i bigbluebot
COPY ./pool.js node_modules/bigbluebot/lib/pool.js
COPY . .
CMD ["node", "audio_video.js"]
