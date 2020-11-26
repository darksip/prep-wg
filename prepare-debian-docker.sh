DEBIAN_FRONTEND=noninteractive
# try upgrade kernel before
apt update
apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade &&
apt install ldnsutils -y  &&
unlink /etc/localtime &&
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime &&
timedatectl

apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common git

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

echo "deb http://deb.debian.org/debian/ buster-backports main" > /etc/apt/sources.list.d/buster-backports.list

apt update && apt upgrade -y
