FROM node:13-alpine as builder
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . .
RUN npm run build

FROM  nginx:1.17-alpine
WORKDIR /app
COPY --from=builder /app/dist /usr/share/nginx/html
