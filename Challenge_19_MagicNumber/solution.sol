// Solution:
// Run this using foundry.
// Save this code in script/Deploy.s.sol>
// Run this using cast like this - forge script script/Deploy.s.sol:Deploy \
  --rpc-url https://eth-sepolia.g.alchemy.com/v2/<alchemy-key> \
  --private-key 0x<-private-key-for-running on testnet> \
  --broadcast



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        // Deploy raw bytecode
        bytes memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3";
        address deployed;

        assembly {
            deployed := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("Deployed contract at:", deployed);

        vm.stopBroadcast();
    }
}

