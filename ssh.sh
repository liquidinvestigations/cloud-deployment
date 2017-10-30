#!/bin/bash
echo "password is liquid."
exec ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no liquid@liquid.example.org -p 10022
