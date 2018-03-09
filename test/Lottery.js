var Lottery = artifacts.require("./Lottery.sol");

contract('Lottery', function(accounts) {

  it("creator can set ticket price and count", async function() {
    var instance = await Lottery.deployed()
    var ticketPrice = 1
    var ticketCount = 20
    await instance.activate(web3.toWei(ticketPrice), ticketCount)
    var cTicketPrice = await instance.getPrice.call()
    var cTicketCount = await instance.getCount.call()
    assert.equal(ticketPrice,web3.fromWei(cTicketPrice))
    assert.equal(ticketCount,cTicketCount)
  });

});
