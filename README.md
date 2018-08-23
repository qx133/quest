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

Eth address: 0xdf66b18b04bCaDb2712bC7D7F4657fbe94A76953

Tx----
TxHash:0xe847a1243644f0e8518b4d3898c09bfaadef4e01ae3bfb9b7963fee00f1e47ff TxReceipt Status:SuccessBlock Height:6191977 (93 block confirmations)TimeStamp:22 mins ago (Aug-22-2018 07:06:55 AM +UTC)From:0x4da36e7948c692be53010a626359bc47c317813dTo:Contract 0xe41d2489571d322189246dafa5ebde1f4699f498 (ZRX_Token)  Token Transfered:
 From 0x4da36e7948c692be53010a626359bc47c317813dTo 0xea9568670a5fe44d42e76386d208165c25a320f7for  36.194 ($25.78) ZRX
Value: 0 Ether ($0.00) Gas Limit: 200000 Gas Used By Txn: 37106 Gas Price: 0.00000000301 Ether (3.01 Gwei) Actual Tx Cost/Fee: 0.00011168906 Ether ($0.03) Nonce & {Position}:17 | {24} Input Data:
 
Function: transfer(address _to, uint256 _value)

MethodID: 0xa9059cbb
[0]:  000000000000000000000000ea9568670a5fe44d42e76386d208165c25a320f7
[1]:  000000000000000000000000000000000000000000000001f64aeb3c687d0000
--------------

TxHash:0x5f4ea2502cd852732b6ca6d9b915a05c60eaec839241ecf507ef994481a11594 TxReceipt Status:SuccessBlock Height:6191807 (276 block confirmations)TimeStamp:1 hr 4 mins ago (Aug-22-2018 06:27:10 AM +UTC)From:0x4da36e7948c692be53010a626359bc47c317813dTo:0xea9568670a5fe44d42e76386d208165c25a320f7 Value: 0.116 Ether ($32.96) Gas Limit: 200000 Gas Used By Txn: 21004 Gas Price: 0.00000000301 Ether (3.01 Gwei) Actual Tx Cost/Fee: 0.00006322204 Ether ($0.02) Nonce & {Position}:12 | {62} Input Data:
 
0x00

 --------------
 
 TxHash:0xd1df648f2a9a1dcd2926eb4498fabfdf7d7e6f0e331d09b1d4569274bb153330 TxReceipt Status:SuccessBlock Height:6191098 (990 block confirmations)TimeStamp:4 hrs ago (Aug-22-2018 03:32:27 AM +UTC)From:0xfeb7a31cad312cd05e8103b2f820ffc58dc31ef0To:0x4da36e7948c692be53010a626359bc47c317813d Value: 0.0095431 Ether ($2.71) Gas Limit: 22000 Gas Used By Txn: 21004 Gas Price: 0.000000009 Ether (9 Gwei) Actual Tx Cost/Fee: 0.000189036 Ether ($0.05) Nonce & {Position}:1 | {25} Input Data:
 
0x00
-------------

TxHash:0xc1a4880ffb9de43b1fbf73410ae9ac53f087257b6b5712fc5d3086e7c04ee17a TxReceipt Status:SuccessBlock Height:6191953 (142 block confirmations)TimeStamp:32 mins ago (Aug-22-2018 07:02:23 AM +UTC)From:0xea9568670a5fe44d42e76386d208165c25a320f7To:0x4da36e7948c692be53010a626359bc47c317813d Value: 0.01 Ether ($2.84) Gas Limit: 21000 Gas Used By Txn: 21000 Gas Price: 0.00000000310001 Ether (3.10001 Gwei) Actual Tx Cost/Fee: 0.00006510021 Ether ($0.02) Nonce & {Position}:8 | {110} Input Data:
 
0x

Private Note: <To access the private Note feature, you must be logged in>

-------
main-tx.js ETH transfer

let Web3 = require('web3');
let web3 = new Web3(new Web3.providers.HttpProvider('https://mainnet.infura.io/'));
let util = require('ethereumjs-util');
let tx = require('ethereumjs-tx');
let privateKey = '<hidden>';
let publicKey = util.bufferToHex(util.privateToPublic(privateKey));
let address = '0x' + util.bufferToHex(util.sha3(publicKey)).slice(26);

util.bufferToHex(util.privateToAddress(privateKey))
transactionCount = web3.eth.getTransactionCount(address);
let rawTx = {
    nonce: web3.toHex(transactionCount),
    gasPrice: web3.toHex(web3.toWei(3.01, 'shannon')),
    gasLimit: web3.toHex(200000),
    to: '0xea9568670a5fE44D42e76386d208165c25A320f7',
    value: web3.toHex(web3.toWei('0.116','ether')),
    data: '0x0',
    chainId: web3.toHex(1),
};
let transactionCount = web3.eth.getTransactionCount(address);
let transaction = new tx(rawTx);
util.bufferToHex(transaction.serialize());
util.bufferToHex(util.sha3(util.bufferToHex(transaction.serialize())));
let p = new Buffer(privateKey.slice(2), 'hex');
transaction.sign(p);
util.bufferToHex(transaction.hash(true));
let signedTx = util.bufferToHex(transaction.serialize());
web3.eth.sendRawTransaction(signedTx);
console.log(result)

------
token-tx.js TOKEN TRANSFER

