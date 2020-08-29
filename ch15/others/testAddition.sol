pragma solidity ^0.4.2;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Addition.sol";
contract TestAddition {
function testAddition() public {
Addition adder = Addition(DeployedAddresses.Addition());
adder.addx(100,100);
uint returnedResult = adder.retrievex();
uint expected = 200;
Chapter 15
[ 499 ]
Assert.equal(returnedResult, expected, "should result 200");
}