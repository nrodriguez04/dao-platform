// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./GovernanceToken.sol";

contract Voting {
    struct Proposal {
        uint id;
        string description;
        uint voteCount;
        bool executed;
    }

    GovernanceToken public token;
    mapping(uint => Proposal) public proposals;
    uint public proposalCount;

    event ProposalCreated(uint id, string description);
    event Voted(uint proposalId, address voter);
    event ProposalExecuted(uint id);

    constructor(address _tokenAddress) {
        token = GovernanceToken(_tokenAddress);
    }

    function createProposal(string memory description) public {
        proposalCount++;
        proposals[proposalCount] = Proposal(proposalCount, description, 0, false);
        emit ProposalCreated(proposalCount, description);
    }

    function vote(uint proposalId) public {
        require(proposals[proposalId].id != 0, "Proposal does not exist");
        require(!proposals[proposalId].executed, "Proposal already executed");
        require(token.balanceOf(msg.sender) > 0, "No voting power");

        proposals[proposalId].voteCount += token.balanceOf(msg.sender);
        emit Voted(proposalId, msg.sender);
    }

    function executeProposal(uint proposalId) public {
        require(proposals[proposalId].id != 0, "Proposal does not exist");
        require(!proposals[proposalId].executed, "Proposal already executed");

        proposals[proposalId].executed = true;
        emit ProposalExecuted(proposalId);
    }
}
