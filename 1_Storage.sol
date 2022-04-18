// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {

    uint256 consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    bool public OP;
    uint256 public coinFlip;



  constructor() public {
    consecutiveWins = 0;
  }

  function flip(uint256 _number) public returns (bool) {
    uint256 blockValue = uint256(_number - 1);


    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    coinFlip = blockValue/FACTOR;
    bool side = coinFlip == 1 ? true : false;
    OP = side;

    if (side == OP) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}
