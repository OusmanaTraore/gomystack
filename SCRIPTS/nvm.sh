#!/bin/bash
echo -e  "Installation de nvm >"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo -e  "VERSION DE NVM >"
nvm --version

echo -e  "Pour Switcher entre les version, utiliser > nvm use <nvm-version>
 exemple: nvm use v12.18.1 "

echo -e  "Liste des versions installées >"
nvm ls

read -p " Entrez la version de nodejs, exemple: 16.5.0 
|> " nodejs_version
nvm install $nodejs_version

echo -e  "Installation de Nodesource >"
read -p " Entrez la version de nodesource 10,12,14...
|> " node_source_version

#sudo curl -sL https://deb.nodesource.com/setup_$node_source_version.x | sudo -E bash -

echo -e  "Installation de NodeJS >"
sudo apt-get install -y nodejs
nodejs -v

echo -e  "VERSION DE NPM >"
npm version

#Si NPM n'est pas installé à cette étape, entrez les commandes suivantes: 
#npm install -g npm@latest
#sudo apt-get install -y npm
#sudo apt install build-essential
