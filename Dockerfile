FROM node:12 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.19
COPY --from=build /app/build /usr/share/nginx/html
