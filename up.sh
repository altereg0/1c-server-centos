sudo mkdir -p ./volumes/1c-server/home
sudo mkdir -p ./volumes/1c-server/logs

sudo mkdir -p ./volumes/1c-pg/conf
sudo mkdir -p ./volumes/1c-pg/data
sudo mkdir -p ./volumes/1c-pg/log

sudo chown 999 -R ./volumes

sudo docker-compose --compatibilit up -d
#sudo docker-compose up -d
