pragma solidity ^0.4.0;
contract simpleIOT {
uint roomrent = 10;
event roomRented(bool returnValue);
function getRent (uint8 x) public returns (bool) {
if (x == roomrent) {
emit roomRented(true);
return true;
}
}
