# web-ui-deployment-scripts

Downloads and sets up VMs to work on the `web-ui` repo in the Liquid Investigations VMs.

## Steps for UI development

1. Install `socat`. Then, install all dependencies marked in [the factory readme](https://github.com/liquidinvestigations/factory).
2. Run `./download.sh`.
3. Run `./launch_web_ui.sh` and wait for it to boot.
4. Run `./socat.sh` to do port forwarding.
5. Add the following lines to your `/etc/hosts` file:

```
127.0.0.1 liquid.example.org
127.0.0.1 hoover.liquid.example.org
127.0.0.1 davros.liquid.example.org
127.0.0.1 dokuwiki.liquid.example.org
127.0.0.1 matrix.liquid.example.org
127.0.0.1 hypothesis.liquid.example.org
127.0.0.1 client.hypothesis.liquid.example.org
```

6. Open up `http://liquid.example.org` in your browser. The welcome form should load.
7. Connect to the thing via `./ssh.sh` with password liquid. You have sudo.

The `web-ui` folder will be shared with the VM's `/opt/web-ui` dir.
The `ui-templates` folder will be shared with the VM's `/opt/ui-templates` dir.

## Steps for manual testing of the `liquid-cloud-x86_64` image

Do the same as above, but at step `3.` use `./launch_liquid.sh`, which does not override the web-ui repo.
