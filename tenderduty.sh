sudo apt update && sudo apt upgrade -y

sudo apt install curl build-essential git wget jq make gcc tmux htop nvme-cli pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y

apt install apt-transport-https ca-certificates curl software-properties-common -y && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && \
apt update && \
apt-cache policy docker-ce && \
sudo apt install docker-ce -y && \
docker --version

cd ~
mkdir -p tenderduty && cd tenderduty
docker run --rm ghcr.io/blockpane/tenderduty:latest -example-config >config.yml

sed -i s/Osmosis/$name/ ~/tenderduty/config.yml
sed -i s/osmosis-1/$chain_id/ ~/tenderduty/config.yml
sed -i s/osmovaloper1xxxxxxx.../$valop_addr/ ~/tenderduty/config.yml
sed -i s/'tcp:\/\/localhost:26657'/$rpc/ ~/tenderduty/config.yml
sed -i s/'https:\/\/some-other-node:443'/$rpc/ ~/tenderduty/config.yml
sed -i s/'5555555555:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'/$token/ ~/tenderduty/config.yml
sed -i "s/'enabled: no'/'enabled: yes'/" ~/tenderduty/config.yml
sed -i "s/https://discord.com/api/webhooks/999999999999999999/zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz/''/" ~/tenderduty/config.yml
sed -i "s/aaaaaaaaaaaabbbbbbbbbbbbbcccccccccccc/''/" ~/tenderduty/config.yml
sed -i "s/-666666666/''/" ~/tenderduty/config.yml


docker run -d --name tenderduty -p "8888:8888" -p "28686:28686" --restart unless-stopped -v $(pwd)/config.yml:/var/lib/tenderduty/config.yml ghcr.io/blockpane/tenderduty:latest
