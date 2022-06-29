echo "=================================================="
echo -e "\033[0;35m"
echo " | \ | |         | |    (_)   | |  ";
echo " |  \| | ___   __| | ___ _ ___| |_ ";
echo " |     |/ _ \ / _  |/ _ \ / __| __| ";
echo " | |\  | (_) | (_| |  __/ \__ \ |_ ";
echo " |_| \_|\___/ \__,_|\___|_|___/\__| ";
echo -e "\e[0m"
echo "=================================================="

sleep 2

sudo systemctl stop kujirad

kujirad tendermint unsafe-reset-all --home ~/.kujira/
SEEDS="5a70fdcf1f51bb38920f655597ce5fc90b8b88b8@136.244.29.116:41656"
PEERS="112bb03a8f3f04bdc3aa43939cd25ee33749b74f@135.181.253.190:13657,f6d0d3ac0c748a343368705c37cf51140a95929b@146.59.81.204:36657,e65c2e27ea06b795a25f3ce813ed2062371705b8@213.239.212.121:13657,35af92154fdb2ac19f3f010c26cca9e5c175d054@65.108.238.61:27656,9813378d0dceb86e57018bfdfbade9d863f6f3c8@3.38.73.119:26656,ccffabe81f2de8a81e171f93fe1209392bf9993f@65.108.234.59:26656,7878121e8fa201c836c8c0a95b6a9c7ac6e5b101@141.95.151.171:26656,0743497e30049ac8d59fee5b2ab3a49c3824b95c@198.244.200.196:26656,d24ee4b38c1ead082a7bcf8006617b640d3f5ab9@91.196.166.13:26656,092617bcf66bc91118225b7794fd0acf4202d92a@107.181.244.202:20656,5d0f0bc1c2d60f1d273165c5c8cefc3965c3d3c9@65.108.233.175:26656,5a70fdcf1f51bb38920f655597ce5fc90b8b88b8@136.244.29.116:41656"
sed -i -e "s/^seeds *=.*/seeds = \"$SEEDS\"/; s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.kujira/config/config.toml

sudo systemctl restart kujirad && sudo journalctl -u kujirad -f -o cat
