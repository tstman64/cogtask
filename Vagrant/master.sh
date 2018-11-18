apt-get -y update
apt-get -y install chrony
systemctl enable chrony
systemctl restart chrony
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-get -y update
apt-get -y install docker-ce
systemctl enable docker
cat > /etc/docker/daemon.json <<EOF
{
  "insecure-registries" : ["192.168.18.10:5000"]
}
EOF
systemctl restart docker
touch /root/master
docker run --rm -d -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
docker run -d --publish 5000:5000 --restart=always --name registry -v /opt/registry:/var/lib/registry registry:2
docker swarm init --advertise-addr 192.168.18.10
docker swarm join-token worker | grep docker > /vagrant/token
docker run --name docker-nginx -p 8000:80 -d -v ~/docker-nginx/html:/usr/share/nginx/html nginx

