pragma solidity ^0.4.20;
/*
  Import the Oraclize contract
  
  Outside of Remix, direct imports from GitHub may not be supported.
  Instead, use a local import or just paste the Oraclize code in directly
*/
import "./OraclizeI.sol";

contract Coinprice is usingOraclize {
    
    // Define variables
    uint public USDPrice; // number obtained from random.org

    // Constructor
    function Template() public  {
        // do any setup here
    }
    
    // Query Oraclize to get random number
    function getPriceOfEther() public payable {
        // require ETH to cover callback gas costs
        require(msg.value >= 0.004 ether); // 200,000 gas * 20 Gwei = 0.004 ETH
      
        // send query
        bytes32 queryId = oraclize_query( 
          "nested", 
          "[URL] ['json(https://api.coinmarketcap.com/v2/ticker/1027/).data.quotes.USD.price']"
        );
    }
    
    // Callback function for Oraclize once it retreives the data 
    function __callback(bytes32 queryId, string result, bytes proof) public {
        // only allow Oraclize to call this function
        require(msg.sender == oraclize_cbAddress());
          
        // set random number, result is of the form: [268]
        // if we also returned serialNumber, form would be "[3008768, [268]]"
        USDPrice = parseInt(result); 
    }
   
}
