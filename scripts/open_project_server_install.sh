# Setting up the Open Server as per https://docs.openproject.org/installation-and-operations/installation/docker/

mkdir -p /var/lib/openproject/{pgdata,assets}; \
   docker run --restart=always -d -p 8080:80 --name openproject -e SECRET_KEY_BASE=mysecret \
  -v /var/lib/openproject/pgdata:/var/openproject/pgdata \
  -v /var/lib/openproject/assets:/var/openproject/assets \
  openproject/community:10; \
  ufw allow 8080
