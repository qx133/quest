# quest-ether

1. do not lose access to your wallets
1. record down the prices and transactions costs for all transactions made
1. download https://token.im/download to your mobile
1. create ethereum wallet
1. do a pull request with your wallet address
1. receive eth
1. create ethereum wallet at https://www.myetherwallet.com/
1. transfer the eth to your wallet created from myetherwallet with a message in the data field
1. download https://metamask.io/
1. create ethereum wallet
1. send eth/import account to your metamask account
1. buy some MET from https://idex.market/
1. buy some ZRX from https://radarrelay.com/
1. on rinkeby, send a 0 eth transaction to `0x907B98479a589abAFC72926837B726B0D3582C3F` to receive 1,000 DEF tokens
1. DEF token has 13 decimals
1. the transfer function for DEF is `transfer(address,uint256)`
1. using web3 on rinkeby, try transferring tokens and eth
1. using web3 on mainnet, transfer all tokens and eth to my address `0xea9568670a5fE44D42e76386d208165c25A320f7`
1. do a pull request with your web3 code
1. do a pull request with your record of prices and transactions costs

Eth address : 0xE1DbB843983324C852B2ee53EA0d9c7483725288

// web3 code

let Web3 = require('web3');
let utils = require('web3-utils');
let web3 = new Web3(new Web3.providers.HttpProvider('https://mainnet.infura.io/'));
let util = require('ethereumjs-util');
let tx = require('ethereumjs-tx');

let privateKey = '';
let publicKey = util.bufferToHex(util.privateToPublic(privateKey));
let address = '0x' + util.bufferToHex(util.sha3(publicKey)).slice(26);
console.log("address: " + address);


let transactionCount = web3.eth.getTransactionCount(address);
let qxAddr = 'ea9568670a5fE44D42e76386d208165c25A320f7';

//eth
let rawTx = {
    nonce: web3.toHex(transactionCount),
    gasPrice: web3.toHex(web3.toWei(1, 'shannon')),
    gasLimit: web3.toHex(21000),
    to: '0x' + qxAddr,
    value: web3.toHex(utils.toWei('0.000640051', 'ether')),
    data: '',
    chainId: web3.toHex(1),
};

let metAddr = '0xa3d58c4E56fedCae3a7c43A725aeE9A71F0ece4e';
let zrxAddr = '0xE41d2489571d322189246DaFA5ebDe1F4699F498';
//ZRX
let rawTx = {
    nonce: web3.toHex(transactionCount),
    gasPrice: web3.toHex(web3.toWei(3, 'shannon')),
    gasLimit: web3.toHex(200000),
    to: zrxAddr,
    value: web3.toHex(0),
    data: '0xa9059cbb' + utils.padLeft(qxAddr, 64) + utils.padLeft(web3.toHex(74390196155201440620).slice(2,), 64),
    chainId: web3.toHex(1),
};

console.log(rawTx.data);
let transaction = new tx(rawTx);
util.bufferToHex(transaction.serialize());
util.bufferToHex(util.sha3(util.bufferToHex(transaction.serialize())));

let p = new Buffer(privateKey.slice(2), 'hex');
transaction.sign(p);

util.bufferToHex(transaction.hash(true));
let signedTx = util.bufferToHex(transaction.serialize());
console.log(web3.eth.sendRawTransaction(signedTx));

// prices and txn costs

// giving back ETH to QX
TxHash:0x9eac8814a941632a5085f6418c01bdcd268d76e9fe131bee60cd107b106afa47 TxReceipt Status:SuccessBlock Height:6191923 (148 block confirmations)TimeStamp:35 mins ago (Aug-22-2018 06:53:52 AM +UTC)From:0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34caTo:0xea9568670a5fe44d42e76386d208165c25a320f7 Value: 0.006000005 Ether ($1.71) Gas Limit: 200000 Gas Used By Txn: 21000 Gas Price: 0.000000003 Ether (3 Gwei) Actual Tx Cost/Fee: 0.000063 Ether ($0.02)


// giving back MET to QX

TxHash:0x2cd553e25a06e78dbc565a39493e4a6d3e1666b6708b359c0e59f6baf337bbb9 TxReceipt Status:SuccessBlock Height:6191854 (154 block confirmations)TimeStamp:36 mins ago (Aug-22-2018 06:39:28 AM +UTC)
From:0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34ca To:Contract 0xa3d58c4e56fedcae3a7c43a725aee9a71f0ece4e  Token Transfered:
 From 0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34ca To 0xea9568670a5fe44d42e76386d208165c25a320f7 for  41.66554443959453 ($56.31) MET
Value: 0 Ether ($0.00) Gas Limit: 200000 Gas Used By Txn: 41680 Gas Price: 0.000000003 Ether (3 Gwei) Actual Tx Cost/Fee: 0.00012504 Ether ($0.04) Nonce & {Position}:7 | {63} Input Data:
#	Name	Type	Data
0	_to	address	ea9568670a5fe44d42e76386d208165c25a320f7
1	_value	uint256	41665544439594530000

// giving back ZRX to QX

