pragma solidity ^0.5.0;
contract PatentIdea {
  mapping (bytes32 => bool) private hashes;
  bool alreadyStored;
  int tracker=0;
  event ideahashed(bool);
  function saveHash(bytes32 hash) private {
    hashes[hash] = true;
  }
  function SaveIdeaHash(string memory idea) public returns (bool){
    bytes32 hashedIdea = HashtheIdea(idea);
   if (alreadyHashed(HashtheIdea(idea)))  {
       alreadyStored = true;
       emit ideahashed(false);
       return alreadyStored;
    }
       saveHash(hashedIdea);
          tracker = tracker+1;
       emit ideahashed(true);
  }
  function alreadyHashed(bytes32 hash) private view returns(bool) {
    return hashes[hash];
  }
  function isAlreadyHashed(string memory idea) public view returns (bool) {
    bytes32 hashedIdea = HashtheIdea(idea);
    return alreadyHashed(hashedIdea);
  }
   function HashtheIdea(string memory idea) private pure returns (bytes32) {
      return  bytes32(keccak256(abi.encodePacked(idea)));
  }
    function getTracker() public view returns (int) {
      return tracker;
  }
}