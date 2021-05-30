# Install the elastic search
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
apt update
apt install elasticsearch

#Enable security 
echo "#Enable security
xpack.security.enabled: true" >> /etc/elasticsearch/elasticsearch.yml

#Create the password for existing users
sudo /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto

#Create the cert to enable https
sudo /usr/share/elasticsearch/bin/elasticsearch-certutil ca

#Create cert for users 
bin/elasticsearch-certutil cert --ca /path/to/your/ca --pem


#Enable SSL certification   
echo "# Enable SSL certification 
xpack.security.http.ssl.enabled: true
xpack.security.http.ssl.keystore.path: /usr/share/elasticsearch/elastic-certificates.p12 
xpack.security.http.ssl.truststore.path: /usr/share/elasticsearch/elastic-certificates.p12" >> /etc/elasticsearch/elasticsearch.yml

#Start the es db
sudo systemctl start elasticsearch
