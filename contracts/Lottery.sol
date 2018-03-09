pragma solidity ^0.4.18;

contract Lottery {

  uint ticketPrice;
  uint ticketCount;

  mapping(address => uint) userTickets;

  address[] tickets;

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

  function buy() payable {
    require(checkSold());
    address user = msg.sender;
    require(msg.value == ticketPrice);
    // adds address to ticket array
    tickets.push(user);
    //increment user's tickets
    userTickets[user]+= 1;
  }

  function myTickets() returns(uint tickets){
    return userTickets[msg.sender];
  }

  function checkSold() private returns(bool success){
    if(tickets.length >= ticketCount +1){
      //end game
      return true;
    }
    return true;
  }

}
