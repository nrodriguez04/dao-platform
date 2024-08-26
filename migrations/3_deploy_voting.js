const Voting = artifacts.require("Voting");

module.exports = function (deployer, network, accounts) {
  const governanceTokenAddress = "0x47faB9B59a921E8a09222e1Bba081BB5629e8872"; // Replace with actual address
  deployer.deploy(Voting, governanceTokenAddress);
};
