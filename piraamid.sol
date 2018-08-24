pragma solidity ^0.4.19;

contract piraamid {
    
   
    uint public count;
    uint public totalSum;
    uint public fee;
    uint public balance;

    /*struct User {
        uint tickets;
        uint balance;
    }*/

    address[] users;

    mapping ( address => uint) tickets;

    mapping ( address => uint) balances;

    function buy(uint _noOfTickets) public payable {
        bool flag = false;
        for (uint i = 0;i < users.length; i++) {
            if (users[i] == msg.sender)
            flag = true;
        }
        if (flag!=true) users.push(msg.sender);
        count = count + _noOfTickets;
        tickets[msg.sender] += _noOfTickets;
        totalSum = totalSum + msg.value/100 * 99; // * _noOfTickets/count);
        fee = fee + msg.value/100;
        for (i = 0;i < users.length; i++) {
            balances[users[i]] += (tickets[users[i]] * msg.value/100 * 99)/count;
        }
    }

    function redeem() public {
        balance = (balances[msg.sender] * 90)/100;
        msg.sender.transfer(balance);
        fee += (balances[msg.sender] * 10)/100;
        totalSum = totalSum - balances[msg.sender];
        count -= tickets[msg.sender];
        tickets[msg.sender] = 0;
        balances[msg.sender] = 0;
    }

    function balance() public constant returns (uint balance) {
        return balances[msg.sender] ;
    }
}
