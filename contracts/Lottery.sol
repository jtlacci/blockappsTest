pragma solidity ^0.4.18;

contract Lottery {SimpleStorage

  uint ticketPrice;
  uint ticketCount;

  mapping(address => uint) userTickets;

  bytes[] tickets;

  function activate(uint _price, uint _count){
    ticketPrice = _price;
    ticketCount = _count;
  }

  function getPrice() returns(uint price){
    return ticketPrice;
  }
  function getCount() returns(uint count){
    return ticketCount;
  }

  function buy(){
    address user = msg.sender
    require(msg.value == ticketPrice);
    // adds address to ticket array
    tickets.push(user);
    //increment user's tickets
    userTickets[user]+= 1;
  }


}
