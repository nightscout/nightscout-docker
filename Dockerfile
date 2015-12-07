
FROM node:0.12
MAINTAINER Ben West <bewest@gmail.com>

# TODO
# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/

RUN mkdir -p /opt/app

WORKDIR /opt/app
RUN git clone git://github.com/nightscout/cgm-remote-monitor.git /opt/app
RUN cd /opt/app &&  git checkout ${DEPLOY_HEAD-master}
RUN cd /opt/app && npm install
RUN cd /opt/app && npm run postinstall
RUN cd /opt/app && npm run env
EXPOSE 5000
EXPOSE 8080
EXPOSE 8000

CMD ["node", "server.js"]
