# Stage 1: Build stage
FROM ubuntu:22.04  AS Builder

# Install git, OpenJDK, and Maven
RUN apt-get update && \
    apt-get install -y git openjdk-17-jdk maven

# Set the working directory inside the container
WORKDIR /var/www/html

# Clone the Git repository containing your code
RUN git clone https://github.com/spring-projects/spring-petclinic.git

WORKDIR /var/www/html/spring-petclinic

# Build the application with Maven
RUN ./mvnw package

# Stage 2: Production stage
FROM openjdk:17 AS production

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /var/www/html/spring-petclinic/target/*.jar /app/spring-petclinic.jar

# Expose the port your application will run on
EXPOSE 8080

# Define the command to run your application when the container starts
CMD ["java", "-jar", "/app/spring-petclinic.jar"]

