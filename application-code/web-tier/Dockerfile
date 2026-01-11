# ---------- Build React ----------
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# ---------- Nginx ----------
FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy YOUR nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy React build
COPY --from=build /app/build /home/ec2-user/web-tier/build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
