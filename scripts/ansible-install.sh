#!/bin/bash

cd provision
exec ansible-galaxy install -r ansible-galaxy.yml
