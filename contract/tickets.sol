pragma solidity ^0.4.18;
contract HelloWorld {
 
 
 struct user{
     address sender;
     uint balance;
     uint ticket;
 }
 
 user[] public users;

 address public owner;
 uint256 public totalTickets = 0; 
//  uint256 sumBalance = 0;

 constructor() public {
     owner = msg.sender;
 }
 user userA;
 function buy() public payable{  //buy tickets
    userA.sender = msg.sender;
    userA.ticket = msg.value;
    users.push(userA);
    
    totalTickets += userA.ticket;
    
    uint totalUsers = users.length;
    for(uint itr=0;itr< totalUsers; itr++ )
        users[itr].balance += 99*msg.value*users[itr].ticket/(totalTickets*100);
  
 }
 
 function redeem() public payable{
     uint totalUsers = users.length;
     for(uint32 itr =0 ; itr<totalUsers; itr++)
     {
         if (users[itr].sender == msg.sender){
             owner.transfer(10*users[itr].balance/100);
             msg.sender.send(90*users[itr].balance/100);
             totalTickets -= users[itr].ticket;
             users[itr].balance = 0;
             users[itr].ticket = 0;
         }
     }
 }
 

 
 
}
