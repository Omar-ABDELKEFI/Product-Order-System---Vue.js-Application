
# Product Order System - Vue.js Application

Welcome to the Product Order System built with Vue.js and Docker! This application allows users to browse products, place orders, and manage their shopping cart. Docker is used to containerize the application for easier setup and deployment.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [Usage](#usage)
5. [Contact Information](#contact-information)
6. [Credits](#credits)

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- Basic understanding of [Vue.js](https://vuejs.org/) and Docker

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/product-order-system.git
   ```

2. Navigate to the project directory:
   ```bash
   cd product-order-system
   ```

3. Build and start the application using Docker Compose:
   ```bash
   docker-compose up --build
   ```

4. Open your web browser and navigate to `http://localhost:8080` (or the port specified in `docker-compose.yml`).

## Configuration

To configure the application, you need to set up environment variables. Create a `.env` file in the root directory of the project and add your configuration variables:

```env
VUE_APP_API_BASE_URL=http://api.example.com
```

The `.env` file should be included in the `Dockerfile` to ensure that the environment variables are properly set when the container is built.


## Usage

Once the application is running, you can:

1. **Browse Products**: View a list of available products.
2. **Product Details**: Click on a product to view detailed information.
3. **Add to Cart**: Add products to your shopping cart.
4. **Place Order**: Proceed to checkout and place an order.
5. **Manage Cart**: View and modify items in your shopping cart.

Explore the application to test its features and functionalities!

## Credits

This project was developed by Omar Abdelkefi.

