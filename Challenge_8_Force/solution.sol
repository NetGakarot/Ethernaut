// SPDX-License-Identifier: MIT
pragma solidity 0.8.17; 

// Note: selfdestruct only works in solidity version 0.8.18 and lower.

contract Force {
    constructor() payable {}

    function Send(address payable target) external {
        selfdestruct(target);
    }
}

