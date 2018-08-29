pragma solidity ^0.4.20;
/*
  Import the Oraclize contract
  outside of Remix, direct imports from GitHub may not be supported
  instead, use a local import or just paste the Oraclize code in directly
*/
import "./OraclizeI.sol";

contract Template is usingOraclize {
    
    // Define variables
    uint public USDPRICE; // number obtained from random.org
    mapping(bytes32 => bool) validIds; // used for validating Query IDs
    
    // Events used to track contract actions
    event LogOraclizeQuery(string description);
    event LogResultReceived(uint number);

    // Constructor
    function Template() public {
        // set Oraclize proof type
        oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
    }
           
    // Query Oraclize to get random number
// Query Oraclize to get random number
    function getUSDquote() public payable {
        // require ETH to cover callback gas costs
        require(msg.value >= 0.004 ether); // 200,000 gas * 20 Gwei = 0.004 ETH
        // send query
        oraclize_query( 
          "nested", 
          "[URL] ['json(https://api.coinmarketcap.com/v2/ticker/1027/?convert=ETH).data.quotes.USD.price']"
          //"[URL] ['json(https://api.random.org/json-rpc/1/invoke).result.random[\"data\"]', '\\n{\"jsonrpc\": \"2.0\", \"method\": \"generateSignedIntegers\", \"params\": { \"apiKey\": \"00000000-0000-0000-0000-000000000000\", \"n\": 1, \"min\": 1, \"max\": 1000, \"replacement\": true, \"base\": 10 }, \"id\": 14215 }']"
        );        
    }
    
    // Callback function for Oraclize once it retreives the data 
    function __callback(bytes32 queryId, string result, bytes proof) public {
        // only allow Oraclize to call this function
        require(msg.sender == oraclize_cbAddress());
      
        USDPRICE = parseInt(result); 
     
        // log the new number that was obtained
    
    }
    
}
