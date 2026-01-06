FROM ghcr.io/puppeteer/puppeteer:21.6.0
USER root
RUN apt-get update && apt-get install -y libxss1 --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "node", "index.js" ]
