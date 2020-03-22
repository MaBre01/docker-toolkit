# Toolkit

Toolkit gathering centralized useful containerized tools for local environments.

This project contains a `docker-compose.yml` file for launching tools useful aside your regular Docker environments.

It contains the 3 following pieces of software.

 - **Traefik**: a reverse proxy listening on port 80 and 443 for routing requests to specific containers.
 - **Portainer**: a web UI for managing Docker stacks and Docker containers.
 - **Ghosts**: a utility tool for automatically register local domain names into the native OS `hosts` file.

## Quick start

This project has to be started only once as it will automatically restart on the machine reboot.

    docker-compose up -d

Once it has started, you can browse [ghosts.local](http://ghosts.local) to find links to exposed containers through the proxy.
