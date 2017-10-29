# web-ui-deployment-scripts

Downloads and sets up VMs to work on the `web-ui` repo in the Liquid Investigations VMs.

## Steps for UI development

1. Install `socat`. Then, install all dependencies marked in [the factory readme](https://github.com/liquidinvestigations/factory). If kitchen is not working, compile the latest ruby from source.
2. Run `./download_liquid.sh`.
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

6. Open up `http://liquid.example.org` in your browser. The home page should load.
7. Connect to the thing via `ssh liquid@localhost -p 10022` with password liquid. You have sudo.

The `web-ui` folder will be shared with the VM's `/opt/web-ui` dir.

## Steps for manual testing of the `liquid-cloud-x86_64` image

Do the same as above, but at step `3.` use `./launch_liquid.sh`, which does not override the web-ui repo.
