// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// storage slot 0 - locked
// storage slot 1 - ID(32 bytes)
// storage slot 2 - flattening(1 bytes)
// storage slot 2 - denomination(1 bytes)
// storage slot 2 - awkwardness(2 bytes)
// storage slot 3 - data[0](32 bytes)
// storage slot 4 - data[1](32 bytes)
// storage slot 5 - data[2](32 bytes)

// Using foundry cast for accessing storage:
// cast storage "target Contract address" 5 --rpc-url https://eth-sepolia.g.alchemy.com/v2/YOUR_ALCHEMY_KEY

// Now manually extract 16 bytes from what you get from storage 5 and done you got the key.
