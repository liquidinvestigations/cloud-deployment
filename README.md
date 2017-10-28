# web-ui-deployment-scripts

Downloads and sets up VMs to work on the `web-ui` repo in the Liquid Investigations VMs.

## Steps

1. Install all dependencies marked in [the factory readme](https://github.com/liquidinvestigations/factory). If kitchen is not working, compile the latest ruby from source.
2. Run `./download_liquid.sh`.
3. Run `./launch_liquid.sh` and wait for it to boot.
4. Run `./socat.sh` to do port forwarding.
5. Add `liquid.example.org` to your `/etc/hosts` file.
6. Open up `http://liquid.example.org` in your browser. The home page should load.

The `web-ui` folder will be shared with the VM's `/opt/web-ui` dir.