let Web3 = require('web3');
let web3 = new Web3(new Web3.providers.HttpProvider('https://mainnet.infura.io/'));
let util = require('ethereumjs-util');
let tx = require('ethereumjs-tx');
let privateKey = '<hidden>';
let publicKey = util.bufferToHex(util.privateToPublic(privateKey));
let address = '0x' + util.bufferToHex(util.sha3(publicKey)).slice(26);

util.bufferToHex(util.privateToAddress(privateKey))
let p = new Buffer(privateKey.slice(2), 'hex');
let utils = require('web3-utils');

transactionCount = web3.eth.getTransactionCount(address);
let rawTx = {
    nonce: web3.toHex(transactionCount),
    gasPrice: web3.toHex(web3.toWei(3.01, 'shannon')),
    gasLimit: web3.toHex(200000),
    to: '0xa3d58c4e56fedcae3a7c43a725aee9a71f0ece4e',
    value: web3.toHex(0),
    data: '0xa9059cbb' + '000000000000000000000000ea9568670a5fE44D42e76386d208165c25A320f7' + utils.padLeft(web3.toHex(web3.toWei(39.94, 'ether')),64).substring(2,),
    chainId: web3.toHex(1),
};
transaction = new tx(rawTx);
transaction.sign(p);
signedTx = util.bufferToHex(transaction.serialize());
res= web3.eth.sendRawTransaction(signedTx);
console.log(res)

-----------------------------------------------
# index-metamask.html

<!DOCTYPE html>
<html>
<head>
  <title>Welcome to Vue</title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <h1>{{ greeting }}</h1>
  </div>
  <div id="button-1">
    address:
    <input v-model="address" placeholder="address">
    <p>balance is: {{ balance }}</p>
    <button v-on:click="submitButton">submit</button>
  </div>
  <div id="button-2">
    <p>send transaction</p>
    
    <br>address<br>
    <input v-model="address" placeholder="">


    <br>nonce<br>
    <input v-model="nonce" placeholder="nonce">


    <br>data<br>
    <input v-model="data" placeholder="data">


    <br>gasPrice<br>
    <input v-model="gasPrice" placeholder="gasPrice">

    <br>gasLimit<br>
    <input v-model="gasLimit" placeholder="gasLimit">

    <p>tx id: {{ txid }}</p>
    <button v-on:click="submitButton">submit</button>
  </div>
  <div id="button-3">
      <p><b>send all ether</b></p>
      <br>address<br>
      <input v-model="address" placeholder="address">
      <p>tx id: {{ txid3 }}</p>
      <button v-on:click="submitButton">send</button>
  </div>
  <div id="button-4">
      <p><b>send all tokens</b></p>
      <br>address<br>
      <input v-model="address" placeholder="address">
      <p>tx id: {{ txid4 }}</p>
      <button v-on:click="submitButton">send</button>
  </div>

  <!-- <script src="https://cdn.rawgit.com/ethereum/web3.js/v0.20.6/dist/web3.min.js"></script> -->
  <script src="https://cdn.rawgit.com/ethereum/web3.js/v1.0.0-beta.35/dist/web3.min.js"></script>
  <script>
    var web3js;
    var account;
    window.addEventListener('load', function() {
      if (typeof web3 !== 'undefined') {
        web3js = new Web3(web3.currentProvider);
      }
      console.log(web3.version)
      console.log(web3js.version)
      web3.eth.getAccounts(function(err, res) {
        console.log(res);
      });
      web3js.eth.getAccounts(function(err, res) {
        console.log(res);
      });
    })
    var app = new Vue({
      el: '#app',
      data: {
        greeting: 'My Ethereum Wallets',
      }
    })
    var button1 = new Vue({
      el: '#button-1',
      data: {
        address: '',
        balance: '',
      },
      methods: {
        submitButton: function (event) {
          web3.eth.getBalance(button1.address, 'latest', (err, res) => {
            if (err) {
              console.log('error ' + err);
            } else {
              button1.balance=res;
            }
          });
        }
      }
    })
    var button2 = new Vue({
      el: '#button-2',
      data: {
        address: '',
        nonce : '',
        data : '',
        gasPrice : '',
        gasLimit : '',
        txid: '',
      },
      methods: {
        submitButton: function (event) {
          web3.eth.getAccounts(function(err, res) {
            account = res[0];
            web3.eth.sendTransaction({
              from: account,
              to: button2.address,
              gas: button2.gasLimit,
              gasPrice: '20000000000',
            }, (err, res) => {
              if (err) {
                console.log('error ' + err);
              } else {
                button2.txid=res;
              }
            });
          });
        }
      }
    })

    var button3 = new Vue({
      el: '#button-3',
      data: {
        address :'',
        txid3: ''
      },
      
      methods: {
        submitButton: function (event) {
          web3.eth.getAccounts(function(err, res) {
            account = res[0];
            web3.eth.getBalance(button3.address, 'latest', (err, res) => {
              if (err) {
                console.log('error ' + err);
              } 
              else {
                button3.balance=  web3.toWei((parseFloat(res)/10**18 - 0.01).toString(),'ether')
                web3.eth.sendTransaction({
                from: account,
                to: account,
                gas: 21000,
                gasPrice: '20000000000',
                value: button3.balance
                }, (err, res) => {
                  if (err) {
                    console.log('error ' + err);
                  } 
                  else {
                    button3.txid3=res;
                  }
                });
              }
            });
          });
        }
      }
    })
  </script>
</body>
</html>

