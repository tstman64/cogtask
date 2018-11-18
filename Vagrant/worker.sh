apt-get -y update
apt-get -y install chrony
systemctl enable chrony
systemctl restart chrony
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-get -y update
apt-get -y install docker-ce
touch /root/worker
systemctl enable docker
cat > /etc/docker/daemon.json <<EOF
{
  "insecure-registries" : ["192.168.18.10:5000"]
}
EOF
systemctl restart docker
cat /vagrant/token | sh
