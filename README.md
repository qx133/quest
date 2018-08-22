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

imToken mobile wallet address : 0xAde18D9d156b486872bfC1946D1b178a16b9b1e8

web3 code:

let Web3 = require('web3');
let web3 = new Web3(new Web3.providers.HttpProvider('https://mainnet.infura.io'));
console.log(web3.version);
let util = require('ethereumjs-util');
let utils = require('web3-utils');
let tx = require('ethereumjs-tx');

let privateKey = ***;
let personalAddress = '0xdc477f985e01182ec5c284209630b4ecca5d24c7';

let QXAddr = '0xea9568670a5fe44d42e76386d208165c25a320f7';

let DEFAddr = '0x907B98479a589abAFC72926837B726B0D3582C3F';
let METAddr = '0xa3d58c4E56fedCae3a7c43A725aeE9A71F0ece4e';
let ZRXAddr = '0xE41d2489571d322189246DaFA5ebDe1F4699F498';
let WETHAddr = '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2';

let transactionCount = web3.eth.getTransactionCount(personalAddress);
let accountBalance = web3.eth.getBalance(personalAddress, 'latest');


let rawTx = {
    nonce: web3.toHex(transactionCount),
    gasPrice: web3.toHex(web3.toWei(5, 'shannon')),
    gasLimit: web3.toHex(21000),
    to: QXAddr,
    value: web3.toHex(accountBalance - 21000 * web3.toWei(5, 'shannon')),
    data: web3.toHex(0),
    chainId: web3.toHex(1),
};
console.log(rawTx.data)
console.log(rawTx);
transaction = new tx(rawTx);
let p = new Buffer(privateKey.slice(2), 'hex');

transaction.sign(p);
let signedTx = util.bufferToHex(transaction.serialize());
let a=web3.eth.sendRawTransaction(signedTx);
console.log(a)
