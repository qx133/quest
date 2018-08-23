pragma solidity ^0.4.19;

contract Mortal {
    /* Define variable owner of the type address */
    address public owner;

    /* This function is executed at initialization and sets the owner of the contract */
    constructor () public {
        owner = msg.sender;
    }
}

contract Greeter is Mortal {
    /* Define variable greeting of the type string */
    string public greeting;
    uint256 public count;
    uint256 public count1;

    /* This runs when the contract is executed */
    constructor () public {
        greeting = "hello world";
    }

    /* Main function */
    function greet() public returns (string) {
        count++;
        count1++;
        return greeting;
    }
}
