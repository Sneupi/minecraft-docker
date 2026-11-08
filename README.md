# Introduction

This repo provides the instructions and `docker-compose.yml` to run a public vanilla Minecraft server using Docker and a tunneling service (Playit), for an easy and subscription-less server with friends ran on your own hardware (e.g. unused laptop). 

This repo may be modified (at your own risk) to run other server configurations (e.g. modded) or alternate tunneling services of your choice.

# Guide

1. On your hosting computer, install Docker (either Desktop or CLI).
2. On your hosting computer, clone this repo.
3. In your repo clone, create file `.env` using the provided `.env.example`.
4. Create an account with [Playit.gg](https://playit.gg/)
5. Setup a Docker agent for Playit using their [agent wizard](https://playit.gg/account/setup/wizard/new-account/integration-choice). Keep this wizard open, we will come back.
6. Playit will provide you with a `SECRET_KEY`. Copy/paste this key into your `.env` file from earlier, and never share it with anyone.
7. On your hosting computer, using a command line terminal, navigate to the directory holding this cloned repo.
8. Using the terminal, run `docker compose up -d`.
9. From here, you may confirm the containers are running with command `docker ps` or the desktop app if Docker Desktop was installed.
10. Going back to your Playit wizard, verify the agent successfully connected.
11. In Playit, create a new tunnel using their [tunnel wizard](https://playit.gg/account/setup/new-tunnel). Select the preset configuration for Minecraft Java, and assign it to your agent created earlier. Do not change Origin Config settings.
12. On successful tunnel creation, you may be redirected to your created tunnel. If not, it can be found in your [tunnels menu](https://playit.gg/account/tunnels).
13. In your tunnel, a public IP will be shown to connect to it. This is your Minecraft server IP.
14. Verify the server is reachable by connecting in Minecraft, or using a web api such as [mcstatus.io](https://mcstatus.io/).

Congrats! You should have a working public Minecraft server. This server should be up so long as your hosting computer is powered and online, and should auto-restart so long as Docker is set to launch on reboot.

You may stop the server at any time by navigating to your cloned repo directory via terminal, and calling command `docker compose down`. Alternatively you may stop it from Docker Desktop, if installed.
