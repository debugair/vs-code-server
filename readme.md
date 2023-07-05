# Documentation

## Docker Compose

This is a repository that contains a docker-compose file that will setup a visual studio code-server with the following mods:

- python3 (adds python 3 to the container)
- powershell (adds powershell to the container)
- scikit-learn (adds scikit-learn to the container)
- extension-arguments (is used to add extensions to the vs code-server by the env variable `VSCODE_EXTENSION_IDS`)
- git (adds git to the container)
- docker (adds docker to the container)

More details about the code-server image and configuration can be found here: <https://github.com/linuxserver/docker-code-server></br>
To get to know more about available mods for linuxserver images, please visit: <https://mods.linuxserver.io></br>
or for the linuxserver code-server image: <https://mods.linuxserver.io/?mod=code-server></br>
To customize the linuxserver image you can use the following documentation: <https://docs.linuxserver.io/general/container-customization></br>

### Scripts

Inside the folder `./scripts/` are two powershell files located. One is named `start.ps1` the other one is called `stop.ps1`. These scripts can be used to run the docker compose commands to either start or stop the container. In addition in the stop file there is some clean up work done to remove orphaned docker images and volumes. Call the scripts in the root folder of this repository in a powershell terminal with the following commands:

```powershell
.\scripts\start.ps1
# or
.\scripts\stop.ps1
```

In the start script we try to read the IP address from the host system to add it to a hosts file with the server name `hostsystem` so that it can be reached within the container by the corresponding host name. The IP and hostname are written to the file `./codeserver/hosts` and will be mounted into the container under `/config/hosts`.

## VS Code-Server

Once the container is up and running, you can access the vs code-server by opening a browser and navigate to <http://localhost:8443>. You might be asked to enter a password. The default password can be found in the docker-compose.yml file. If you want to change the password, you can do so by changing the environment variable `PASSWORD` in the docker-compose.yml file. If you need the sudo password to execute shell commands in the terminal inside the docker container, you can find it in the docker-compose.yml file as well. If you want to change the sudo password, you can do so by changing the environment variable `SUDO_PASSWORD` in the docker-compose.yml file. Per default the following vs code-extensions will be installed:

- ms-python.python
- ms-python.isort
- ms-toolsai.jupyter
- wayou.vscode-todo-highlight
- Gruntfuggly.todo-tree
- ms-vscode.powershell
- BeardedBear.beardedtheme
- streetsidesoftware.code-spell-checker
- mhutchie.git-graph
- DavidAnson.vscode-markdownlint
- littlefoxteam.vscode-python-test-adapter
- hbenl.vscode-test-explorer

To add additional extensions use the official id of the extension what can be found in vs code-server itself when you search for an extension, or if you navigate to the market place of vs code: <https://marketplace.visualstudio.com/VSCode>. Add the extension ids to the environment variable `VSCODE_EXTENSION_IDS` in the docker-compose.yml file. If you want to add more than one extension, separate the ids by a a pipe char (|).

### Configuration

Per default the local file `./codeserver/vs-code-settings.json` will be mounted under `/config/data/User/settings.json` what is the default location of the vs code configuration (settings) file. If you want to add some configuration to the vs code-server, you can do so by adding the configuration to the file `./codeserver/vs-code-settings.json`.

### Samples

The folder `./codeserver/workspace` inside this repository will be mounted under the default workspace folder of the vs code-server container (see docker-compose.yml under volumes). This folder contains some sample files to demonstrate how to use jupyter and python inside visual studio code. Per default the location inside the container is `/config/workspace`. If you want to change the location, you can do so by changing the environment variable `DEFAULT_WORKSPACE` in the docker-compose.yml file. Don't forget to change the location in the docker-compose.yml file as well. If you add new files in visual studio code-server in your workspace folder, they automatically will end up on your local system as well. This works both ways so if you want to use your own local files just copy them into the folder `./codeserver/workspace` and they will be available inside the vs code-server container as well.
