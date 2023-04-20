# Use the official Nginx base image
FROM nginx:latest

# Remove the default Nginx configuration
#RUN rm /etc/nginx/conf.d/default.conf

#RUN mkdir /etc/nginx/sites-available/
#RUN mkdir /etc/nginx/sites-enabled/
#COPY ./default /etc/nginx/sites-available/
#RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
RUN rm -f /etc/nginx/conf.d/default.conf
COPY ./default.conf /etc/nginx/conf.d/

# Copy your custom Nginx configuration
#COPY nginx.conf /etc/nginx/conf.d/

# Expose the Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
