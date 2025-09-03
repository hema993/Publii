FROM node:18-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git
RUN git clone https://github.com/hema993/Publii.git . 

RUN npm ci
RUN npm run build

FROM nginx:stable-alpine

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]

