pragma solidity ^0.5.0;
contract token { 
    mapping (address => uint) public coinBalanceOf;
    event CoinTransfer(address sender, address receiver, uint amount);
 
  /* Initializes contract with initial supply tokens to the creator of the contract */
  function  tokenx(uint supply) public {
        supply = 1000;
        coinBalanceOf[msg.sender] = supply;
    }

  /* Very simple trade function */
    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
        if (coinBalanceOf[msg.sender] < amount) return false;
        coinBalanceOf[msg.sender] -= amount;
        coinBalanceOf[receiver] += amount;
        emit CoinTransfer(msg.sender, receiver, amount);
        return true;
    }
}
