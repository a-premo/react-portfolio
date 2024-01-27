# Step 1: Build the React application
FROM node:latest as build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

# Step 2: Serve the app with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
# Default port exposure
EXPOSE 80
# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