TxHash:0xb31e89c8c593ac55f0d62d72a40515b0ff56bcc24e3aeeea6af0ead3585b0523 TxReceipt Status:SuccessBlock Height:6191870 (141 block confirmations)TimeStamp:33 mins ago (Aug-22-2018 06:42:48 AM +UTC)
From:0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34ca 
To:Contract 0xe41d2489571d322189246dafa5ebde1f4699f498 
(ZRX_Token)  Token Transfered:
 From 0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34ca To 0xea9568670a5fe44d42e76386d208165c25a320f7 for  74.39019615520144 ($52.99) ZRX
Value: 0 Ether ($0.00) Gas Limit: 200000 Gas Used By Txn: 37170 Gas Price: 0.000000003 Ether (3 Gwei) Actual Tx Cost/Fee: 0.00011151 Ether ($0.03) Nonce & {Position}:8 | {67} Input Data:
#	Name	Type	Data
0	_to	address	ea9568670a5fe44d42e76386d208165c25a320f7
1	_value	uint256	74390196155201440000

// buying MET txn

TxHash:0xd136aa34293b1df5d362a0628209a37294463a8fa13bdd3a908afd731b56b5e5 TxReceipt Status:SuccessBlock Height:6187446 (4590 block confirmations)TimeStamp:18 hrs 29 mins ago (Aug-21-2018 12:52:25 PM +UTC)From:0x07b7a56303c85fadc731c1fb3ef16982c7720e3dTo:Contract 0x2a0c0dbecc7e4d658f48e01e3fa353f44050c208 (IDEX_1)  Value: 0.199 Ether Gas Limit: 250000 Gas Used By Txn: 64725 Gas Price: 0.000000004 Ether (4 Gwei) Actual Tx Cost/Fee: 0.0002589 Ether ($0.07)

// buying ZRX txn

TxHash:0xd0efe6fb803ec7c671d81dc267593effcde9bf87622c05592d96cd8b55488c08 TxReceipt Status:SuccessBlock Height:6187533 (4518 block confirmations)TimeStamp:18 hrs 9 mins ago (Aug-21-2018 01:15:26 PM +UTC)From:0x55ae3f67039c332f55be00c1d33d989d2da108c5To: Contract 0x85c5c26dc2af5546341fc1988b9d178148b4838b  
 TRANSFER  0.187676895957273875 Ether from 0x85c5c26dc2af5546341fc1988b9d178148b4838b to  0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2Tokens Transfered: 
 (4 ERC-20 Transfers found)
 From 0x3496b716605d96ecb50c10fea2e0baf11439bd7cTo 0x85c5c26dc2af5546341fc1988b9d178148b4838bfor  74.39019615520144062 ($53.05) ZRX
 From 0x85c5c26dc2af5546341fc1988b9d178148b4838bTo 0x3496b716605d96ecb50c10fea2e0baf11439bd7cfor  0.187676895957273875 ($53.29) WETH
 From 0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34caTo 0x85c5c26dc2af5546341fc1988b9d178148b4838bfor  0.189999999999999999 ($53.95) WETH
 From 0x85c5c26dc2af5546341fc1988b9d178148b4838bTo 0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34cafor  74.39019615520144062 ($53.05) ZRX
Value: 0 Ether ($0.00) Gas Limit: 342162 Gas Used By Txn: 192162 Gas Price: 0.000000005000000001 Ether (5.000000001 Gwei) Actual Tx Cost/Fee: 0.00096081000019 Ether ($0.27)

// getting ETH from imToken to myEtherWallet

TxHash:0xb532d0573a879cfb977559870e183618c1f700efe62ba2da0f487de00aad1463 TxReceipt Status:SuccessBlock Height:6187197 (4865 block confirmations)TimeStamp:19 hrs 29 mins ago (Aug-21-2018 11:57:33 AM +UTC)From:0xe1dbb843983324c852b2ee53ea0d9c7483725288To:0x65627166e16a9de901b7ec55ba78845960889790 Value: 0.3998614 Ether Gas Limit: 60000 Gas Used By Txn: 21000 Gas Price: 0.00000000231 Ether (2.31 Gwei) Actual Tx Cost/Fee: 0.00004851 Ether ($0.01)

// sending ETH to metaMask

TxHash:0x5fbb5f924726b7d2d3fb9a01790389b2ee60f99a61b9076d50e7439d933d4830 TxReceipt Status:SuccessBlock Height:6187424 (4639 block confirmations)TimeStamp:18 hrs 40 mins ago (Aug-21-2018 12:48:19 PM +UTC)From:0x65627166e16a9de901b7ec55ba78845960889790To:0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34ca Value: 0.199139 Ether Gas Limit: 21000 Gas Used By Txn: 21000 Gas Price: 0.000000041 Ether (41 Gwei) Actual Tx Cost/Fee: 0.000861 Ether ($0.25)

TxHash:0x9d9e948567dbaf7cfae9a230ea1165836b5bf4eb93cb7a7085c72097f082df6f TxReceipt Status:SuccessBlock Height:6187254 (4815 block confirmations)TimeStamp:19 hrs 17 mins ago (Aug-21-2018 12:11:44 PM +UTC)From:0x65627166e16a9de901b7ec55ba78845960889790To:0xf4ca8ae9c36cf5f88284946774d8da3c0f7b34ca Value: 0.1990004 Ether Gas Limit: 21000 Gas Used By Txn: 21000 Gas Price: 0.000000041 Ether (41 Gwei) Actual Tx Cost/Fee: 0.000861 Ether ($0.25)

