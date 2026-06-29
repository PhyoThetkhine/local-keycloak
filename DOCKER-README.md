# Running Keycloak on Docker

This setup allows you to run Keycloak 26.2.4 with PostgreSQL using Docker Compose.

## Prerequisites

- Docker Desktop installed and running
- Docker Compose installed

## Quick Start

### 1. Build and Start the Services

```bash
docker-compose up -d
```

This command will:
- Build the Keycloak Docker image
- Start PostgreSQL database
- Start Keycloak server

### 2. Access Keycloak

Once the containers are running:
- **Keycloak Admin Console**: http://localhost:8080/admin
- **Default Admin Credentials**:
  - Username: `admin`
  - Password: `admin123`

### 3. Check Container Status

```bash
docker-compose ps
```

### 4. View Logs

```bash
# View all logs
docker-compose logs -f

# View only Keycloak logs
docker-compose logs -f keycloak

# View only PostgreSQL logs
docker-compose logs -f postgres
```

## Configuration

### Custom Keycloak Settings

Edit `conf/keycloak.conf` to customize Keycloak settings:

```ini
# Database
db=postgres
db-username=keycloak
db-password=keycloak
db-url=jdbc:postgresql://postgres:5432/keycloak

# Hostname
hostname=localhost

# Proxy settings (use 'edge' for reverse proxy)
proxy=edge
```

### Database Configuration

Edit the `docker-compose.yml` to change database credentials:

```yaml
environment:
  POSTGRES_DB: keycloak
  POSTGRES_USER: keycloak
  POSTGRES_PASSWORD: keycloak
```

### Keycloak Admin Credentials

Change default admin credentials by editing `.env.docker`:

```
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=admin123
```

## Common Commands

### Stop Services

```bash
docker-compose down
```

### Stop Services and Remove Data

```bash
docker-compose down -v
```

### Rebuild Keycloak Image

```bash
docker-compose build --no-cache
```

### Restart Services

```bash
docker-compose restart
```

### Access PostgreSQL Database

```bash
docker-compose exec postgres psql -U keycloak -d keycloak
```

## Troubleshooting

### Keycloak not starting

1. Check logs: `docker-compose logs keycloak`
2. Ensure PostgreSQL is healthy: `docker-compose logs postgres`
3. Wait 30 seconds - Keycloak needs time to initialize the database

### Port Already in Use

If port 8080 is already in use, modify the port mapping in `docker-compose.yml`:

```yaml
ports:
  - "8081:8080"  # Change to 8081 or another available port
```

### Database Connection Issues

Ensure PostgreSQL container is healthy:

```bash
docker-compose ps
```

The `postgres` service should show `healthy` status before Keycloak fully starts.

## Environment Variables

You can customize Keycloak behavior with environment variables in `docker-compose.yml`:

- `KC_HOSTNAME`: Keycloak hostname (default: localhost)
- `KC_PROXY`: Proxy mode - `edge`, `reencrypt`, `passthrough` (default: edge)
- `KC_DB`: Database vendor (default: postgres)
- `KEYCLOAK_ADMIN`: Admin username (default: admin)
- `KEYCLOAK_ADMIN_PASSWORD`: Admin password (default: admin123)

## Next Steps

1. Log in to the Admin Console: http://localhost:8080/admin
2. Create a new Realm
3. Configure clients and users
4. Test authentication flows

For more information, visit: https://www.keycloak.org/
