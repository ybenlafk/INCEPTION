FROM debian:buster

# Copy the setup script into the container
COPY tools/setup-mariadb.sh /setup-mariadb.sh

# Set the execute permissions for the script
RUN chmod +x /setup-mariadb.sh

# Install dependencies and set up MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Run the setup script
RUN /setup-mariadb.sh

# Copy any additional configuration files or scripts
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose the port for MariaDB
EXPOSE 3306

# Start the MariaDB service
CMD ["service", "mysql", "start"]