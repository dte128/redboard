FROM ubuntu:latest
RUN apt-get update -y \
        && apt-get install -y git  mongodb-clients nodejs npm\
        && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10\
        && git clone https://github.com/0thm4n3/redboard.git\
        && cd redboard\
        && npm install\
        && echo "module.exports = {'url' : 'mongodb://@mongodb:27017/redboard'};" > config/database.js\
        && npm install express
WORKDIR /redboard
CMD ["npm", "start"]
