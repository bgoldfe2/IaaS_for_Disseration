# First setup up the Ubuntu UFW firewall
# if needed reset to defaults below two lines
# sudo ufw default deny incoming
# sudo ufw default allow outgoing

# Install Docker as per https://docs.docker.com/engine/install/ubuntu/

sudo apt-get remove docker docker-engine docker.io containerd runc; \
   sudo apt-get update; \
   sudo apt-get install \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common; \
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -; \
   sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"; \
   sudo apt-get update; \
   sudo apt-get install docker-ce docker-ce-cli containerd.io; \
   sudo systemctl enable docker   

