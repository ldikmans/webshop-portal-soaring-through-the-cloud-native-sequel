#  Node based on Debian GNU/Linux 8 -must be used as kafka-avro errors with non-debian based distros
FROM node

# Create working directory
RUN mkdir -p /usr/src/app
COPY . /usr/src/app

# Set working dir
WORKDIR /usr/src/app


RUN npm install -g @oracle/ojet-cli

RUN npm install
RUN ojet build
RUN cp -a ./web/. ./jet-on-node/public
RUN cd jet-on-node && npm install


EXPOSE 3000
CMD [ "node", "./jet-on-node/bin/www" ]