// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LUCRStateChannel {
    address public governance;

    event ChannelOpened(address indexed opener, uint256 blockNum);
    event ChannelClosed(address indexed closer, bytes32 stateRoot, uint256 blockNum);
    event BatchCommitted(bytes32 indexed batchHash, uint256 blockNum);

    modifier onlyGovernance() {
        require(msg.sender == governance, "Not governance");
        _;
    }

    constructor() {
        governance = msg.sender;
    }

    function openChannel() external onlyGovernance {
        emit ChannelOpened(msg.sender, block.number);
    }

    function commitBatch(bytes32 batchHash) external onlyGovernance {
        emit BatchCommitted(batchHash, block.number);
    }

    function closeChannel(bytes32 stateRoot) external onlyGovernance {
        emit ChannelClosed(msg.sender, stateRoot, block.number);
    }
}
