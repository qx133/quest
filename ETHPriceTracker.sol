pragma solidity ^0.4.19;
/*
  Import the Oraclize contract
  outside of Remix, direct imports from GitHub may not be supported
  instead, use a local import or just paste the Oraclize code in directly
*/
import "./Oraclize.sol";

contract Template is usingOraclize {
    
    // Define variables
    uint public ETHPrice; // number obtained from coinmarketcap

    // Events used to track contract actions
    event LogOraclizeQuery(string description);
    event LogResultReceived(string number);

    // Query Oraclize to get random number
    function getEthPrice() public payable {
        // require ETH to cover callback gas costs
        require(msg.value >= 0.004 ether); // 200,000 gas * 20 Gwei = 0.004 ETH
      
        oraclize_query("URL", "json(https://api.coinmarketcap.com/v2/ticker/1027).data.quotes.USD.price");        
                       
        // log that query was sent
        LogOraclizeQuery("Oraclize query was sent, standing by for the answer..");
    }
    
    // Callback function for Oraclize once it retreives the data 
    function __callback(bytes32 myid, string result) public {
        // only allow Oraclize to call this function
        require(msg.sender == oraclize_cbAddress());

        ETHPrice = parseInt(result); 
      
        // log the new number that was obtained
        LogResultReceived(result); 
    }
    
}
