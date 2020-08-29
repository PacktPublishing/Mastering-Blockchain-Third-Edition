pragma solidity ^0.4.0;
contract TestStruct {
struct Trade
{
uint tradeid;
uint quantity;
uint price;
string trader;
}
//This struct can be initialized and used as below
Trade tStruct = Trade({tradeid:123, quantity:1, price:1, trader:"equinox"});
}