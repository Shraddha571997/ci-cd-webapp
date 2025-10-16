# Use official Nginx image
FROM nginx:alpine
# Copy the HTML file into Nginx web root
COPY index.html /usr/share/nginx/html/index.html
# Expose port 80
EXPOSE 80
