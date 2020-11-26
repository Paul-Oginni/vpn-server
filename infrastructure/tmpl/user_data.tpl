#cloud-config
#
#
write_files:
- encoding: b64
  content: "test"
  owner: ubuntu:ubuntu
  path: /etc/wireguard
  permissions: '0644'
- content: |
    [Interface]
    Address = 10.0.0.2/32
    PrivateKey = {private_key} 
    ListenPort = {listen_port}

    [Peer]
    PublicKey = {public_key}
    Endpoint = 	{endpoint}
    AllowedIPs = 10.0.0.1/24
    PersistentKeepalive = 25

runcmd:
 - wg genkey | tee server_private_key | wg pubkey > /etc/wireguard/server_public_key
 - wg genkey | tee client_private_key | wg pubkey > /ets/wireguard/client_public_key

