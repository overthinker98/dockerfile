# Use the Nginx base image
FROM nginx:latest

# Copy your resume file to the appropriate location
COPY resume.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80
