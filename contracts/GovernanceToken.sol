// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GovernanceToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("GovernanceToken", "GT") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);
    }

    // Additional functions
}
