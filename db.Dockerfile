# Use an official MySQL base image
FROM mysql:latest

# Set MySQL environment variables (e.g., password, database name)
ENV MYSQL_ROOT_PASSWORD=mysql
ENV MYSQL_DATABASE=hello_world_DB
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=admin

# Copy SQL script to initialize the database
#COPY init.sql /docker-entrypoint-initdb.d/

# Expose port 3306 for MySQL traffic
EXPOSE 3306
