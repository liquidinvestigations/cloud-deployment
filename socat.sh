#!/bin/bash -ex
sudo socat tcp-listen:80,fork tcp:127.0.0.1:10080
