# ToolKit

Toolkit gathering centralized useful containerized tools for local environments.

This project contains 3 files for lauching tools useful in development and production environments.

It contains the 5 following pieces of software.

 - **Traefik**: a reverse proxy listening on port 80 and 443 for routing requests to specific containers.
 - **Ghosts**: a utility tool for automatically register local domain names into the native OS `hosts` file.
 - **Portainer**: a web UI for managing Docker stacks and Docker containers.
 - **Adminer**: a utility tool for manage all database in the `server_db` network.
 - **MailHog**: a SMTP server to get all mail sent in the `server_mail` network.

## Quick start

This project has to be started only once as it will automatically restart on the machine reboot.

### Development environment
First gen certificate with the script(certs/gen-cer.sh).

Then docker-compose up -d

Once it has started, you can browse [ghosts.local](https://ghosts.local) to find links to exposed containers through the proxy.

### Production environment
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

Once it has started, you can browse [ghosts_url](https://your_ghosts_url) to find links to exposed containers through the proxy.