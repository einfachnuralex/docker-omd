#!/usr/bin/env bash

# The start script for the docker container.

omd start
/usr/sbin/apache2ctl -D FOREGROUND

