# Komiser Docker Container

This repository provides a minimal Docker setup to run Komiser from a scratch image.

## Requirements

- Docker
- Docker Compose V2
- make

## Usage

1. Run the container:

   ```sh
   make up
   ```

2. Stop the container:

   ```sh
   make down
   ```

3. Tail Logs:

   ```sh
   make logs
   ```

3. Clean:

   ```sh
   make clean
   ```

## Access Service

You can Access the service at http://localhost:3000
