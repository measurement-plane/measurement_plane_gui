# Measurement Plane GUI

This repository contains the setup for deploying the Measurement Plane GUI in a Docker container. The GUI provides tools to manage and visualize measurement capabilities via a web interface.

## Prerequisites

- Docker installed on your system.
- Access to the Docker image `amlabdr/measurement_plane_gui:latest`.
- (Not required for runnin the GUI but required for working properly) A running message broker (e.g., activemq) accessible via `BROKER_URL`.

## Quick Start

### 1. Clone the Repository
```bash
git clone <repo-url>
cd measurement_plane_gui
```

### 2. Configure Environment Variables
You can modify the BROKER_URL default variables directly in the `run.sh` script if needed with the address of the ActiveMQ Broker:

```bash
BROKER_URL="amqp://localhost:5672/"
```

### 3. Run the Application
Make the script executable and run it:

```bash
chmod +x run.sh
./run.sh
```
