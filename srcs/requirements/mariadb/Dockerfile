FROM debian:buster

# Install dependencies and set up MariaDB
RUN apt-get update -y && apt-get install mariadb-server -y

# Copy any additional configuration files or scripts
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the setup script into the container
COPY tools/setup-mariadb.sh ./setup-mariadb.sh

# Set the execute permissions for the script
RUN chmod +x ./setup-mariadb.sh

# Expose the port for MariaDB
EXPOSE 3306

# Start the MariaDB service
CMD ["./setup-mariadb.sh"]