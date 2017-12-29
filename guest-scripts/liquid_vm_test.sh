#!/bin/bash -e

PYTHONUNBUFFERED=yyy /opt/setup/bin/run_first_boot_tests.py || echo "tests failed"
echo "Press CTRL-C to kill the VM."
sleep infinity
