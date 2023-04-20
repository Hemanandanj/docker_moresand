# Use a Node.js base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN npm install

# Copy the application code to the container
COPY nodejs.js /app

# Start the application
CMD ["node", "nodejs.js"]

# Switch to Python base image
#FROM python:3.8

# Set the working directory in the container
#WORKDIR /app

# Copy the Python application files
#COPY hello.py /app

# Run Python application
#CMD ["python", "hello.py"]

# Expose the ports for the Node.js and Python applications
EXPOSE 3000
#EXPOSE 5000
