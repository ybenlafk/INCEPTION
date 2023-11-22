
# Inception Project

This project aims to set up a development environment for the Inception project using Docker and Docker Compose. It includes three services: Nginx, MariaDB, and WordPress.

## Prerequisites

Before you begin, ensure that you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/your-username/inception.git
   ```

2. Navigate to the project directory:

   ```bash
   cd inception
   ```

3. Create a `.env` file and customize the environment variables:

   ```bash
   cp .env.example .env
   ```

   Edit the `.env` file to set the desired values for environment variables.

## Running the Services

Use Docker Compose to start the services:

```bash
docker-compose up -d
```

This command will build the images and start the containers in the background.

To stop the services:

```bash
docker-compose down
```

## Accessing the Services

- Nginx: http://localhost
- MariaDB:
  - Host: `localhost`
  - Port: `3306`
  - Username: `root`
  - Password: `your_root_password`
- WordPress: http://localhost/wordpress
  - Database Name: `wordpress`
  - Database User: `wordpress`
  - Database Password: `your_database_password`

## Customization

- Adjust Nginx configurations in `nginx/nginx.conf` if needed.
- Modify MariaDB configurations in `mariadb/my.cnf` if necessary.
- Customize WordPress settings in `wordpress/wp-config.php` if required.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
