# Use official Nginx image as base
FROM nginx:latest

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your app's static files into nginx public folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx (default command)
CMD ["nginx", "-g", "daemon off;"]
