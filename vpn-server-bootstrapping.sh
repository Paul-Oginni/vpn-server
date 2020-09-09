# Intended for use with Ubuntu VPN server

# Install WireGuard on the VPN server
add-apt-repository ppa:wireguard/wireguard
apt-get update
apt-get install wireguard-dkms wireguard-tools linux-headers-$(uname -r)

# Generate server and client keys
Umask 077
wg genkey | tee server_private_key | wg pubkey > server_public_key
wg genkey | tee client_private_key | wg pubkey > client_public_key

# Generate server config

