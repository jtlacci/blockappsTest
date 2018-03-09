pragma solidity ^0.4.18;

contract Lottery {

  uint ticketPrice;
  uint ticketCount;

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


}
