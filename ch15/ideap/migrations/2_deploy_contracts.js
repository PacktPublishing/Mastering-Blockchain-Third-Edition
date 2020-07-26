var PatentContract = artifacts.require("PatentIdea");  
module.exports = function(deployer) { 
  deployer.deploy(PatentContract); 
}; 
