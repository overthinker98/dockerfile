# Use the Nginx base image
FROM nginx:latest




# Copy your resume HTML file and the Nginx configuration file
COPY ./resume.html /usr/share/nginx/html/index.html
#COPY ./nginx.conf /etc/nginx/conf.d/

# Expose port 80
EXPOSE 80
