FROM node:16

# install chromium, tini and clear cache
RUN PATH="/usr/bin:$PATH"
RUN export PATH
RUN apt-get update && apt-get install -y chromium
RUN which chromium

WORKDIR "/var/prerender"

# install npm packages
ADD . .
RUN npm install
# USER node

EXPOSE 3000

CMD ["node", "server.js"]
