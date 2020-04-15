# ToolKit

This toolkit is set of tools aiming to simplify the execution of local containerized applications.

It contains the 5 following pieces of software.

 - **[Traefik](https://ghosts.local)**: a reverse proxy listening on port 80 and 443 for routing requests to specific containers.
 - **Ghosts**: tool to automatically register local domain names into the native OS `hosts` file.
 - **Portainer**: a web UI for managing Docker stacks and Docker containers.
 - **Adminer**: tool to manage all databases connected in a same docker network.
 - **MailHog**: SMTP server to catch and browse all mails sent from the local application.

## Set Up for Linux

This project has to be started only once as it will automatically restart when the machine reboots.

### Development environment

First, you have to generate locals SSL certificates with the script `./certs/gen-cer.sh`.

Then, you can start the docker stack with:

    docker-compose up -d

Once it has started, you can browse [ghosts.local](https://ghosts.local) to find links to exposed containers through the proxy.

### Production environment

First, you have to create a `.env` file at the root of the project, and add the different variables: 

    $ cat .env
    traefik_domain=domain.com
    traefik_email=traefik@example.com
    traefik_url=traefik.domain.com
    traefik_auth=user:xxxx
    ghosts_url=ghosts.domain.com
    ghosts_auth=user:xxxx
    portainer_url=portainer.domain.com
    adminer_url=adminer.domain.com
    adminer_auth=user:xxxx
    mailhog_url=mailhog.domain.com
    mailhog_auth=user:xxxx

Then, you can launch :

    docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

Once it has started, you can browse [ghosts.domain.com]() to find links to exposed containers through the proxy.

## Set Up for Windows

First, you have to install [Docker for Windows](https://docs.docker.com/docker-for-windows/install/).

**Warning**

- Install Docker with Linux containers and not Windows containers.
- Docker for Windows requires Hyper-V. When Hyper-V is enabled, you can't run any other virtual machine hypervisor at the same time (VMWare, VirtualBox). 

If you want to revert and disable Hyper-V, follow the following [tutorial](https://www.youtube.com/watch?v=VIBdY-5zr58).

After, you have to edit the Docker for Windows configuration. Right click the blue whale in your Windows toolbar and go to the Docker settings. Then, under `Settings / Resources / File sharing`, make sure `C` is ticked as well as the disk on which your development projects reside. You might need to restart Docker for this setting to be applied.

Then, you have to change the permissions of the `hosts` file of Windows. Go under `C:\Windows\System32\drivers\etc`, and right click the `hosts` file, `properties / security ` and add full control permission to the 'Users group'.

During the installation, you might be prompted to allow connections to go through the firewall.

As for Linux, you also need to generate the SSL certificates. Launch this command in the toolkit folder: 

    docker run -it --rm -v [absolute-path-of-toolkit]/certs:/certs pgarrett/openssl-alpine ash -c "cd certs; /bin/ash ./gen-cer.sh"

After, you can up the toolkit with :

    docker-compose -f docker-compose.yml -f docker-compose.override.yml -f docker-compose.override-win.yml up -d

Once it has started, you can browse [ghosts.local](https://ghosts.local) to find links to exposed containers through the proxy.





