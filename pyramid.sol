pragma solidity ^0.4.24;
contract Pyramid {

    ///Constants
    uint constant public ticketPriceInWei = 10 ** 18;
    uint constant public ticketSaleFeePercentage = 1;
    uint constant public ticketRedemptionFeePercentage = 10;
    address public owner;
    
    ///bookkeeping
    address[] public listOfTicketOwners;
    mapping (address => uint) public ticketsOwnedBy;
    mapping (address => uint) public balanceOf;
    uint public totalTickets = 0;
    
    //Create a new contract
    constructor() public {
        owner = msg.sender;
    }

    //Increase ticket ownership count, return remainder to sender
    //Payout owner their fee
    //Update balance of every token owner
    function buyTicket() public payable {
        uint numTicketsBought = msg.value/ticketPriceInWei;
        totalTickets +=numTicketsBought;
        ticketsOwnedBy[msg.sender] += numTicketsBought;
        //Send back remainder
        msg.sender.transfer(msg.value%ticketPriceInWei);
        //Add message sender to list of token owners
        bool isContainedInArray = false;
        uint arrayLength = listOfTicketOwners.length;
        for(uint i = 0; i < arrayLength; i++) {
            if (listOfTicketOwners[i] == msg.sender) {
                isContainedInArray = true;
            }
        }
        if (!isContainedInArray) {
            listOfTicketOwners.push(msg.sender);
        }
        //Pay owner's fee
        owner.transfer(ticketSaleFeePercentage*ticketPriceInWei*numTicketsBought/100);
        
        //Increase balance of every token owner
        arrayLength = listOfTicketOwners.length;
        for(uint j = 0; j < arrayLength; j++) {
            address ownerAddress  = listOfTicketOwners[j];
            balanceOf[ownerAddress] += ticketsOwnedBy[ownerAddress]*(100 - ticketSaleFeePercentage)*ticketPriceInWei*numTicketsBought/100/totalTickets;
        }
    }
    
    //Pay owner the fee
    //Pay sender their balance minus fee
    //+Bookkeeping
    function redeemAllTickets() public {
        owner.transfer(ticketRedemptionFeePercentage*balanceOf[msg.sender]/100);
        msg.sender.transfer((100 - ticketRedemptionFeePercentage)*balanceOf[msg.sender]/100);
        balanceOf[msg.sender] = 0;
        ticketsOwnedBy[msg.sender] = 0;
    }
}