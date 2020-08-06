pragma solidity 0.5.0; 
contract SimpleContract2 
{ 
  uint z; 
  function addition(uint x) public returns (uint y) 
  { 
    z=x+5;  
    y=z; 
  } 
  function difference(uint x) public returns (uint y) 
  { 
    z=x-5;  
    y=z; 
  } 
  function division(uint x) public returns (uint y) 
  { 
    z=x/5;  
    y=z; 
  } 
 
  function currValue() public view returns (uint) 
  { 
    return z; 
  } 
} 
