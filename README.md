# quest

1. [quest-ether](https://github.com/qx133/quest#quest-ether)
1. [quest-my-eth-wallet](https://github.com/qx133/quest#quest-my-eth-wallet)
1. [quest-solidity-ci](https://github.com/qx133/quest#quest-solidity-ci)
1. [quest-hello-solidity](https://github.com/qx133/quest#quest-hello-solidity)
1. [quest-piraamid](https://github.com/qx133/quest#quest-piraamid)
1. [quest-erc20](https://github.com/qx133/quest#quest-erc20)
1. [quest-honeypot](https://github.com/qx133/quest#quest-honeypot)
1. [quest-re-entrancy](https://github.com/qx133/quest#quest-re-entrancy)
1. [quest-ico](https://github.com/qx133/quest#quest-ico)
1. [quest-oraclize](https://github.com/qx133/quest#quest-oraclize)

## quest-ether

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

## quest-my-eth-wallet

1. use web3 library functions
1. browser based gui wallet similar to myetherwallet
1. functional on rinkeby testnet
1. able to send eth to another address with optional input of nonce, data, gasPrice, gasLimit
1. able to send all eth to another address
1. able to send any token to another address
1. able to create contract
1. able to show balances of eth and def token
1. able to call smart contract functions
1. do a pull request with your code

## quest-solidity-ci

1. refer to https://github.com/QX-Lee/test to see how a repo can be setup
1. fork repo https://github.com/qx133/solidity-ci
1. clone repo locally
1. import sample project from truffle `truffle unbox metacoin`
1. run `yarn install`
1. run `yarn test` to ensure all the tests pass and a coverage report is generated
1. setup circleci on github
1. setup codecov on github
1. create a branch and do a pull request

## quest-hello-solidity

1. replace your truffle sample project with `helloworld.sol`
1. add tests and target 100% coverage
1. create a branch and do a pull request

## quest-piraamid

1. you can use remix, no ui and truffle tests are required
1. implement in solidity the following game
1. users can spend eth to buy tickets
1. these tickets start with a value of 0 eth
1. when the ticket is bought, 99% of the eth is distributed to all tickets
1. the remaining 1% is collected as fee
1. a user can redeem his tickets anytime but he cannot redeem a portion of his tickets
1. when a user redeems his tickets for eth, levy a 10% fee
1. the 10% fee is distributed to users proportional to their tickets
1. upload your code, create a branch and do a pull request to this repo

## quest-erc20

1. implement a erc20 compliant token by importing from https://github.com/OpenZeppelin/openzeppelin-solidity
1. token should be burnable
1. token should have 13 decimals
1. assign yourself all the 1 million tokens
1. write tests in solidity
1. upload your code for ci to run
1. deploy on rinkeby testnet
1. indicate your token address, create a branch and do a pull request

## quest-honeypot

1. create a contract to make the [honeypot](https://etherscan.io/address/0x13c547Ff0888A0A876E6F1304eaeFE9E6E06FC4B#code) possible
1. upload your code, create a branch and do a pull request to this repo

## quest-re-entrancy

1. create a contract to exploit the [re-entrancy bug](https://rinkeby.etherscan.io/address/0x22bd3028f77c9b27ab35d3b09ccc56129c9d7013#code)
1. upload your code, create a branch and do a pull request to this repo

## quest-ico

1. implement in solidity the following ico
1. functional on rinkeby testnet
1. ico starts 5 minutes from deployment
1. ico ends 5 hours from deployment
1. only whitelisted addresses can join the ico
1. eth and def can be used to join the ico
1. 100,000 of your erc20 token is to be sold
1. price function for eth is first 1 eth = 10,000 token then 1 eth = 5,000 token afterwards
1. price function for def is first 1,000 def = 10,000 token then 1,000 def = 5,000 token afterwards
1. events must be logged for audit trail of participants
1. once funds are received, immediately send to your owner address for safekeeping
1. owner can stop the ico anytime
1. deploy ico
1. move 100,000 of your erc20 token to the ico
1. buy out your ico with 1.5 eth and the remaining in def
1. post your contract address, upload your code, create a branch and do a pull request

## quest-oraclize

1. for reference https://medium.com/coinmonks/using-apis-in-your-ethereum-smart-contract-with-oraclize-95656434292e
1. test out oraclize queries
1. implement get random number using oraclize in solidity
1. implement get ethusd using oraclize in solidity
1. deploy in rinkeby
1. post your contract address, upload your code, create a branch and do a pull request
