#!/bin/bash

# Get public IP
public_ip=$(curl -s ifconfig.me)

# Default values
default_public_server="True" # Default Public Server to True

default_server_name="PalWorld Server"
default_server_description="My Palworld Server"
default_admin_password="password"
default_port="8211"
default_players="32"
default_death_penalty="0" # 0 = None, 1 = items, 2 = items and equipment, 3 = items, equipment and pals

# Use environment variable if set, otherwise use default
public_server=${PUBLICSERVER:-$default_public_server} # Override Public Server if Environment Variable is used

server_name=${SERVERNAME:-$default_server_name}
server_description=${SERVERDESCRIPTION:-$default_server_description}
admin_password=${ADMINPASSWORD:-$default_admin_password}
port=${PORT:-$default_port}
players=${PLAYERS:-$default_players}
death_penalty=${DEATHPENALTY:-$default_death_penalty}

# Navigate to the appropriate directory
cd $HOME/.steam/steam/steamapps/common/PalServer

# Execute the PalServer.sh script with the variables
if [ $public_server == "True" ] ; then
        ./PalServer.sh EpicApp=Palserver \
                -publicip="$public_ip" \
                -publicport="$port" \
                -ServerName="$server_name" \
                -ServerDescription="$server_description" \
                -AdminPassword="$admin_password" \
                -port="$port" \
                -players="$players" \
                -DeathPenalty="$death_penalty" \
                -useperfthreads \
                -NoAsyncLoadingThread \
                -UseMultithreadForDS
else
        ./PalServer.sh \
                -ServerName="$server_name" \
                -ServerDescription="$server_description" \
                -AdminPassword="$admin_password" \
                -port="$port" \
                -players="$players" \
                -DeathPenalty="$death_penalty" \
                -useperfthreads \
                -NoAsyncLoadingThread \
                -UseMultithreadForDS