# Inception

## Project Overview

**Inception** is a system administration project designed to broaden your knowledge of Docker and virtualized environments. The project requires the setup of a small infrastructure using Docker Compose, where several Docker containers are created and managed to run various services within a virtual machine.

## Table of Contents

1. [Introduction](#introduction)
2. [Project Requirements](#project-requirements)
3. [Setup and Installation](#setup-and-installation)

## Introduction

This project aims to deepen your understanding of Docker by challenging you to create and manage a variety of services in Docker containers. The project will introduce you to essential concepts in system administration and provide hands-on experience in setting up a virtualized environment from scratch.

## Project Requirements

To successfully complete the Inception project, you must:

- Set up a Docker environment within a virtual machine.
- Create Docker containers for NGINX with TLSv1.2 or TLSv1.3, WordPress with php-fpm, and MariaDB.
- Ensure that each service runs in its dedicated container.
- Use Alpine or Debian as the base image for your containers.
- Configure Dockerfiles for each service and integrate them into a `docker-compose.yml` file.
- Create two volumes: one for your WordPress database and another for the WordPress website files.
- Establish a Docker network to connect your containers.
- Implement a domain name pointing to your local IP address in the format `login.42.fr`.
- Follow best practices for Dockerfile creation, avoiding hacks like infinite loops.
- Securely manage credentials using environment variables and Docker secrets.

## Setup and Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/AhmedAlfahal/inception.git
   cd inception
2. **Build and Start Containers**:
  Use the provided Makefile to build and start all the Docker containers.
    ```bash
    make
3. **Access the Services**:
  After setup, your services will be accessible through your configured domain name (login.42.fr).
4. **Stop and Clean Up**:
  To stop the containers and clean up the environment:
    ```bash
    make fclean
