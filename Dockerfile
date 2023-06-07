FROM ghcr.io/puppeteer/puppeteer:20.5.0

USER root

#http_proxy=http://host:port
# you should config this if you use forefront api, this apikey is used for receive register email
# get api key here https://rapidapi.com/calvinloveland335703-0p6BxLYIH8f/api/temp-mail44
#rapid_api_key=xxxxxxxxxx
#EMAIL_TYPE=temp-email44 # temp email type
#DEBUG=0 # default:0 when you set 1 make sure run with chromium ui
#POOL_SIZE=3 # forefront concurrency size. You can engage in {POOL_SIZE} conversations concurrently.

ENV RAID_KEY=""
ENV EMAIL_TYPE=temp-email44
ENV DEBUG=0 
ENV POOL_SIZE=3

RUN echo "RAID_KEY=$MY_VAR" >> .env && echo "EMAIL_TYPE=$EMAIL_TYPE" >> .env && echo "DEBUG=$DEBUG" >> .env && echo "POOL_SIZE=$POOL_SIZE" >> .env

WORKDIR /usr/src/app

COPY --chown=pptruser package.json /usr/src/app/

RUN npm i --registry=https://registry.npm.taobao.org

COPY --chown=pptruser . /usr/src/app

VOLUME [ "/usr/src/app/run" ]

EXPOSE 3000

CMD npm start
