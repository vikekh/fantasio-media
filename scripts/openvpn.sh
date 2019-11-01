 
ADDRESS=
CIPHER=AES-256-CBC
COMMON_NAME=
CLIENT_NAME=
USER=
GROUP=

docker-compose run --rm openvpn ovpn_genconfig -u "udp://${ADDRESS}" -C $CIPHER
docker-compose run --rm openvpn ovpn_initpki
docker-compose run --rm openvpn easyrsa build-client-full $CLIENT_NAME
sudo chown $USER:$GROUP -R ~/.openvpn
docker-compose run --rm openvpn ovpn_getclient $CLIENT_NAME > "${CLIENT_NAME}.ovpn"