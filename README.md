zencontrol MQTT Demo
=================================================


About
-----

Starts up an MQTT broker and sets it up in a state that you can connect a zencontrol controller too. Once connected, you will be able to view metrics on grafana or edit Node-RED flows.

Once all the services are running you can visit the following in your local PCs browser:
* Grafana -> http://host.docker.internal:3000/
* Node-RED -> http://host.docker.internal:1880/
* Prometheus -> http://host.docker.internal:9090/

Requirements
-----

Requires a linux OS such as the one that WSL2 uses. For installation on windows insider WSL2 see https://docs.microsoft.com/en-us/windows/wsl/install-win10.

Requires docker to be installed on the host machine. For windows, ensure docker host integration is enabled for the WSL2 instance see https://docs.docker.com/docker-for-windows/wsl/.

For the zencontrol controllers to connect to your PC, you will need to ensure port 8883 is open on your PC firewall. For windows firewall rules see https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-firewall/create-an-inbound-port-rule.

Usage
-----

To start all the services
```
./run.sh
```
After the run.sh script has finished, install the CA cert found at certs/ca.pem onto the controller. For information on setting up your zencontrol controller see https://zencontrol.zendesk.com/knowledge/articles/360004742836.

To reset everything back (resets Node-RED flows/Grafana dashboards etc)
```
./reset.sh
```

Troubleshooting
-----

If your IP address changes, controllers will be unable to connect. You will need to to run the `./reset.sh` command again as the certificates need to be regenerated for your PC.
