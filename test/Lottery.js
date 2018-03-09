
var LotteryArt = artifacts.require("./Lottery.sol");

contract('Lottery', function(accounts) {


  var ticketPrice = 1
  var ticketCount = 20

  it("creator can set ticket price and count", async function() {
    var instance = await LotteryArt.deployed()
    await instance.activate(web3.toWei(ticketPrice), ticketCount)
    var cTicketPrice = await instance.getPrice.call()
    var cTicketCount = await instance.getCount.call()
    assert.equal(ticketPrice,web3.fromWei(cTicketPrice))
    assert.equal(ticketCount,cTicketCount)
  });

  it("can buy tickets", async function() {
    var instance = await LotteryArt.deployed()
    await instance.buy({value:web3.toWei(ticketPrice)})
    var myTickets = await instance.myTickets.call()
    assert.equal(1,myTickets)
  });

});
