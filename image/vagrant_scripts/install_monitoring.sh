#!/bin/bash

# wait until archive is available. Wait until there is internet before continue
until ping -c1 archive.ubuntu.com &>/dev/null; do
 echo "waiting for networking to initialise"
 sleep 3 
done 

# install monitoring tools
apt-get update
apt-get install -y ctop net-tools sysstat

# Netdata will be listening on port 19999
curl -sL https://raw.githubusercontent.com/automodule/bash/main/install_netdata.sh | bash
