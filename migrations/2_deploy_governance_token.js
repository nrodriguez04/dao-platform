const GovernanceToken = artifacts.require("GovernanceToken");

module.exports = function (deployer) {
  const initialSupply = web3.utils.toWei('1000000', 'ether'); // 1 million tokens
  deployer.deploy(GovernanceToken, initialSupply);
};
