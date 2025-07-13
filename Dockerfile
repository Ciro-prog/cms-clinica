FROM node:18-alpine

WORKDIR /opt/app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

ENV NODE_ENV=production
EXPOSE 1337

CMD ["npm", "start"] 