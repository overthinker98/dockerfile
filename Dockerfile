# Use the Nginx base image
FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your resume HTML file and the Nginx configuration file
COPY ./resume.html /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/

# Expose port 80
EXPOSE 80
