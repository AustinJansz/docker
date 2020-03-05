#!/bin/bash
# Get all of the additional information need for the sandbox
printf 'Username: '; read user
printf 'Password: '; read password
printf 'Root Password: '; read root_password
printf 'Network Name: '; read network
printf 'Local Port: '; read port

# Replace the information in the docker-compose.yml
sed -i -e "s/__USERNAME__/$user/g" docker-compose.yml
sed -i -e "s/__PASSWORD__/$password/g" docker-compose.yml
sed -i -e "s/__ROOT_PASSWORD__/$root_password/g" docker-compose.yml
sed -i -e "s/__NETWORK__/$network/g" docker-compose.yml
sed -i -e "s/__PORT__/$port/g" docker-compose.yml

# Stand up the docker image
docker network create "$network"
docker-compose up -d

# Remove the composition script that holds the passwords
rm -f docker-compose.yml