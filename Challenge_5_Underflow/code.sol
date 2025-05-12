// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Solution:
// contract.transfer("address",21)
// As in solidity 0.6.0 underflow error was passed silently so require(balances[msg.sender] - _value >= 0); will do 20 - 21.
// Hence creating free tokens.

contract Token {
    mapping(address => uint256) balances;
    uint256 public totalSupply;

    constructor(uint256 _initialSupply) public {
        balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
