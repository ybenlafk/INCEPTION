
# Inception Project

This project aims to set up a development environment for the Inception project using Docker and Docker Compose. It includes three services: Nginx, MariaDB, and WordPress.

## Prerequisites

Before you begin, ensure that you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone the repository to your local machine:

   ```bash
   https://github.com/ybenlafk/INCEPTION.git
   ```

2. Navigate to the project directory:

   ```bash
   cd INCEPTION
   ```

3. Create a `.env` file in src directory and customize the environment variables:

   ```bash
   cp .env.example .env
   ```

   Edit the `.env` file to set the desired values for environment variables.

## Running the Services

Use Docker Compose to start the services:

```bash
make
```

This command will build the images and start the containers in the background.

To stop and clean the services:

```bash
make clean
```

## Accessing the Services

- WordPress: https://<host_name>/wp-admin.php
  - Login with the wp user and wp password that you use in the .env file.

## Customization

- Adjust Nginx configurations in `nginx/nginx.conf` if needed.
- Modify MariaDB configurations in `mariadb/my.cnf` if necessary.
- Customize WordPress settings in `wordpress/wp-config.php` if required.

