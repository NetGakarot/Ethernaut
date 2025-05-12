// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solution:
// Use foundry cast
// cast storage "target Contract address" 1 \
  --rpc-url https://eth-sepolia.g.alchemy.com/v2/YOUR_ALCHEMY_KEY
// This will read the storage slot 1 which consist of password.
// Dont use this trick for unethical means.


contract Vault {
    bool public locked;
    bytes32 private password;

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
        }
    }
}
