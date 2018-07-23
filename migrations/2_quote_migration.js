var QuoteRegistry = artifacts.require("./QuoteRegistry.sol");

module.exports = function(deployer) {
  deployer.deploy(QuoteRegistry);
  
};
