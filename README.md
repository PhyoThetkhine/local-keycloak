# My Local Keycloak

Welcome to your local Keycloak development environment! This project uses Docker Compose to easily spin up a local instance of Keycloak with a PostgreSQL database.

## Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.

## Step-by-Step Setup

### 1. Start the Containers
Open your terminal, navigate to this project directory, and run:
```bash
docker compose up -d
```
*Note: If you run into mount errors because you moved the folder, run `docker compose down` first before starting it up again.*

### 2. Access Keycloak
Once the containers are running and healthy, open your browser and go to:
[http://localhost:8080](http://localhost:8080)

### 3. Log In
Click on the **Administration Console** link. Log in using the default credentials configured in `.env.docker`:
- **Username:** `admin`
- **Password:** `admin123`

## Directory Structure
- `conf/`: Contains Keycloak configuration files (e.g., `keycloak.conf`).
- `providers/`: Drop any custom Keycloak extensions or providers (.jar files) here.
- `themes/`: Drop any custom UI themes here.
- `realm-export.json`: A pre-configured realm export. The container is set up to automatically import this on startup (`--import-realm` flag).

## Stopping the Server
When you are done testing, you can stop and remove the containers by running:
```bash
docker compose down
```

*Your database data is persisted in a Docker volume (`postgres_data`), so you won't lose your users or settings when you tear down the containers!*