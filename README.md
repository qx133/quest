# quest

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
